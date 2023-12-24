package com.dtstep.lighthouse.insights.controller;

import com.dtstep.lighthouse.common.util.DateUtil;
import com.dtstep.lighthouse.common.util.StringUtil;
import com.dtstep.lighthouse.commonv2.constant.SystemConstant;
import com.dtstep.lighthouse.insights.dto.UserLoginParam;
import com.dtstep.lighthouse.commonv2.insights.ResultCode;
import com.dtstep.lighthouse.commonv2.insights.ResultData;
import com.dtstep.lighthouse.insights.modal.User;
import com.dtstep.lighthouse.insights.service.SystemEnvService;
import com.dtstep.lighthouse.insights.service.UserService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@ControllerAdvice
public class LoginController {

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    private SystemEnvService systemEnvService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    private UserService userService;

    @RequestMapping("/user/login")
    public ResultData<Map<String,String>> login(@Validated @RequestBody UserLoginParam user) {
        User dbUser = userService.queryByUserName(user.getUsername());
        if(dbUser == null || !passwordEncoder.matches(user.getPassword(),dbUser.getPassword())){
            return ResultData.failed(ResultCode.VALIDATE_FAILED);
        }
        String signKey = systemEnvService.getParam(SystemConstant.PARAM_SIGN_KEY);
        long now = System.currentTimeMillis();
        Map<String,Object> accessMap = new HashMap<>();
        accessMap.put("id",dbUser.getId());
        accessMap.put("seed", UUID.randomUUID().toString());
        accessMap.put("username",dbUser.getUsername());
        accessMap.put("expired", DateUtil.getMinuteAfter(now,10));
        String accessKey = Jwts.builder().setClaims(accessMap).signWith(SignatureAlgorithm.HS512, signKey).compact();
        Map<String,Object> refreshMap = new HashMap<>();
        refreshMap.put("id",dbUser.getId());
        refreshMap.put("seed", UUID.randomUUID().toString());
        refreshMap.put("username",user.getUsername());
        refreshMap.put("password",user.getPassword());
        refreshMap.put("expired", DateUtil.getHourAfter(now,24));
        String refreshKey = Jwts.builder().setClaims(refreshMap).signWith(SignatureAlgorithm.HS512,signKey).compact();
        Map<String,String> tokenMap = new HashMap<>();
        System.out.println("accessKey:" + accessKey);
        System.out.println("refreshKey:" + refreshKey);
        tokenMap.put("accessKey",accessKey);
        tokenMap.put("refreshKey",refreshKey);
        return ResultData.success(tokenMap);
    }


    @RequestMapping("/refreshKey")
    public ResultData<Map<String,String>> refreshKey(HttpServletRequest request) {
        String refreshKey = request.getHeader(SystemConstant.AUTH_REFRESH_PARAM);
        if(StringUtil.isEmpty(refreshKey)){
            return ResultData.failed(ResultCode.AUTH_RENEWAL_FAILED);
        }
        String signKey = systemEnvService.getParam(SystemConstant.PARAM_SIGN_KEY);
        Jws<Claims> jws;
        try{
            jws = Jwts.parser().setSigningKey(signKey).parseClaimsJws(refreshKey);
            if(jws == null){
                return ResultData.failed(ResultCode.AUTH_RENEWAL_FAILED);
            }
        }catch (Exception ex){
            return ResultData.failed(ResultCode.AUTH_RENEWAL_FAILED);
        }
        Long expired = (Long)jws.getBody().get("expired");
        if(expired == null || expired <= System.currentTimeMillis()){
            return ResultData.failed(ResultCode.AUTH_RENEWAL_FAILED);
        }
        String username = (String)jws.getBody().get("username");
        String password = (String)jws.getBody().get("password");
        User dbUser = userService.queryByUserName(username);
        if(dbUser == null || !passwordEncoder.matches(password,dbUser.getPassword())){
            return ResultData.failed(ResultCode.VALIDATE_FAILED);
        }
        long now = System.currentTimeMillis();
        Map<String,Object> accessMap = new HashMap<>();
        accessMap.put("id",dbUser.getId());
        accessMap.put("seed", UUID.randomUUID().toString());
        accessMap.put("username",dbUser.getUsername());
        accessMap.put("expired", DateUtil.getMinuteAfter(now,10));
        String accessKey = Jwts.builder().setClaims(accessMap).signWith(SignatureAlgorithm.HS512, signKey).compact();
        Map<String,String> tokenMap = new HashMap<>();
        tokenMap.put("accessKey",accessKey);
        return ResultData.success(tokenMap);
    }


    @RequestMapping("/index")
    public String index(){
        return "index";
    }
}