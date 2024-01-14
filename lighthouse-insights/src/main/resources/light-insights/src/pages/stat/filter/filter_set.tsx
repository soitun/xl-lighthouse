import React, {useCallback, useContext, useEffect, useRef, useState} from 'react';
import {useParams} from "react-router-dom";
import {
    Button,
    Form,
    Tabs,
    Grid,
    Input, Message,
    Modal, Notification,
    Select, Space, TableColumnProps, TreeSelect,
    Typography, Table
} from '@arco-design/web-react';
import useLocale from '@/utils/useLocale';
import locale from './locale';
import EditTable, {EditTableColumnProps, EditTableComponentEnum} from "@/pages/common/edittable/EditTable";
import {IconMinus, IconMinusCircleFill, IconPlus} from "@arco-design/web-react/icon";
import {formatString, getRandomString, getTextBlenLength, stringifyObj} from "@/utils/util";
import {requestFilterConfig} from "@/api/stat";
import {Group, Project} from "@/types/insights-web";
import {GlobalErrorCodes} from "@/utils/constants";
import {Component, ComponentTypeEnum, RenderFilterConfig} from "@/types/insights-common";
import {translateToTreeNodes} from "@/pages/department/common";
import {requestList} from "@/api/component";
import SystemComponents from "@/pages/stat/filter/system_component";
import {FormInstance} from "@arco-design/web-react/lib";
const EditableContext = React.createContext<{ getForm?: () => FormInstance }>({});
const FormItem = Form.Item;
import styles from "./style/index.module.less";
import EditTableV2 from "@/pages/common/editable_v2/EditTableV2";
import CustomComponents from "@/pages/stat/filter/custom_component";
import {getSystemComponentTypeDescription} from "@/pages/common/desc/base";

export default function StatFilterConfigModal({statInfo,onClose}) {

    const editTableRef = useRef(null);
    const t = useLocale(locale);
    const [initFilterConfig,setInitFilterConfig] = useState<Array<RenderFilterConfig>>([]);
    const [loading,setLoading] = useState<boolean>(false);

    const targetColumns : EditTableColumnProps[] = [
        {
            title: 'Label',
            dataIndex: 'label',
            editable:true,
            headerCellStyle: { width: '250px' },
            componentType:EditTableComponentEnum.INPUT,
        },
        {
            title: 'Dimens',
            dataIndex: 'dimens',
            editable:true,
            headerCellStyle: { width: '250px' },
            componentType:EditTableComponentEnum.INPUT,
        },
        {
            title: 'Title',
            dataIndex: 'title',
            editable:true,
            headerCellStyle: { width: '250px' },
            componentType:EditTableComponentEnum.Label,
        },
        {
            title: 'Display',
            dataIndex: 'componentType',
            headerCellStyle: { width: '400px' },
            editable:true,
            componentType:EditTableComponentEnum.TreeSelect,
            render: (value, record) => {
                const componentId = record.componentId;
                const configData = record.configData ? record.configData:[];
                const componentType = record.componentType;
                if(componentType == ComponentTypeEnum.FILTER_INPUT){
                    return (
                        <Input size={"small"} autoComplete={'off'}/>
                    )
                }if(componentType == ComponentTypeEnum.FILTER_SELECT){
                    return (
                        <TreeSelect size={"mini"} treeData={translateToTreeNodes(configData)} />
                    )
                }else{
                    return (
                        <TreeSelect size={"mini"} treeData={translateToTreeNodes(configData)} />
                    )
                }

            },
        },
        {
            title: 'Operation',
            dataIndex: 'operation',
            headerCellStyle: { width: '150px' },
            editable:true,
            componentType:EditTableComponentEnum.BUTTON,
            cellStyle:{textAlign:"center"},
            render: (value, record) => {
                return (
                    <IconMinus style={{cursor:"pointer"}} onClick={() => removeComponent(record.key)}/>
                )
            }
        },
    ];

    useEffect(() => {
        const initData = statInfo?.renderConfig?.filters?.map(z => {
            let title;
            if(z.componentId == 0){
                title = getSystemComponentTypeDescription(t,z.componentType);
            }else{
                title = z.title;
            }
            return {...z,key:getRandomString(),title:title};
        })
        setInitFilterConfig(initData);
    },[statInfo])

    const selectComponent = (component:RenderFilterConfig) => {
        component = {...component,label:'--',dimens:'--',key:getRandomString()}
        editTableRef.current.addRow(component);
    }

    const removeComponent = (key) => {
        editTableRef.current.removeRow(key);
    }

    const getConfigData = () => {
        return editTableRef.current.getData();
    }

    const onSubmit = () => {
        const dimensArray = statInfo?.templateEntity?.dimensArray;
        const configData = getConfigData();
        const filters = configData?.map(z => {
            // const dimens = z.dimens;
            // const label = z.label;
            // const componentId = z.componentId;
            // const componentType = z.componentType;
            return {
                dimens:z.dimens,
                label:z.label,
                componentId:z.componentId,
                componentType:z.componentType,
            }
        })
        const params = {filters,id:statInfo.id}
        console.log("--data is:" + JSON.stringify(params));
        setLoading(true);
        requestFilterConfig(params).then((response) => {
            console.log("Response is:" + JSON.stringify(response));
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['statCreate.form.submit.success']});
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
            // onClose();
        }).catch((error) => {
            console.log(error);
            Notification.error({style: { width: 420 }, title: 'Warning', content: t['system.error']});
        }).finally(() => {
            setLoading(false);
        })
    }

    return (
        <Modal
            className={styles['edit-cell']}
            title= '修改筛选项'
            style={{ width:'1100px',top:'20px',maxWidth:'80%',height:'800px' }}
            visible={true}
            onOk={() => onSubmit()}
            onCancel={() => onClose()}>
            <Space size={10} direction="vertical" style={{width:'100%'}}>
                <Tabs type={"card-gutter"} defaultActiveTab='1' style={{height:'330px'}}>
                    <Tabs.TabPane key='1' title='内置组件' style={{padding:'5px'}}>
                        <SystemComponents onSelect={selectComponent}/>
                    </Tabs.TabPane>
                    <Tabs.TabPane key='2' title='自定义组件'>
                        <CustomComponents onSelect={selectComponent}/>
                    </Tabs.TabPane>
                </Tabs>
                <Typography.Title style={{fontSize:'14px',marginTop:'20px'}}>
                    {'当前配置：'}
                </Typography.Title>
                <EditTableV2 ref={editTableRef} columns={targetColumns} initData={initFilterConfig}/>

            </Space>
        </Modal>
    );
}
