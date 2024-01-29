import React, {useContext, useRef, useState} from 'react';
import {Button, Card, Grid, Notification, Space, Spin, Tabs, Typography} from '@arco-design/web-react';
import styles from "./style/index.module.less";
import StructurePanel from "@/pages/metricset/structure/structure";
import {MetricSetPreviewContext} from "@/pages/metricset/preview";
import {MdOutlineNewLabel} from "react-icons/md";
import {requestResetStructure, requestUpdateStructure} from "@/api/metricset";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import MetricSetPendAddModal from "@/pages/metricset/structure/PendAddModal";
import {TreeNode} from "@/types/insights-web";

const { Title } = Typography;
const { Row, Col } = Grid;
const TabPane = Tabs.TabPane;

export const MetricSetStructureContext = React.createContext(null)

export default function MetricSetStructure() {

    const t = useLocale(locale);
    const [loading,setLoading] = useState<boolean>(false);
    const { metricSetInfo, setMetricSetInfo } = useContext(MetricSetPreviewContext);
    const { reloadTime, setReloadTime } = useContext(MetricSetPreviewContext);
    const [selectedStatId,setSelectedStatId] = useState<number>(null);
    const [showPendAddModal,setShowPendAddModal] = useState<boolean>(false);
    const structureRef = useRef(null);
    const [listNodes,setListNodes] = useState<TreeNode[]>([Object.assign({},metricSetInfo?.structure)]);
    const handlerCallback = async (type,record) => {
        if(type == 'clickStatMenu'){
            setSelectedStatId(Number(record));
        }
    }

    const handleShowPendAddModal = () => {
        setShowPendAddModal(true);
    }

    const handlerSubmit = async () => {
        setLoading(true);
        const treeData = structureRef.current.getData()[0];
        const updateParam = {
            id:metricSetInfo?.id,
            structure:treeData,
        }
        await requestUpdateStructure(updateParam).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['structure.operations.update.success']});
                setReloadTime(Date.now());
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
        }).catch((error) => {
            console.log(error);
        }).finally(() => {
            setLoading(false);
        })
    }

    const handlerReset = async () => {
        setLoading(true);
        const id = metricSetInfo?.id;
        await requestResetStructure({id}).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['structure.operations.reset.success']});
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
        }).catch((error) => {
            console.log(error);
        }).finally(() => {
            setLoading(false);
        })
    }

    return (
        <MetricSetStructureContext.Provider value={{listNodes,setListNodes}}>
        <Spin loading={loading} style={{display:'block'}} className={styles['ss']}>
            <Space size={16} direction="vertical" style={{ width: '100%'}}>
                <div className={styles.wrapper}>
                    <Space size={16} direction="vertical" className={styles.left}>
                        <Card>
                            {listNodes && <StructurePanel ref={structureRef}  menuCallback={handlerCallback}/>}
                        </Card>
                        <Card>
                            <Grid.Row justify="end">
                                <Grid.Col span={18}>
                                    <Space className={styles.right} size={16} direction="horizontal">
                                        <Button size={"mini"} type="secondary" icon={<MdOutlineNewLabel/>} onClick={handleShowPendAddModal}>{t['pendAddModal.button.label.pendAdd']}</Button>
                                    </Space>
                                </Grid.Col>
                                <Grid.Col span={6}>
                                    <Space className={styles.right} size={16} direction="horizontal">
                                        <Button size={"small"} type={"primary"} onClick={handlerReset} status={"danger"}>{t['pendAddModal.button.label.reset']}</Button>
                                        <Button size={"small"} type="primary" onClick={handlerSubmit}>{t['pendAddModal.button.label.submit']}</Button>
                                    </Space>
                                </Grid.Col>
                            </Grid.Row>
                        </Card>
                    </Space>
                    {showPendAddModal && <MetricSetPendAddModal id={metricSetInfo?.id} onClose={() => setShowPendAddModal(false)} />}
                </div>
            </Space>
        </Spin>
        </MetricSetStructureContext.Provider>
    );
}