import React, {useContext, useEffect, useRef, useState} from 'react';
import useLocale from '@/utils/useLocale';
import locale from './locale';
import { GlobalContext } from '@/context';
import {
    Input,
    Button,
    Form,
    Space,
    Message, TreeSelect, Notification,
} from '@arco-design/web-react';
import {FormInstance} from "@arco-design/web-react/es/Form";
import {requestUpdateById} from "@/api/user";
import {translate} from "@/pages/department/base";
import {ResultData} from "@/types/insights-common";
import {User} from "@/types/insights-web";
import {createStore} from "redux";
import rootReducer from "@/store";
const store = createStore(rootReducer);

export default function BasicInfoForm({userInfo,allDepartInfo,callback}) {

  const t = useLocale(locale);
  const [form] = Form.useForm();
  const formRef = useRef<FormInstance>();
  const { lang } = useContext(GlobalContext);
  const [formLoading, setFormLoading] = useState(false);

  const initialValues = {
    id:userInfo?.id,
    username:userInfo?.username,
    departmentId:String(userInfo?.departmentId),
    phone:userInfo?.phone,
    email:userInfo?.email,
  }

  const onSubmitClick = () => {
      setFormLoading(true);
      formRef.current.validate().then((values) => {
          const proc = async () =>{
              const updateParam:User = {
                  id:userInfo?.id,
                  username:userInfo?.username,
                  departmentId:values.departmentId,
                  phone:values.phone,
                  email:values.email,
              }
              const response:ResultData = await requestUpdateById(updateParam);
              const {code, data ,message} = response;
              if(code == '0'){
                  Notification.info({style: { width: 420 }, title: 'Notification', content: t['userSetting.form.basicinfo.success']});
                  const newUserInfo =  Object.assign({}, userInfo,updateParam)
                  store.dispatch({
                      type: 'update-userInfo',
                      payload: {userInfo: newUserInfo, userLoading: false},
                  });
              }else{
                  Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
              }
              callback();
              setFormLoading(false);
          }
          proc().then();
      }).catch((error) => {
         console.log(error)
      })
  }

  const handleReset = () => {
    form.resetFields();
  };

  return (
      <Form
          style={{ width: '60%', marginTop: '30px' }}
          form={form}
          ref={formRef}
          autoComplete='off'
          initialValues = {initialValues}
          labelCol={{ span: lang === 'en-US' ? 5 : 4 }}
          wrapperCol={{ span: lang === 'en-US' ? 17 : 18 }}
          onSubmit={(v) => {
              onSubmitClick();
          }}
      >
          <Form.Item
              style={{ display:"none" }}
              field="id"
              rules={[
                  {
                      required: true,
                      message: t['userSetting.info.userName.placeholder'],
                  },
              ]}
          >
              <Input disabled={true} placeholder={t['userSetting.info.nickName.placeholder']}  />
          </Form.Item>

        <Form.Item
            label={t['userSetting.info.userName']}
            field="username"
            rules={[
                { required: true, message: t['userSetting.form.userName.errMsg'] , validateTrigger : ['onSubmit']},
                { required: true, match: new RegExp(/^[a-zA-Z0-9_]{5,15}$/,"g"),message: t['userSetting.form.userName.validate.errMsg'] , validateTrigger : ['onSubmit']},
            ]}>
            <Input placeholder={t['userSetting.info.nickName.placeholder']}  disabled={true}/>
        </Form.Item>
        <Form.Item
            label={t['userSetting.info.email']}
            field="email"
            rules={[
                { required: true, message: t['userSetting.form.email.errMsg'], validateTrigger : ['onSubmit'] },
                { required: true, match: new RegExp(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,"g"),message: t['userSetting.form.email.validate.errMsg'] , validateTrigger : ['onSubmit']},
            ]}>
            <Input placeholder={t['userSetting.info.email.placeholder']} />
        </Form.Item>

        <Form.Item
            label={t['userSetting.info.phone']}
            field="phone"
            rules={[
                { required: false, match: new RegExp(/^[\d()\\-]{5,20}$/,"g"),message: t['userSetting.form.phone.validate.errMsg'] , validateTrigger : ['onSubmit']},
            ]}
        >
            <Input placeholder={t['userSetting.info.phone.placeholder']} />
        </Form.Item>

          <Form.Item label={t['userSetting.info.department']} field="departmentId"
                     rules={[
                         {
                             required: true, message: t['userSetting.form.department.errMsg'], validateTrigger : ['onSubmit']
                         },
                     ]}>
              <TreeSelect
                  placeholder={"Please Select"}
                  treeData={translate(allDepartInfo)}
                  allowClear={true}
                  showSearch={true}
              />
          </Form.Item>

          <Form.Item label=" ">
              <Space>
                  <Button type="primary" long htmlType='submit' loading={formLoading}>
                      Submit
                  </Button>
              </Space>
          </Form.Item>
      </Form>
  );
}