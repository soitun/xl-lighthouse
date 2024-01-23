import React, {useEffect, useMemo, useRef, useState} from 'react';
import {
    Button,
    Collapse, DatePicker, Divider, Drawer,
    Form,
    Grid,
    Input,
    Message,
    Modal,
    Notification, PaginationProps,
    Radio, Select, Space, Table, TableColumnProps,
    Tabs,
    TreeSelect,
    Typography
} from "@arco-design/web-react";
import {Permission, Record, User} from "@/types/insights-web";
import {requestList} from "@/api/record";
import {OwnerTypeEnum, RecordTypeEnum, ResourceTypeEnum, ResultData, RoleTypeEnum} from "@/types/insights-common";
import {GlobalErrorCodes} from "@/utils/constants";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import {formatTimeStampBackUp} from "@/utils/util";
import {LimitedRecord, translateRecord} from "@/pages/record/record";
import {requestGrantProjectPermission, requestQueryList} from "@/api/permission";
import {getDepartPermissionColumns} from "./constants";
import './styles/index.module.less'
import DepartmentsTransfer from "@/pages/components/transfer/department_transfer";
import {IconPlus} from "@arco-design/web-react/icon";
import UsersTransfer from "@/pages/components/transfer/user_transfer";
const CollapseItem = Collapse.Item;
const TabPane = Tabs.TabPane;

export function PermissionManageModal({resourceId,resourceType,onClose}){

    const t = useLocale(locale);
    const { Col, Row } = Grid;
    const [loading,setLoading] = useState<boolean>(true);

    const [departListData,setDepartListData] = useState<Permission[]>([]);

    const [userListData,setUserListData] = useState<Permission[]>([]);

    const [adminListData,setAdminListData] = useState<Permission[]>([]);

    const [departPermissionForms,setDepartPermissionForms] = useState(null);

    const [userPermissionForms,setUserPermissionForms] = useState(null);
    const departmentTransferRef = useRef(null);
    const userTransferRef = useRef(null);
    const formRef = useRef(null);

    const tableCallback = async (record, type) => {
        console.log("tableCallBack,record:" + record + ",type:" + type);
    }
    const departPermissionColumns = useMemo(() => getDepartPermissionColumns(t,tableCallback), [t]);

    const [pagination1, setPagination1] = useState<PaginationProps>({
        sizeOptions: [15,20,30,50],
        sizeCanChange: true,
        showTotal: true,
        pageSize: 15,
        current: 1,
        pageSizeChangeResetCurrent: true,
    });

    const [pagination2, setPagination2] = useState<PaginationProps>({
        sizeOptions: [15,20,30,50],
        sizeCanChange: true,
        showTotal: true,
        pageSize: 15,
        current: 1,
        pageSizeChangeResetCurrent: true,
    });


    const fetchDepartListData = async (search = null) => {
        console.log("search:" + JSON.stringify(search));
        const {current, pageSize} = pagination1;
        let roleType;
        if(resourceType == ResourceTypeEnum.Project){
            roleType = RoleTypeEnum.PROJECT_ACCESS_PERMISSION;
        }else if(resourceType == ResourceTypeEnum.Metric){
            roleType = RoleTypeEnum.METRIC_ACCESS_PERMISSION;
        }else{
            throw new Error();
        }
        const requestParam = {
            resourceId:resourceId,
            roleType:roleType,
            ownerType:OwnerTypeEnum.DEPARTMENT,
            search:search,
        }
        console.log("requestParam is:" + JSON.stringify(requestParam))
        setLoading(true);
        await requestQueryList({
            queryParams:requestParam,
            pagination:{
                pageSize:pageSize,
                pageNum:current,
            }
        }).then((response) => {
            const {code, data ,message} = response;
            if (code === '0') {
                setDepartListData(data.list);
                setPagination1({
                    ...pagination1,
                    current,
                    pageSize,
                    total: data.total});
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
            setLoading(false);
        }).catch((error) => {
            console.log(error)
        }).finally(() => {
            console.log("sss")
        })
    }

    useEffect(() => {
        console.log("resourceId:" + resourceId + ",resourceType:" + resourceType)
        fetchDepartListData().then();
    },[])

    const handleSubmit = async (e) => {
        e.stopPropagation();
        const values = formRef.current.getFieldsValue();
        let departmentsPermissions = [];
        let usersPermissions = [];
        const privateType = 0;
        if(privateType == 0 && departmentTransferRef?.current){
            departmentsPermissions = departmentTransferRef.current.getData();
        }
        if(privateType == 0 && userTransferRef?.current){
            usersPermissions = userTransferRef.current.getData();
        }
        console.log("departmentPermission:" + JSON.stringify(departmentsPermissions));
        console.log("usersPermissions:" + JSON.stringify(usersPermissions));
        const requestParam = {
            resourceId:resourceId,
            roleType:RoleTypeEnum.PROJECT_ACCESS_PERMISSION,
            usersPermissions:usersPermissions,
            departmentsPermissions:departmentsPermissions,
        }
        await requestGrantProjectPermission(requestParam)
            .then((result) => {
                console.log("result is:" + JSON.stringify(result));
            }).catch((error) => {
                console.log(error)
            })
    }

    return (
        <Modal
            title= {t['permissionManage.modal.title']}
            style={{ width:'1180px',verticalAlign:'top', maxWidth:'90%', marginTop: '130px' }}
            visible={true}
            className={"permission_table"}
            footer={null}
            onCancel={onClose}>
            <Form
                ref={formRef}
                labelCol={{span: 4, offset: 0}}
            >
            <Tabs type={"card-gutter"} defaultActiveTab='1'>
                <TabPane key='1' title= {t['permissionManage.department.accessPermission']}>
                    <Space direction={"vertical"} style={{width:'100%'}}>
                        <Input.Search size={"small"} style={{width:'350px',marginLeft:'3px'}} allowClear={true} onSearch={fetchDepartListData}/>
                        <Table loading={loading} style={{maxHeight:'300px',padding:"3px 3px"}} size={"mini"} pagination={pagination1} columns={departPermissionColumns} data={departListData} />
                        <Collapse style={{marginTop:'40px',borderLeft:"none",borderRight:"none"}}>
                            <CollapseItem style={{borderLeft:"none",borderRight:"none"}} header={
                                <div style={{display:"flex"}}>
                                    <span>{t['permissionManage.user.grantPermission']}</span>
                                    <Button style={{marginRight:'5px',marginLeft:"auto"}} type={"primary"} onClick={handleSubmit} size={"mini"}>{t['permissionManage.grant.submit']}</Button>
                                </div>
                            } name='3'>

                                <Form.Item label={" "} field='title'>
                                    <DepartmentsTransfer ref={departmentTransferRef}/>
                                </Form.Item>
                            </CollapseItem>
                        </Collapse>
                    </Space>
                </TabPane>


                <TabPane key='2' title={t['permissionManage.user.accessPermission']}>
                    <Space direction={"vertical"} style={{width:'100%'}}>
                        <Input.Search style={{width:'350px',marginLeft:'3px'}}/>
                        <Table style={{maxHeight:'300px',padding:"3px 3px"}} size={"mini"} pagination={pagination1} columns={departPermissionColumns} data={departListData} />
                        <Collapse style={{marginTop:'40px',borderLeft:"none",borderRight:"none"}}>
                            <CollapseItem style={{borderLeft:"none",borderRight:"none"}} header={
                                <div style={{display:"flex"}}>
                                    <span>{t['permissionManage.user.grantPermission']}</span>
                                    <Button style={{marginRight:'5px',marginLeft:"auto"}} type={"primary"} onClick={handleSubmit} size={"mini"}>{t['permissionManage.grant.submit']}</Button>
                                </div>
                            } name='3'>

                                <Form.Item label={" "} field='title'>
                                    <DepartmentsTransfer ref={departmentTransferRef}/>
                                </Form.Item>
                            </CollapseItem>
                        </Collapse>
                    </Space>
                </TabPane>
                <TabPane key='3' title={t['permissionManage.user.managePermission']}>
                    <Space direction={"vertical"} style={{width:'100%'}}>
                        <Input.Search style={{width:'350px',marginLeft:'3px'}}/>
                        <Table style={{maxHeight:'300px',padding:"3px 3px"}} size={"mini"} pagination={pagination1} columns={departPermissionColumns} data={departListData} />
                        <Collapse style={{marginTop:'40px',borderLeft:"none",borderRight:"none"}}>
                            <CollapseItem style={{borderLeft:"none",borderRight:"none"}} header={
                                <div style={{display:"flex"}}>
                                    <span>{t['permissionManage.user.grantPermission']}</span>
                                    <Button style={{marginRight:'5px',marginLeft:"auto"}} type={"primary"} onClick={handleSubmit} size={"mini"}>{t['permissionManage.grant.submit']}</Button>
                                </div>
                            } name='3'>

                                <Form.Item label={" "} field='title'>
                                    <DepartmentsTransfer ref={departmentTransferRef}/>
                                </Form.Item>
                            </CollapseItem>
                        </Collapse>
                    </Space>
                </TabPane>
            </Tabs>
            </Form>
        </Modal>
    );
}