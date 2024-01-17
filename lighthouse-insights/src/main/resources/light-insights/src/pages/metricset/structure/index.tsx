import React, {useEffect, useState} from 'react';
import {useParams} from "react-router-dom";
import {
    Card,
    Typography,
    Grid,
    Space,
    Tabs,
    Divider,
    Notification,
    Breadcrumb,
    Spin,
    Button
} from '@arco-design/web-react';
import PreviewHeader from "@/pages/metricset/preview/header";
import {IconDashboard, IconHome, IconRefresh, IconSearch, IconTag, IconThunderbolt} from "@arco-design/web-react/icon";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import {requestQueryById} from "@/api/metricset";
import {MetricSet} from "@/types/insights-web";
import MetricSetPreviewPanel from "@/pages/metricset/preview/panel_dashboard/dashboard";
import MetricBindedList from "@/pages/metricset/binded/list";
import styles from "./style/index.module.less";
import DashboardMenu from "@/pages/metricset/preview/panel_dashboard/menu";
import StatPreviewPanel from "@/pages/stat/display/preview";
import StructurePanel from "@/pages/metricset/structure/structure";
const { Title } = Typography;
const { Row, Col } = Grid;
const TabPane = Tabs.TabPane;

export default function MetricSetStructure({metricSetInfo}) {

    const [loading,setLoading] = useState<boolean>(false);
    const [selectedStatId,setSelectedStatId] = useState<number>(null);
    const handlerCallback = async (type,record) => {
        if(type == 'clickStatMenu'){
            setSelectedStatId(Number(record));
        }

    }

    useEffect(() => {
        console.log("structure is:" + JSON.stringify(metricSetInfo.structure))
    },[])

    return (
        <Spin loading={loading} style={{display:'block'}} className={styles['ss']}>
            <Space size={16} direction="vertical" style={{ width: '100%'}}>
                <div className={styles.wrapper}>
                    <Space size={16} direction="vertical" className={styles.left}>
                        <Card>
                            <StructurePanel structure={metricSetInfo?.structure} menuCallback={handlerCallback}/>
                        </Card>
                        <Card>
                            <Grid.Row justify="end">
                                <Grid.Col span={8}>
                                    <Space className={styles.right} size={16} direction="horizontal">
                                        <Button size={"small"} type="primary">确认</Button>
                                        <Button size={"small"}>取消</Button>
                                    </Space>
                                </Grid.Col>
                            </Grid.Row>
                        </Card>
                    </Space>
                    <Space className={styles.right} size={16} direction="vertical">
                        {selectedStatId && <StatPreviewPanel id={selectedStatId}/>}
                    </Space>
                </div>
            </Space>
        </Spin>
    );
}