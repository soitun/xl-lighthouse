import React, {useEffect, useState} from 'react';
import {useParams} from "react-router-dom";
import {ArcoTreeNode, Department} from "@/types/insights-web";
import {RenderConfig, RenderTypeEnum, ResultData} from "@/types/insights-common";
import {requestQueryDimensValue} from "@/api/group";
import {Descriptions, Divider, Form, Grid, Select, TreeSelect, Typography} from "@arco-design/web-react";
import {Col} from "antd";
import {translate} from "@/pages/department/common";
import {useSelector} from "react-redux";
import useLocale from "@/utils/useLocale";
import locale from "@/pages/project/list/locale";
import styles from "@/pages/stat/display/style/index.module.less";
import { Line } from '@ant-design/plots';
import { Chart, Line as Line2, Point, Tooltip,getTheme } from "bizcharts";
import { LineAdvance} from 'bizcharts';
import {IconEdit, IconList, IconPublic, IconPushpin} from "@arco-design/web-react/icon";


export default function ChartPanel({searchForm={}}) {

    const data = [
        { year: '1991', value: 3 },
        { year: '1992', value: 4 },
        { year: '1993', value: 3.5 },
        { year: '1994', value: 5 },
        { year: '1995', value: 4.9 },
        { year: '1996', value: 6 },
        { year: '1997', value: 7 },
        { year: '1998', value: 9 },
        { year: '1999', value: 13 },
    ];

    const config = {
        data,
        xField: 'year',
        yField: 'value',
        point: {
            size: 5,
        },

        theme:'light',
    };

    // const config = {
    //     data,
    //     padding: 'auto',
    //     xField: 'Date',
    //     yField: 'value',
    //     xAxis: {
    //         // type: 'timeCat',
    //         tickCount: 5,
    //     },
    // };

    // 数据源
    const data2 = [
        {
            year: "1991",
            value: 3,
        },
        {
            year: "1992",
            value: 4,
        },
        {
            year: "1993",
            value: 3.5,
        },
        {
            year: "1994",
            value: 5,
        },
        {
            year: "1995",
            value: 4.9,
        },
        {
            year: "1996",
            value: 6,
        },
        {
            year: "1997",
            value: 7,
        },
        {
            year: "1998",
            value: 9,
        },
        {
            year: "1999",
            value: 13,
        },
    ];

    useEffect(() => {
        console.log("chart panel..")
    },[])

    return (<>
        <Line style={{ height:'350px'}} {...config} />
    </>);
}