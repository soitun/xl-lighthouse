export interface ResultData<S = any> {
    code: string;
    message?: string;
    data?:S ;
}

export interface ArcoTreeNode {
    key: string;
    title: string;
    id?:number;
    type?:number;
    children?:Array<ArcoTreeNode>;
}

export interface NodeOption {
    label:string;
    value:string;
    children?:Array<NodeOption>;
}
