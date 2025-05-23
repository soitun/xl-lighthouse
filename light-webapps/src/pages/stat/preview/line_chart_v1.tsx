import React, {useContext, useEffect, useRef, useState} from 'react';
import {Space} from "@arco-design/web-react";
import ReactECharts from 'echarts-for-react';
import useLocale from "@/utils/useLocale";
import locale from "@/pages/stat/preview/locale";
import dark1Theme from "@/components/Chart/themes/dark1-theme.json"
import light1Theme from "@/components/Chart/themes/light1-theme.json"
import {GlobalContext} from "@/context";
import {
    getEchartsEmptyOption,
    getEchartsErrorOption,
    getEchartsErrorOptionBySize,
    getEchartsLoadingOption
} from "@/components/Chart/lib";

export default function StatBasicLineChart({data = null,errorMessage = null,stateIndex = -1,size="default", loading = false,group=null,showDimens = true}) {

    const [timeIndex,setTimeIndex] = useState<number>(0);
    const [seriesArray,setSeriesArray] = useState([]);
    const [batchList,setBatchList] = useState([]);
    const [dimensList,setDimensList] = useState([]);
    const [option,setOption] = useState({});
    const [loadingOption, setLoadingOption] = useState({});
    const [emptyOption,setEmptyOption] = useState({});
    const chartRef = useRef(null);
    const t = useLocale(locale);
    const { setLang, lang, theme, setTheme } = useContext(GlobalContext);

    const defaultOption = !data ? {} : {
        tooltip: {
            show:data && !loading,
            trigger: 'axis',
            formatter: function (params) {
                if(!params){
                    return;
                }
                const newParams = [];
                const paramData = params.sort(function (a, b) {
                    return (dimensList.indexOf(a.seriesName) - dimensList.indexOf(b.seriesName))
                });
                for (let i = 0, len = paramData.length; i < len; i++) {
                    const v = paramData[i];
                    const dimens = v.seriesName.startsWith('series')?"value":v.seriesName;
                    const s = v.marker + ' ' + dimens + ' : ' + v.value;
                    newParams.push(s)
                }
                return params[0].axisValue + "<br>" + newParams.join('<br>');
            },
            confine: true
        },
        dataZoom: [
            {
                type: 'inside',
                start: 0,
                end: 100
            }
        ],
        legend: {
            show: showDimens,
            data: dimensList,
            icon:'circle',
            itemHeight:'10',
        },
        grid: {
            top: showDimens && dimensList.length> 0 ? '45px':'25px',
            left: '10px',
            right: '10px',
            bottom: '0px',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: batchList,
                axisLabel: {
                    animation: true
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisLabel: {
                    animation: true,
                    formatter: function (value, index) {
                        if (value >= 1000 && value < 1000000) {
                            value = value / 1000 + "K";
                        } else if (value >= 1000000 && value < 1000000000) {
                            value = value / 1000000 + "M";
                        } else if (value >= 1000000000 && value < 1000000000000) {
                            value = value / 1000000000 + "B";
                        } else if (value >= 1000000000000) {
                            value = value / 1000000000000 + "T";
                        }
                        return value;
                    }
                },
            }
        ],
        series: seriesArray,
    };

    const getSeries = (chartData) => {
        const seriesArray = new Array<any>();
        for(let i=0;i<chartData.length;i++){
            const dimensValue = chartData[i].displayDimensValue;
            let values;
            if(stateIndex == -1){
                values = chartData[i].valuesList.map(z => z.value);
            }else{
                values = chartData[i].valuesList.map(z => z.statesValue[stateIndex]);
            }
            const seriesObj =  {
                name: dimensValue,
                type: 'line',
                data: values,
                label: {
                    show: false,
                },
            };
            seriesArray.push(seriesObj);
        }
        return seriesArray;
    }

    useEffect(() => {
       if(data){
            const chart = chartRef.current.getEchartsInstance();
            chart.group = group;
            const dimensList = data.map(z => z.displayDimensValue);
            setDimensList(dimensList.length == 1 && dimensList[0] == null ? [] : dimensList);
            const batchList = data[0].valuesList.map(z => z.displayBatchTime);
            setBatchList(batchList);
            errorMessage = null;
            const seriesArray = getSeries(data);
            setSeriesArray(seriesArray);
            chart.clear();
        }else{
            const chart = chartRef.current.getEchartsInstance();
            chart.clear();
            const errorOption = getEchartsErrorOptionBySize(theme,errorMessage,size);
            chart.setOption(errorOption);
        }
    },[JSON.stringify(data),errorMessage,theme])

    useEffect(() => {
        setLoadingOption(getEchartsLoadingOption(theme));
        setEmptyOption(getEchartsEmptyOption(t,theme));
    },[theme])


    const getReactChart = () => {
        if(size == 'default'){
            return <ReactECharts ref={chartRef} theme={theme == 'dark' ? dark1Theme : light1Theme} option={!data? {}:defaultOption} style={{ height: '300px' ,width:'100%',marginLeft:'0px'}} showLoading={loading} loadingOption={loadingOption}/>
        }else if(size == 'small'){
            return <ReactECharts ref={chartRef} theme={theme == 'dark' ? dark1Theme : light1Theme} option={!data? {}:defaultOption} style={{ height: '230px' ,width:'100%',marginLeft:'0px'}} showLoading={loading} loadingOption={loadingOption}/>
        }else if(size == 'mini'){
            return <ReactECharts ref={chartRef} theme={theme == 'dark' ? dark1Theme : light1Theme} option={!data? {}:defaultOption} style={{ height: '150px' ,width:'100%',marginLeft:'0px'}} showLoading={loading} loadingOption={loadingOption}/>
        }
    }

    return (<>
        <Space size={16} direction="vertical" style={{ width: '100%' }}>
            {getReactChart()}
        </Space>
    </>);
}