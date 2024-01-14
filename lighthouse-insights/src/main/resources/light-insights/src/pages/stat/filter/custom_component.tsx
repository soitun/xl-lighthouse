import React, {useEffect, useState} from 'react';
import {Component, ComponentTypeEnum, RenderFilterConfig} from "@/types/insights-common";
import {Input, Notification, PaginationProps, Space, Table, TableColumnProps, TreeSelect} from "@arco-design/web-react";
import {translateToTreeNodes} from "@/pages/department/common";
import {IconPlus} from "@arco-design/web-react/icon";
import {requestList} from "@/api/component";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import {getRandomString} from "@/utils/util";

export default function CustomComponents({onSelect}) {

    const t = useLocale(locale);
    const [listData,setListData] = useState<RenderFilterConfig[]>([]);
    const [loading,setLoading] = useState<boolean>(false);

    const [pagination, setPagination] = useState<PaginationProps>({
        sizeOptions: [15,20,30,50],
        showTotal: true,
        pageSize: 15,
        current: 1,
    });

    const columns: TableColumnProps[] = [
        {
            title: 'ID',
            dataIndex: 'componentId',
        },
        {
            title: 'Title',
            dataIndex: 'title',
        },
        {
            title: 'Display',
            dataIndex: 'configData',
            headerCellStyle: { width: '450px' },
            render: (value, record) => {
                if(record.componentType == ComponentTypeEnum.FILTER_SELECT){
                    return (
                        <TreeSelect size={"mini"} treeData={translateToTreeNodes(value)} />
                    )
                }
            },
        },
        {
            title: 'Operation',
            dataIndex: 'operation',
            cellStyle:{textAlign:"center"},
            render: (value, record) => {
                return (
                    <IconPlus style={{cursor:'pointer'}} onClick={() => onSelect(record)}/>
                )
            }
        },
    ];

    function onChangeTable({ current, pageSize }) {
        setPagination({
            ...pagination,
            current,
            pageSize,
        });
    }

    const dataFormat = (list:Component[]):RenderFilterConfig[] => {
        return list?.map(z => {
            const filter: RenderFilterConfig = {};
            filter.configData = z.configuration;
            filter.title = z.title;
            filter.componentId = z.id;
            filter.componentType = z.componentType;
            return filter;
        });
    }

    const fetchData = async () => {
        const {current, pageSize} = pagination;
        const combineParam = {};
        await requestList({
            queryParams:combineParam,
            pagination:{
                pageSize:pageSize,
                pageNum:current,
            }
        }).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                const listData = dataFormat(data.list);
                setListData(listData);
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

    useEffect(() => {
        fetchData().then();
    },[])

    return (
        <Space size={16} direction="vertical" style={{ width: '100%',height:'270px' }}>
            <Input.Search  placeholder={'Search'} allowClear style={{width:'320px',marginLeft:'3px'}}/>
            <Table rowKey={'componentId'} size={"mini"} columns={columns} data={listData} pagination={pagination}/>
        </Space>
    );
}