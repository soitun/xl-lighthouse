import React, {useContext, useRef, useState} from 'react';
import {Form, Grid, Input, Message, Modal, Notification, Radio, Tabs, Typography} from "@arco-design/web-react";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import UsersTransfer from "@/pages/components/transfer/user_transfer";
import DepartmentsTransfer from "@/pages/components/transfer/department_transfer";
import {IconCaretDown, IconCaretRight} from "@arco-design/web-react/icon";
import {GrantPrivileges, MetricSet} from "@/types/insights-web";
import {ResultData} from "@/types/insights-common";
import {requestCreate, requestUpdate} from "@/api/metricset";
import {useDispatch, useSelector} from "react-redux";
import {MetricSetPreviewContext} from "@/pages/common/context";
import {GlobalState, updateStoreStaredMetricInfo} from "@/store";


export default function MetricSetUpdateModal({onClose,onSuccess}) {

    const [form] = Form.useForm();
    const t = useLocale(locale);
    const FormItem = Form.Item;
    const dispatch = useDispatch();
    const formRef = useRef(null);
    const { Col, Row } = Grid;
    const [showPickUpPanel,setShowPickUpPanel] = useState<boolean>(false);
    const [showGrantPrivileges,setShowGrantPrivileges] = useState<boolean>(true);
    const { metricSetInfo, setMetricSetInfo } = useContext(MetricSetPreviewContext);
    const userInfo = useSelector((state: GlobalState) => state.userInfo);
    const proEdition = userInfo?.sysInfo?.proEdition || false;
    const departmentTransferRef = useRef(null);
    const userTransferRef = useRef(null);
    const [loading,setLoading] = useState<boolean>(false);
    const staredMetricInfo = useSelector((state: {staredMetricInfo:Array<MetricSet>}) => state.staredMetricInfo);

    function changeVisibleType(value){
        if(value == '0'){
            setShowGrantPrivileges(true);
        }else{
            setShowPickUpPanel(false);
            setShowGrantPrivileges(false);
        }
    }

    function toggleShowPickupPanel(){
        setShowPickUpPanel(!showPickUpPanel);
    }

    async function handlerSubmit(){
        await formRef.current.validate().catch()
        setLoading(true);
        const values = formRef.current.getFieldsValue();
        const updateParams:MetricSet = {
            id:metricSetInfo?.id,
            title:values.title,
            desc:values.desc,
            privateType:proEdition ? values.privateType : 1,
        }
        await requestUpdate(updateParams).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['updateMetricSet.form.submit.success']});
                if(staredMetricInfo?.map(z => z.id).includes(metricSetInfo?.id)){
                    const newArray = staredMetricInfo?.map(z => {
                        if(z.id == metricSetInfo.id){
                            return {...z,...updateParams};
                        }else{
                            return z;
                        }
                    })
                    localStorage.removeItem('cache_stared_metrics');
                    dispatch(updateStoreStaredMetricInfo(newArray));
                }
                const newInfo = {...metricSetInfo,...updateParams};
                setMetricSetInfo(newInfo);
                setLoading(false);
                onClose();
                onSuccess();
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
                setLoading(false);
            }
        }).catch((error) => {
            console.log(error);
        })
    }

    return (
        <Modal
            title={t['updateMetricSet.modal.title']}
            visible={true}
            alignCenter={false}
            style={{ width:'960px',maxWidth:'80%',verticalAlign:'top', top: '150px' }}
            confirmLoading={loading}
            onCancel={onClose}
            onOk={handlerSubmit}
            focusLock={false}
            autoFocus={false}
        >
            <Form
                form={form}
                colon={true}
                ref={formRef}
                autoComplete={"off"}
                initialValues={{
                    title:metricSetInfo?.title,
                    privateType: metricSetInfo?.privateType,
                    desc:metricSetInfo?.desc,
                }}
                style={{ minHeight:'220px' }}
                labelCol={{span: 4, offset: 0}}
                layout={"horizontal"}>
                <Form.Item field="title" label={t['updateMetricSet.form.label.title']}
                           rules={[
                               { required: true, message: t['updateMetricSet.form.title.errMsg'], validateTrigger : ['onSubmit'] },
                           ]}>
                    <Input
                        allowClear
                        placeholder={'Please Input Title'} />
                </Form.Item>

                <Form.Item field="desc" label={t['updateMetricSet.form.label.description']} rules={[
                    { required: true, message: t['updateMetricSet.form.description.errMsg'], validateTrigger : ['onSubmit'] },
                ]}>
                    <Input.TextArea maxLength={90} rows={3}  showWordLimit={true}  placeholder={'Please Input Description'}/>
                </Form.Item>
                {
                    proEdition &&
                        <Form.Item style={{ marginBottom: 0 }} label={t['updateMetricSet.form.label.private.type']} rules={[{ required: true }]} >
                            <Grid.Row gutter={8}>
                                <Grid.Col span={20}>
                                    <Form.Item field={"privateType"}>
                                        <Radio.Group defaultValue={0} onChange={changeVisibleType}>
                                            <Radio value={0}>{t['updateMetricSet.form.private.type.private']}</Radio>
                                            <Radio value={1}>{t['updateMetricSet.form.private.type.public']}</Radio>
                                        </Radio.Group>
                                    </Form.Item>
                                </Grid.Col>
                            </Grid.Row>
                        </Form.Item>
                }
            </Form>
        </Modal>
    );
}
