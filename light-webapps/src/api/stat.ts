import {request} from "@/utils/request";
import {ChartTypeEnum, ResultData} from "@/types/insights-common";
import {Group, Project, Stat, User} from "@/types/insights-web";


export async function requestList(data) :Promise<ResultData<{list:Array<Stat>,total:number}>> {
    return request({
        url:'/stat/list',
        method:'POST',
        data,
    })
}

export async function requestCreate(data):Promise<ResultData> {
    return request({
        url:'/stat/create',
        method:'POST',
        data,
    })
}

export async function requestFilterConfig(data):Promise<ResultData> {
    return request({
        url:'/stat/filterConfig',
        method:'POST',
        data,
    })
}

export async function requestFilterReset(data):Promise<ResultData> {
    return request({
        url:'/stat/filterReset',
        method:'POST',
        data,
    })
}

export async function requestRenderConfig(data):Promise<ResultData> {
    return request({
        url:'/stat/renderConfig',
        method:'POST',
        data,
    })
}

export async function requestRenderReset(data):Promise<ResultData> {
    return request({
        url:'/stat/renderReset',
        method:'POST',
        data,
    })
}




export async function requestUpdate(data):Promise<ResultData> {
    return request({
        url:'/stat/update',
        method:'POST',
        data,
    })
}

export async function requestChangeState(data):Promise<ResultData> {
    return request({
        url:'/stat/changeState',
        method:'POST',
        data,
    })
}

export async function requestQueryById(data) :Promise<ResultData<Stat>> {
    return request({
        url:'/stat/queryById',
        method:'POST',
        data,
    })
}

export async function requestQueryByGroupId(data) :Promise<ResultData<{list:Array<Stat>}>> {
    return request({
        url:'/stat/queryByGroupId',
        method:'POST',
        data,
    })
}

export async function requestDeleteById(data) :Promise<ResultData> {
    return request({
        url:'/stat/deleteById',
        method:'POST',
        data,
    })
}

export async function requestQueryByIds(data:{ids:number[]}) :Promise<ResultData<Record<number,Stat>>> {
    return request({
        url:'/stat/queryByIds',
        method:'POST',
        data,
    })
}





