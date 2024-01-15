import {List} from "@arco-design/web-react";
import {
    ApproveStateEnum,
    RenderDateConfig,
    RenderFilterConfig, OrderStateEnum,
    OrderTypeEnum, PermissionEnum, RecordTypeEnum,
    ResourceTypeEnum, RoleTypeEnum, StatStateEnum, UserStateEnum, PrivateTypeEnum
} from "@/types/insights-common";


export interface Department {
    id: number;
    name: string;
    children?:Array<Department>;
    pid:number;
}

export interface GrantPrivileges {
    id:number;
    departments?:Array<number>;
    users?:Array<number>;
    teams?:Array<number>;
}

export interface TreeNode {
    label?:string;
    value?:string;
    type?:any;
    children?:Array<TreeNode>;
}

export interface ArcoTreeNode {
    key: string;
    title: string;
    disabled?:boolean;
    icon?:any;
    children?:Array<ArcoTreeNode>;
}

export interface BackUpTreeNode {
    id?: string;
    name?: string;
    pid?:string;
    type?:string;
    children?:Array<BackUpTreeNode>;
}

export interface ArcoFlatNode {
    key: string;
    title: string;
}

export interface User {
    id?: number;
    username?: string;
    password?:string;
    email?: string;
    phone?: string;
    departmentId?: number;
    state?:UserStateEnum;
    createTime?:number;
    avatar?:string;
    permissions?: any;
}

export interface Project {
    id?:number;
    title?:string;
    desc?:string;
    privateType?:number;
    adminIds?:Array<number>;
    admins?:Array<User>;
    departmentId?:number;
    structure?:Array<TreeNode>;
    createTime?:number;
    permissions?:PermissionEnum[];
    usersPermission?:number[],
    departmentsPermission?:number[],
}

export interface Relation {
    id?:number;
    relationId?:number;
    relationType?:RelationTypeEnum;
    resourceId?:number;
    resourceType?:ResourceTypeEnum;
    createTime?:number;
    extend?:any;
}

export enum RelationTypeEnum {
    MetricSetBindRelation=1,
    UserPickUpMetricSetRelation=2,
    StatPrecedingIndicator=3,
    StatParallelIndicator=4,
    StatSubsequentIndicator=5,
}


export interface Column {
    key?:number|string;
    name?:string;
    type?:number;
    comment?:string;
}

export interface Group {
    id?:number;
    token?:string;
    projectId?:number;
    project?:Project;
    desc?:string;
    createTime?:number;
    columns?:Array<Column>;
}

export interface Stat {
    id?:number;
    title?:string;
    groupId?:number;
    projectId?:number;
    timeparam?:string;
    template?:string;
    expired?:number;
    createdTime?:number;
    group?:Group;
    project?:Project;
    dimensArray?:Array<string>;
    desc?:string;
    state?:StatStateEnum;
    renderConfig?:{datepicker:RenderDateConfig,filters:Array<RenderFilterConfig>}
    permissions?:PermissionEnum[];
}

export interface MetricSet {
    id?:number;
    title?:string;
    adminIds?:Array<number>;
    admins?:Array<User>;
    privateType?:PrivateTypeEnum;
    desc?:string;
    createTime?:number;
    updateTime?:number;
    initUsersPermission?:number[],
    initDepartmentsPermission?:number[],
}


export interface Order {
    id?:number;
    userId?:number;
    user?:User;
    title?:string;
    createTime?:number;
    updateTime?:number;
    desc?:string;
    adminsMap?:any;
    state?:OrderStateEnum;
    currentNode?:number;
    orderType?:OrderTypeEnum;
    orderDetails?:OrderDetail[];
    extendConfig?:any;
    permissions?:PermissionEnum;
}

export interface OrderDetail {
    id?:number;
    orderId?:number;
    state?:ApproveStateEnum;
    roleType?:RoleTypeEnum;
    roleId?:number;
    user:User;
    createTime?:number;
    approveTime?:number;
}

export interface LoginParam {
    username?:string;
    password?:string;
}

export interface Record {
    id?:number;
    userId?:number;
    resourceId?:number;
    resourceType?:ResourceTypeEnum;
    recordType?:RecordTypeEnum;
    desc?:string;
    recordTime?:number;
}

export interface StatData{
    statId?:number;
    dimens?:string;
    dimensValue?:string;
    displayDimensValue?:string;
    valuesList?:StatValue[];
}

export interface EChartChartValue {
    name?:string;
    type?:string;
    data?:Array<number>;
}

export interface StatValue {
    batchTime?:number;
    displayBatchTime?:string;
    value?:number;
    statesValue?:number[];
    updateTime?:number;
}

