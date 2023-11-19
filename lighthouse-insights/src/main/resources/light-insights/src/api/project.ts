import {request} from "@/utils/request";
import {ResultData} from "@/types/insights-common";
import {Project} from "@/types/insights-web";

export async function requestList(data) :Promise<ResultData<{list:Array<Project>,total:number}>> {
    return request({
        url:'/project/list',
        method:'POST',
        data,
    })
}

export async function requestQueryById(id:number):Promise<ResultData<Project>> {
    return request({
        url:'/project/queryById',
        method:'POST',
        id,
    })
}

export async function requestCreate(data:Project):Promise<ResultData> {
    return request({
        url:'/project/create',
        method:'POST',
        data,
    })
}

export async function requestUpdateById(data:Project):Promise<ResultData> {
    return request({
        url:'/project/updateById',
        method:'POST',
        data,
    })
}

export async function requestDeleteById(id:number):Promise<ResultData> {
    return request({
        url:'/project/deleteById',
        method:'POST',
        id,
    })
}


