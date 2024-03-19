import React, {useEffect, useRef, useState} from 'react';
import {Space} from "@arco-design/web-react";
import ReactECharts from 'echarts-for-react';
import {loadingOption} from "@/pages/stat/preview/common";
import {stringifyObj} from "@/utils/util";
import * as echarts from "echarts";
import {IconStar} from "@arco-design/web-react/icon";

export default function TimeLineBarPanel({data = null,size="default", loading = false,group=null}) {

    const [timeIndex,setTimeIndex] = useState<number>(0);
    const [seriesArray,setSeriesArray] = useState([]);
    const [batchList,setBatchList] = useState([]);
    const [dimensList,setDimensList] = useState([]);
    const chartRef = useRef(null);

    const handleTimelineClick = (e) => {
        console.log("e is:" + e);
    };

    const getSeries = (chartData) => {
        const seriesArray = new Array<any>();
        for(let i=0;i<chartData.length;i++){
            const dimensList = chartData[i].values;
            const seriesData = [];
            for(let k=0;k < dimensList.length;k++){
                seriesData[k] = dimensList[k].score;
            }
            const seriesObj = {
                series: [
                    {
                        name: 'Series',
                        type: 'bar',
                        data: seriesData,
                        animation: true,
                        animationDuration: 1000,
                    }
                ]
            };
            seriesArray.push(seriesObj);
        }
        return seriesArray;
    }

    const defaultOption = {
        baseOption: {
            grid: {
              top:'25px',
              left:'50px',
              right:'50px',
            },
            tooltip: {
                show:data && !loading,
                trigger: 'axis',
                formatter: function (params) {
                    if(!params || !Array.isArray(params)){
                        return;
                    }
                    const newParams = [];
                    const paramData = params.sort(function (a, b) {
                        return b.value - a.value;
                    });
                    for (let i = 0, len = paramData.length; i < len; i++) {
                        const v = paramData[i];
                        const s = v.marker + ' value : ' + v.value;
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
            timeline: {
                axisType: 'category',
                autoPlay: false,
                playInterval: 1000,
                currentIndex:timeIndex,
                left: '100px',
                right:'100px',
                bottom:'25px',
                top:'385px',
                data: batchList,
                label:{
                    normal:{
                        show:true,
                    }
                },
                controlStyle:{
                    showPlayBtn:false,
                    showPrevBtn:true,
                    showNextBtn:true,
                    itemGap:20,
                    prevBtnSize:10,
                    nextBtnSize:10,
                },
                checkpointStyle: {
                    symbol: 'circle',
                    symbolSize: 15,
                    normal: {
                        color: 'lightgray',
                        show: true,
                    },
                },
                symbolSize: 8,
                symbol:'emptyCircle',
                lineStyle: {
                    width: 2,
                },
            },
            xAxis: {
                type: 'category',
                data: dimensList,
            },
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
            series: [{
                type: 'bar',
            }]
        },
        options: seriesArray,
    };

    useEffect(() => {
        if(data){
            setDimensList(data[timeIndex].values.map(z => z.dimensValue));
        }
    },[timeIndex])

    const onclick={
        click:(params)=>{
            const index = params.dataIndex;
            setDimensList(data[index].values.map(z => z.dimensValue));
            setTimeIndex(index);
        },
    }

    useEffect(() => {
        if(data){
            const seriesArray = getSeries(data);
            setSeriesArray(seriesArray);
            const batchList = data.map(z => z.displayBatchTime);
            setBatchList(batchList);
        }
    },[data])

    useEffect(() => {
        const chart = chartRef.current.getEchartsInstance();
        chart.on('timelinechanged', (e:any) => {
            const index = e.currentIndex;
            setTimeIndex(index);
        });
    },[])

    const getReactChart = () => {
        if(size == 'default'){
            return <ReactECharts ref={chartRef} option={defaultOption} style={{ height: '300px' ,width:'100%',marginLeft:'0px'}}  showLoading={loading} loadingOption={loadingOption}/>
        }else if(size == 'small'){
            return <ReactECharts ref={chartRef} option={defaultOption} style={{ height: '230px' ,width:'100%',marginLeft:'0px'}} showLoading={loading} loadingOption={loadingOption}/>
        }else if(size == 'mini'){
            return <ReactECharts ref={chartRef} option={defaultOption} style={{ height: '150px' ,width:'100%',marginLeft:'0px'}} showLoading={loading} loadingOption={loadingOption}/>
        }
    }

    return (<>
        <Space size={16} direction="vertical" style={{ width: '100%' }}>
            <div onWheel={(e) => {e.stopPropagation();}}>
                {getReactChart()}
            </div>
        </Space>
    </>);
}