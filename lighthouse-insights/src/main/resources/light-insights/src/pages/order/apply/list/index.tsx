import React, {useEffect, useMemo, useState} from 'react';
import {
    Breadcrumb,
    Button,
    Card,
    Grid, Notification,
    PaginationProps,
    Space,
    Table,
} from '@arco-design/web-react';
import SearchForm from "./form";
import FilterAddPanel from "@/pages/filter/add/filter_add";
import {getColumns} from "./constants";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import {Order, Project} from "@/types/insights-web";
import {getRandomString} from "@/utils/util";
import {IconHome} from "@arco-design/web-react/icon";
import {requestApplyList} from "@/api/order";
import {useSelector} from "react-redux";
import {GlobalState} from "@/store";
import {convertDateToTimestamp, DateFormat, getDayEndTimestamp, getDayStartTimestamp} from "@/utils/date";

export default function ApplyListPage() {

    const t = useLocale(locale);
    const userInfo = useSelector((state: GlobalState) => state.userInfo);
    const [listData, setListData] = useState([]);
    const [loading,setLoading] = useState<boolean>(true);
    const [formParams, setFormParams] = useState<any>({});
    const [reloadTime,setReloadTime] = useState<number>(Date.now);
    const [pagination, setPagination] = useState<PaginationProps>({
        sizeOptions: [15,20,30,50],
        sizeCanChange: true,
        showTotal: true,
        pageSize: 15,
        current: 1,
        pageSizeChangeResetCurrent: true,
    });

    const tableCallback = async (record, type) => {
        if(type == 'retract'){
            // setShowProcessPanel(true);
            // setCurrentOrder(record);
        }else if(type == 'detail'){
            // setShowDetailPanel(true);
            // setCurrentOrder(record);
        }
    };
    const columns = useMemo(() => getColumns(t, tableCallback), [t]);

    const fetchData = async (): Promise<void> => {
        setLoading(true);
        const queryParams:any = {};
        queryParams.userId = userInfo?.id;
        queryParams.types = formParams.types;
        queryParams.states = formParams.states;
        const createTime = formParams.createTime;
        if(createTime && Array.isArray(createTime)){
            queryParams.createStartTime = getDayStartTimestamp(convertDateToTimestamp(createTime[0],DateFormat));
            queryParams.createEndTime = getDayEndTimestamp(convertDateToTimestamp(createTime[1],DateFormat));
        }
        const {current, pageSize} = pagination;
        await requestApplyList({
            queryParams:queryParams,
            pagination:{
                pageSize:pageSize,
                pageNum:current,
            }
        }).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                setListData(data.list);
                setPagination({
                    ...pagination,
                    current,
                    pageSize,
                    total: data.total});
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
            setLoading(false);
        }).catch((error) => {
            console.log(error);
        })
    }

    useEffect(() => {
        fetchData().then();
    }, [reloadTime,pagination.current, pagination.pageSize, JSON.stringify(formParams)]);

    const [showAddPanel, setShowsAddPanel] = useState(false);

    function onChangeTable({ current, pageSize }) {
        setPagination({
            ...pagination,
            current,
            pageSize,
        });
    }

    function handleSearch(params) {
        console.log("params is:" + JSON.stringify(params))
        setPagination({ ...pagination, current: 1 });
        setFormParams(params);
    }

    return (
        <>
        <Breadcrumb style={{fontSize: 12,marginBottom:'10px'}}>
            <Breadcrumb.Item>
                <IconHome />
            </Breadcrumb.Item>
            <Breadcrumb.Item style={{fontWeight:20}}>{t['applyList.breadcrumb.title']}</Breadcrumb.Item>
        </Breadcrumb>
        <Card>
            <SearchForm onSearch={handleSearch} />
            <Table
                loading={loading}
                rowKey={'id'}
                size={"small"}
                onChange={onChangeTable}
                style={{ marginTop:12}}
                pagination={pagination}
                columns={columns} data={listData} />
            {showAddPanel && <FilterAddPanel onClose={() => setShowsAddPanel(false)}/>}
        </Card>
        </>
    );
}