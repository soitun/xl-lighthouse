import React, {useEffect, useState} from 'react';
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import {
    IconBook,
    IconClockCircle, IconLock, IconStar, IconStarFill,
    IconUserGroup
} from "@arco-design/web-react/icon";
import {
    Button,
    Descriptions,
    Grid,
    Notification,
    Popconfirm,
} from "@arco-design/web-react";
import {MetricSet, Project} from "@/types/insights-web";
import {requestStarById, requestUnStarById} from "@/api/metricset";
import {useDispatch,useSelector} from "react-redux";
import {updateStoreStaredMetricInfo} from "@/store";
const { Row, Col } = Grid;

export default function MetricSetStar({metricInfo}) {

    const t = useLocale(locale);
    const dispatch = useDispatch();
    const [loading,setLoading] = useState<boolean>(false);
    const staredMetricInfo = useSelector((state: {staredMetricInfo:Array<MetricSet>}) => state.staredMetricInfo);

    const handlerStar = async (record) => {
        setLoading(true);
        const id = record.id;
        await requestStarById({id}).then((response) => {
            const {code, data ,message} = response;
            if(code == '0'){
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['metricStar.operations.star.submit.success']});
                localStorage.removeItem('cache_stared_metrics');
                setTimeout(() => {
                    const currentFixedData = staredMetricInfo?.filter(x => x.id != record.id);
                    dispatch(updateStoreStaredMetricInfo([record,...currentFixedData]))
                },0)
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
                Notification.info({style: { width: 420 }, title: 'Notification', content: t['metricStar.operations.unstar.submit.success']});
                localStorage.removeItem('cache_stared_metrics');
                const currentFixedData = staredMetricInfo?.filter(x => x.id != record.id);
                dispatch(updateStoreStaredMetricInfo([...currentFixedData]))
            }else{
                Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
            }
            setLoading(false);
        }).catch((error) => {
            console.log(error);
        })
    }

    const IconList = [
        IconStarFill,
    ].map((Tag, index) => <Tag key={index} />);

    return (
        staredMetricInfo?.map(z => z.id).includes(metricInfo?.id)?
            <Popconfirm
                focusLock
                position={"br"}
                title='Confirm'
                content={t['metricStar.operations.unstar.confirm']}
                onOk={async (e) => {await handlerUnStar(metricInfo)}}>
                <Button size={"mini"} shape={"round"} icon={<IconStarFill/>} style={{cursor:"pointer",color:'#626aea'}}/>
            </Popconfirm>
            :
            <Popconfirm
                focusLock
                position={"br"}
                title='Confirm'
                content={t['metricStar.operations.star.confirm']}
                onOk={async (e) => {await handlerStar(metricInfo)}}
            >
                <Button size={"mini"} shape={"round"} icon={<IconStar/>} style={{cursor:"pointer",color:'#626aea'}}/>
            </Popconfirm>
    );
}