import React, {useContext, useEffect, useMemo, useState} from 'react';
import {
    Breadcrumb,
    Button,
    Card,
    Grid,
    Message,
    Notification,
    PaginationProps,
    Radio,
    Space,
    Table,
} from '@arco-design/web-react';
import useLocale from '@/utils/useLocale';
import SearchForm from './form';
import locale from './locale';
import {requestDeleteById, requestList, requestStarById, requestUnStarById} from "@/api/project";
import {Department, MetricSet, Project, TreeNode} from "@/types/insights-web";
import useForm from "@arco-design/web-react/es/Form/useForm";
import {useDispatch, useSelector} from "react-redux";
import ProjectUpdatePanel from "@/pages/project/update";
import ProjectApplyModal from "@/pages/project/apply";
import {ResourceTypeEnum} from "@/types/insights-common";
import {GlobalState} from "@/store";
import {requestBinded} from "@/api/metricset";
import {MetricSetBindListContext} from "@/pages/common/context";
import {convertDateToTimestamp, DateFormat, getDayEndTimestamp, getDayStartTimestamp} from "@/utils/date";
import {updateStoreStaredProjectInfo} from "@/store";
import {getBindColumns, getColumns} from "@/pages/project/list/constants";

const BreadcrumbItem = Breadcrumb.Item;

export interface Props {
    formParams?:any,
    owner?:number,
    from?:string,
    parentLoading?:boolean,
    extend?:any,
}

export default function ProjectListPanel({formParams = {}, owner=0,parentLoading = false,extend = null,from = null}:Props) {
    const t = useLocale(locale);
    const allDepartInfo = useSelector((state: {allDepartInfo:Array<TreeNode>}) => state.allDepartInfo);
    const [listData, setListData] = useState<Project[]>([]);
    const [selectedProject,setSelectedProject] = useState<Project>(null);
    const [form] = useForm();
    const dispatch = useDispatch();
    const [createVisible, setCreateVisible] = React.useState(false);
    const [updateVisible, setUpdateVisible] = React.useState(false);
    const [detailVisible, setDetailVisible] = React.useState(false);
    const [bindedVisible,setBindedVisible] = React.useState(false);
    const [applyVisible,setApplyVisible] = React.useState(false);
    const userInfo = useSelector((state: GlobalState) => state.userInfo);
    const [bindList,setBindList] = useState<number[]>([]);
    const handleMetricBindListReloadCallback = useContext(MetricSetBindListContext);
    const [reloadTime,setReloadTime] = useState<number>(Date.now());
    const staredProjectInfo = useSelector((state: {staredProjectInfo:Array<Project>}) => state.staredProjectInfo);

    const tableCallback = async (record, type) => {
        if(type == 'update'){
            setSelectedProject(record);
            setUpdateVisible(!updateVisible);
        }else if(type == 'delete'){
            await handlerDeleteProject(record.id).then();
        }else if(type == 'star'){
            setSelectedProject(record);
            await handlerStar(record);
        }else if(type == 'unstar'){
            setSelectedProject(record);
            await handlerUnStar(record);
        }else if(type == 'detail'){
            setSelectedProject(record);
            setDetailVisible(!detailVisible);
        }else if(type == 'apply'){
            setSelectedProject(record);
            setApplyVisible(!applyVisible);
        }else if(type == 'bind'){
            await handlerBind(record.id).then();
        }
    };

    const handlerDeleteProject = async (id: number) => {
        await requestDeleteById({id}).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['projectList.operations.delete.submit.success']});
                setReloadTime(Date.now());
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
        }).catch((error) => {
            console.log(error);
        })
    };

    const handlerStar = async (record) => {
        setLoading(true);
        const id = record.id;
        await requestStarById({id}).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['projectList.operations.star.submit.success']});
                localStorage.removeItem('cache_stared_projects');
                const currentFixedData = staredProjectInfo?.filter(x => x.id != record.id);
                dispatch(updateStoreStaredProjectInfo([record,...currentFixedData]))
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
            setLoading(false);
        }).catch((error) => {
            console.log(error);
        })
    }

    const handlerUnStar = async (record) => {
        setLoading(true);
        const id = record.id;
        await requestUnStarById({id}).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['projectList.operations.unstar.submit.success']});
                localStorage.removeItem('cache_stared_projects');
                const currentFixedData = staredProjectInfo?.filter(x => x.id != record.id);
                dispatch(updateStoreStaredProjectInfo([...currentFixedData]))
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
            setLoading(false);
        }).catch((error) => {
            console.log(error);
        })
    }

    async function handlerBind(id:number){
        const bindParams = {
            bindElements:[{resourceId:id,resourceType:ResourceTypeEnum.Project}],
            metricIds:extend.id,
        }
        await requestBinded(bindParams).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['projectList.operations.bind.success']});
                setBindList([...bindList,id])
                handleMetricBindListReloadCallback();
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
        }).catch((error) => {
            console.log(error);
            Message.error(t['system.error'])
        })
    }

    const hideCreateModal = () => {
        setCreateVisible(false);
    };

    const hideUpdateModal = () => {
        setUpdateVisible(false);
    };

    const handleGetColumns = () => {
        if(from == 'bind'){
            return getBindColumns(t,bindList, tableCallback);
        }else{
            return getColumns(t,staredProjectInfo, tableCallback);
        }
    }

    const columns = useMemo(() => handleGetColumns(), [t,bindList,staredProjectInfo,listData]);
    const [pagination, setPagination] = useState<PaginationProps>({
        sizeOptions: [15,20,30,50],
        sizeCanChange: true,
        showTotal: true,
        pageSize: 15,
        current: 1,
        pageSizeChangeResetCurrent: true,
    });

    const [loading, setLoading] = useState(true);

    function onChangeTable({ current, pageSize }) {
        setPagination({
            ...pagination,
            current,
            pageSize,
        });
    }

    function handleSearch(params) {
        setPagination({ ...pagination, current: 1 });
    }

    function handleReset(){
        form.resetFields();
        handleSearch({});
    }


    useEffect(() => {
        if(extend != null){
            const ids = extend.bindElements.filter(x => x.resourceType == ResourceTypeEnum.Project).map(x => x.resourceId);
            setBindList(ids);
        }
    },[extend])

    useEffect(() => {
        fetchData().then();
    }, [reloadTime,owner,pagination.current, pagination.pageSize, JSON.stringify(formParams)]);

    const fetchData = async (): Promise<void> => {
        setLoading(true);
        const {current, pageSize} = pagination;
        const combineParams:any = {}
        combineParams.search = formParams.search;
        combineParams.departmentIds = formParams.departmentIds && formParams.departmentIds.length > 0 ? formParams.departmentIds: null;
        const createTime = formParams.createTime;
        if(createTime && Array.isArray(createTime)){
            combineParams.createStartTime = getDayStartTimestamp(convertDateToTimestamp(createTime[0],DateFormat));
            combineParams.createEndTime = getDayEndTimestamp(convertDateToTimestamp(createTime[1],DateFormat));
        }
        combineParams.ownerId = owner == 1?userInfo?.id:null;
        await requestList({
            queryParams:combineParams,
            pagination:{
                pageSize:pageSize,
                pageNum:current,
            }
        }).then((response) => {
            const {code, data ,message} = response;
            if (code === '0') {
                setListData(data.list);
                setPagination({
                    ...pagination,
                    current,
                    pageSize,
                    total: data.total});
                setLoading(false);
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
        }).catch((error) => {
            console.log(error);
        })
    }

    return (
        <>
            <Table
                rowKey={'id'}
                size={"small"}
                loading={loading}
                onChange={onChangeTable}
                pagination={pagination}
                columns={columns}
                data={listData}
            />
            {updateVisible && <ProjectUpdatePanel projectInfo={selectedProject} allDepartInfo={allDepartInfo} onClose={() => setUpdateVisible(false)} onSuccess={() => setReloadTime(Date.now())}/>}
            {applyVisible && <ProjectApplyModal projectInfo={selectedProject} onClose={() => setApplyVisible(false)}/>}
        </>
    );

}