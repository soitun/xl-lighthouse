import React, {useEffect, useMemo, useState} from 'react';
import {
    Radio,
    Button,
    Card,
    Grid,
    PaginationProps,
    Space,
    Table,
    Tabs,
    Typography,
    Modal,
    Divider,
    Steps,
    AutoComplete,
    Select,
    Cascader,
    Form,
    Input,
    InputNumber,
    TreeSelect,
    Switch,
    Message,
    TableColumnProps, Breadcrumb,
} from '@arco-design/web-react';

import SearchForm from "@/pages/filter/list/form";
import FilterAddPanel from "@/pages/filter/add/filter_add";
import {IconHome} from "@arco-design/web-react/icon";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import {Component} from "@/types/insights-common";
import {Project} from "@/types/insights-web";
import {requestList} from "@/api/component";
import {getColumns} from "./constants";

export default function FilterList() {

    const [formParams, setFormParams] = useState({});
    const t = useLocale(locale);
    const [listData,setListData] = useState<Component[]>(null);
    const [loading,setLoading] = useState<boolean>(true);
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

    const [showAddPanel, setShowsAddPanel] = useState(false);

    function handleSearch(params) {
        setPagination({ ...pagination, current: 1 });
        setFormParams(params);
    }
    const tableCallback = async (record, type) => {
        console.log("type is:" + type)
    };

    const columns = useMemo(() => getColumns(t, tableCallback), [t]);

    const fetchData = async (): Promise<void> => {
        setLoading(true);
        const {current, pageSize} = pagination;
        const fetchComponentsInfo:Promise<{list:Array<Component>,total:number}> = new Promise<{list:Array<Component>,total:number}>((resolve) => {
            const proc = async () => {
                const result = await requestList({
                        queryParams:{},
                        pagination:{
                            pageSize:pageSize,
                            pageNum:current,
                        }
                    }
                );
                resolve(result.data);
            }
            proc().then();
        })
        const result = await Promise.all([fetchComponentsInfo]);
        const {list,total}:{list:Array<Project>,total:number} = result[0];
        setListData(list);
        setPagination({
            ...pagination,
            current,
            pageSize,
            total: total});
        setLoading(false);
    }

    useEffect(() => {
        fetchData().then();
    },[])

    return (
        <>
            <Breadcrumb style={{fontSize: 12,marginBottom:'10px'}}>
                <Breadcrumb.Item>
                    <IconHome />
                </Breadcrumb.Item>
                <Breadcrumb.Item style={{fontWeight:20}}>{t['filterList.breadcrumb.title']}</Breadcrumb.Item>
            </Breadcrumb>
            <Card>
                <SearchForm onSearch={handleSearch} />
                <Grid.Row justify="space-between" align="center">
                    <Grid.Col span={16} style={{ textAlign: 'left' }}>
                    </Grid.Col>
                    <Grid.Col span={8} style={{ textAlign: 'right' }}>
                        <Space>
                            <Button size={"small"} type="primary" onClick={() => setShowsAddPanel(true)}>创建</Button>
                        </Space>
                    </Grid.Col>
                </Grid.Row>
                <Table
                    rowKey={'id'}
                    style={{ marginTop:12}}
                    columns={columns} data={listData} />
                {showAddPanel && <FilterAddPanel onClose={() => setShowsAddPanel(false)}/>}
            </Card>
        </>
    );
}