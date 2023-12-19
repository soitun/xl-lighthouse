package com.dtstep.lighthouse.common.util;
/*
 * Copyright (C) 2022-2024 XueLing.雪灵
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import org.xerial.snappy.Snappy;

import java.io.IOException;
import java.nio.charset.StandardCharsets;


public final class SnappyUtil {

    public static String compress(String str) throws Exception{
        byte[] b = Snappy.compress(str.getBytes(StandardCharsets.UTF_8));
        return Base64.encodeToString(b);
    }


    public static byte[] compressToByte(String str) throws Exception{
        return Snappy.compress(str.getBytes(StandardCharsets.UTF_8));
    }

    public static String uncompress(String str) throws IOException {
        byte[] decode = Base64.decode(str);
        return new String(Snappy.uncompress(decode), StandardCharsets.UTF_8);
    }

    public static String uncompressByte(byte[] decode) throws IOException {
        return new String(Snappy.uncompress(decode), StandardCharsets.UTF_8);
    }

    public static boolean isCompress(byte[] bytes) throws Exception{
        return Snappy.isValidCompressedBuffer(bytes);
    }
}
