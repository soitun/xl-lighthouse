import {Form, Grid, Input, Message, Modal, Radio, Space, Tabs, Tree, Typography} from "@arco-design/web-react";
import useLocale from "@/utils/useLocale";
import styles from "@/pages/project/manage/style/index.module.less";
import React, {useState} from "react";
import StatisticalListPanel from "@/pages/stat/list/stat_list";

export default function BindedStatisticListPanel({metricSetInfo,onClose = null}) {

    return (
        <>
        <Form
            autoComplete={'off'}
            labelCol={{span: 4, offset: 0}}>
            <Form.Item field={'search'} style={{marginBottom:'10px'}}>
                <Input.Search size={"small"} style={{width:'350px'}} allowClear={true}/>
            </Form.Item>
        </Form>
        <StatisticalListPanel formParams={{}} from={'bind'} extend={metricSetInfo}/>
        </>
    );
}