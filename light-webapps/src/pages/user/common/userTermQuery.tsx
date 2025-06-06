import React, {useEffect, useRef, useState} from 'react';
import {
    Form,
    Message,
    Select, TreeSelect,
} from '@arco-design/web-react';
import { useCallback } from 'react';
import { Spin } from '@arco-design/web-react';
import debounce from 'lodash/debounce';
import {IconUser} from "@arco-design/web-react/icon";
import {requestTermQueryByIds, requestTermList} from "@/api/user";
import {User} from "@/types/insights-web";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import {IconIdcard} from "@arco-design/web-react/icon";

const UserTermQuery = ({formRef = null,initValues = null,completeCallBack=null,limit=4}) => {

    const t = useLocale(locale);
    const [selectedValues, setSelectedValues] = useState([]);
    const [options, setOptions] = useState([]);
    const [values, setValues] = useState([]);
    const [fetching, setFetching] = useState(false);
    const refFetchId = useRef<any>(null);

    const fetchInitData = async () => {
        if(initValues){
            const result = await requestTermQueryByIds({ids:initValues});
            console.log("result is:" + JSON.stringify(result));
            const options = Object.entries(result.data).map(([id,user]) => (
                {
                label: (
                    <div style={{ display: 'flex', alignItems: 'center' }}>
                        <IconUser style={{ marginRight:5 }}/>
                        {user.username}
                    </div>
                ),
                value: user.id,
                checked:true,
                selected:true,
            }));
            setFetching(false);
            setOptions(options);
            setSelectedValues(initValues)
        }
    }

    useEffect(() => {
        fetchInitData().then();
    },[initValues])


    const debouncedFetchUser = useCallback(
        debounce((inputValue) => {
            refFetchId.current = Date.now();
            const fetchId = refFetchId.current;
            setFetching(true);
            setOptions([]);
            requestTermList({text:inputValue}).then((result) => {
                if(result.code === '0'){
                    if (refFetchId.current === fetchId) {
                        const users:Array<User> = result.data;
                        const options = users.map((user) => ({
                            label: (
                                <div style={{display: 'flex', alignItems: 'center'}}>
                                    <IconUser style={{marginRight: 5}}/>
                                    {user.username}
                                </div>
                            ),
                            value: user.id,
                        }))
                        setFetching(false);
                        setOptions(options);
                    }
                }
            })
        }, 500),
        []
    );


    const handleSelectChange = (values) => {
        if (values.length <= limit) {
            setSelectedValues(values);
            formRef.current.setFieldValue('userIds',values);
        }else{
            Message.error(t['userTerm.exceed.limit']);
        }
    };

    return (
        <Select
            showSearch
            mode='multiple'
            options={options}
            maxTagCount={3}
            allowClear
            prefix={<IconIdcard/>}
            value={selectedValues}
            placeholder='Search User'
            filterOption={false}
            onChange={handleSelectChange}
            notFoundContent={
                fetching ? (
                    <div
                        style={{
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                        }}
                    >
                        <Spin style={{ margin: 12 }} />
                    </div>
                ) : null
            }
            onSearch={debouncedFetchUser}
        />
    );
}

export default UserTermQuery;