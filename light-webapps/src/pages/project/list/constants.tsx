import React from 'react';
import {Button, Typography, Space, Link, Popconfirm} from '@arco-design/web-react';
const { Text } = Typography;
import { IoInformationCircleOutline } from "react-icons/io5";
import UserGroup from "@/pages/user/common/groups";
import {formatTimeStampBackUp, getRandomString} from "@/utils/util";
import DepartmentLabel from "@/pages/department/common/depart";
import { CiLock } from "react-icons/ci";
import {getIcon} from "@/desc/base";
import {Project} from "@/types/insights-web";

export function getColumns(t: any, staredProjectInfo:Array<Project>, callback: (record: Record<string, any>, type: string) => Promise<void>) {
  return [
      {
          title: '',
          dataIndex: 'star',
          headerCellStyle: { width:'20px' },
          render: (_, record) => {
              return(
                  staredProjectInfo?.map(z => z.id).includes(record.id)?
                  <Popconfirm

                      position={"bl"}
                      title='Confirm'
                      content={t['projectList.operations.unstar.confirm']}
                      onOk={async (e) => {await callback(record,"unstar")}}
                  >
                      <Button icon={getIcon('stared')} size={"mini"} shape={"round"} />
                  </Popconfirm>
                      :
                  <Popconfirm

                      position={"bl"}
                      title='Confirm'
                      content={t['projectList.operations.star.confirm']}
                      onOk={async (e) => {await callback(record,"star")}}
                  >
                      <Button icon={getIcon('star')} size={"mini"} shape={"round"} />
                  </Popconfirm>
              )
          }
      },
    {
      title: t['projectList.columns.id'],
      dataIndex: 'id',
      render: (value,record) =>
            <Text>{value}</Text>
              ,
    },
    {
      title: <>{t['projectList.columns.name']}<IoInformationCircleOutline style={{fontSize:12}}/></>,
      dataIndex: 'title',
      render: (value,record) =>
      {
          return (
              <div style={{ cursor: "pointer" }} >
                  <span style={{display:"inline-flex",alignItems:"center"}}>{value}{record.privateType == 0 ?<CiLock style={{marginLeft:'5px'}}/>:null}</span>
              </div>)
      }
              ,
    },
      {
          title: t['projectList.columns.department'],
          dataIndex: 'departmentId',
          render: (value,record) => <DepartmentLabel departmentId={value}/> ,
      },
    {
          title: t['projectList.columns.admins'],
          dataIndex: 'admins',
          render: (value) => {
              return (<UserGroup users={value}/>);
          },
    },
    {
      title: t['projectList.columns.createdTime'],
      dataIndex: 'createTime',
      render: (value) => {return formatTimeStampBackUp(value)},
    },
    {
      title: t['projectList.columns.operations'],
      dataIndex: 'operations',
      headerCellStyle: {width:'250px' },
      render: (_, record) => {
          let viewButton;
          let updateButton;
          let manageButton;
          let deleteButton;
          let applyButton;
          if(record.permissions.includes('ManageAble')){
              viewButton = <Button key={getRandomString()}
                  type="text"
                  onClick={() => window.open('/project/preview/' + record.id)}
                  size="mini">
                  {t['projectList.columns.operations.view']}
              </Button>;
                updateButton = <Button key={getRandomString()}
                    onClick={() => callback(record, 'update')}
                    type="text"
                    size="mini">
                    {t['projectList.columns.operations.update']}
                </Button>;
              manageButton = <Link key={getRandomString()} target={"_blank"} href={'/project/manage/' + record.id}>
                  <Button
                      type="text"
                      size="mini">
                      {t['projectList.columns.operations.manage']}
                  </Button>
              </Link>
              deleteButton =
                  <Popconfirm key={getRandomString()}
                              focusLock
                              position={"tr"}
                              title='Confirm'
                              content={t['projectList.form.delete.confirm']}
                              onOk={() => callback(record, 'delete')}
                  >
                  <Button
                      type="text"
                      size="mini">
                      {t['projectList.columns.operations.delete']}
                  </Button>
                  </Popconfirm>
          }else if(record.permissions.includes('AccessAble')){
              viewButton = <Button key={getRandomString()}
                      type="text"
                      onClick={() => window.open('/project/preview/' + record.id)}
                      size="mini">
                      {t['projectList.columns.operations.view']}
                  </Button>;
          }else{
              applyButton =
                  <Button
                      key={getRandomString()}
                      onClick={() => callback(record, 'apply')}
                      type="text"
                      size="mini">
                      {t['projectList.columns.operations.apply']}
                  </Button>
          }
          return  <Space size={0} direction="horizontal">{[viewButton,updateButton,manageButton,deleteButton,applyButton]}</Space>;
      }
    },
  ]
}


export function getBindColumns(t: any,bindList:Array<number>, callback: (record: Record<string, any>, type: string) => Promise<void>) {
    return [
        {
            title: t['projectList.columns.id'],
            dataIndex: 'id',
            render: (value,record) =>
                <Text>{value}</Text>
            ,
        },
        {
            title: <>{t['projectList.columns.name']}<IoInformationCircleOutline style={{fontSize:12}}/></>,
            dataIndex: 'title',
            render: (value,record) =>
            {
                return (
                        <span style={{display:"inline-flex",alignItems:"center"}}>{value}{record.privateType == 0 ?<CiLock style={{marginLeft:'5px'}}/>:null}</span>
                    )
            }
            ,
        },
        {
            title: t['projectList.columns.department'],
            dataIndex: 'departmentId',
            render: (value,record) => <DepartmentLabel departmentId={value}/> ,
        },
        {
            title: t['projectList.columns.admins'],
            dataIndex: 'admins',
            render: (value) => {
                return (<UserGroup users={value}/>);
            },
        },
        {
            title: t['projectList.columns.createdTime'],
            dataIndex: 'createTime',
            render: (value) => {return formatTimeStampBackUp(value)},
        },
        {
            title: t['projectList.columns.operations'],
            dataIndex: 'operations',
            headerCellStyle: {width:'130px' },
            render: (_, record) => {
                let bindButton = null;
                if(bindList.includes(record.id)){
                    bindButton =
                        <Button key={getRandomString()} disabled={true}
                                type="secondary"
                                size="mini">
                            {t['projectList.columns.operations.binded']}
                        </Button>;
                }else{
                    bindButton = <Popconfirm key={getRandomString()}
                                             position={"tr"}
                                             focusLock
                                             onOk={() => callback(record, 'bind')}
                                             title='Confirm'
                                             content={t['projectList.columns.operations.bind.confirm']}>
                        <Button
                            type="text"
                            size="mini">
                            {t['projectList.columns.operations.bind']}
                        </Button>
                    </Popconfirm>;
                }
                return <Space size={16} direction="horizontal">{[bindButton]}</Space>
            }
        },
    ]
}

export default function Constants() {
    return <>{/* nothing */}</>;
}
