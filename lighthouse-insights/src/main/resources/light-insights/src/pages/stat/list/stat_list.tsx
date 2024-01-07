import {
    Table,
    Message, PaginationProps, Notification,
} from '@arco-design/web-react';
import React, {useEffect, useMemo, useRef, useState} from 'react';
import useLocale from '@/utils/useLocale';
import {useSelector} from "react-redux";
import locale from './locale';
import { Department, Stat} from "@/types/insights-web";
import {requestList} from "@/api/stat";
import {getColumns, getColumnsOfManage} from "@/pages/stat/list/constants";
import Detail from "@/pages/stat/list/detail";
import StatUpdateModal from "@/pages/stat/update";
import {getRandomString} from "@/utils/util";
import {GlobalErrorCodes} from "@/utils/constants";

export default function StatisticalListPanel({formParams = {},from = null}) {
    const t = useLocale(locale);
    const [loading,setLoading] = useState<boolean>(false);
    const [listData,setListData] = useState<Array<Stat>>([]);
    const [detailVisible, setDetailVisible] = React.useState(false);
    const [dataVersion,setDataVersion] = useState<number>();
    const [updateModalVisible,setUpdateModalVisible] = React.useState(false);
    const [currentItem,setCurrentItem] = useState<Stat>(null);
    const refFetchId = useRef<number>(null);

    const tableCallback = async (record, type) => {
        if(type == 'update'){
            setCurrentItem(record);
            setUpdateModalVisible(true);
        }else if(type == 'detail'){
            setCurrentItem(record);
            setDetailVisible(!detailVisible);
        }
    };

    const allDepartInfo = useSelector((state: {allDepartInfo:Array<Department>}) => state.allDepartInfo);
    const columns = useMemo(() => (from && from == 'group-manage') ? getColumnsOfManage(t, tableCallback) : getColumns(t,tableCallback), [t]);
    const [pagination, setPagination] = useState<PaginationProps>({
        sizeOptions: [15,20,30,50],
        sizeCanChange: true,
        showTotal: true,
        pageSize: 15,
        current: 1,
        pageSizeChangeResetCurrent: true,
    });


    function onChangeTable({ current, pageSize }) {
        setPagination({
            ...pagination,
            current,
            pageSize,
        });
    }

    const fetchData = async () => {
        const {current, pageSize} = pagination;
        refFetchId.current = Date.now();
        const fetchId = refFetchId.current;
        await requestList({
            queryParams:formParams,
            pagination:{
                pageSize:pageSize,
                pageNum:current,
            }
        }).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                if (refFetchId.current === fetchId) {
                    setListData(data.list);
                    setPagination({
                        ...pagination,
                        current,
                        pageSize,
                        total: data.total});
                    setLoading(false);
                }
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
                setLoading(false);
            }
        }).catch((error) => {
            console.log(error);
            setLoading(false);
        })
    }

    useEffect(() => {
        setLoading(true);
        fetchData().then();
    },[pagination.current, pagination.pageSize, JSON.stringify(formParams)])


    return (
        <>
        <Table border={false}
               rowKey={'id'}
               size={"small"} columns={columns}
               data={listData}
               onChange={onChangeTable}
               pagination={pagination}
               loading={loading}/>
            {detailVisible && <Detail statInfo={currentItem} onClose={() => setDetailVisible(false)}/>}
            {updateModalVisible && <StatUpdateModal statInfo={currentItem} onClose={() => setUpdateModalVisible(false)} />}
        </>
        );
}