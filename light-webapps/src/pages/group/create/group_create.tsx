import {
  Button,
  Form,
  Grid,
  Input, Message,
  Modal, Notification,
  Select, Space,
  Typography
} from '@arco-design/web-react';
import React, {useEffect, useRef, useState} from 'react';
import useLocale from '@/utils/useLocale';
import locale from './locale';
import EditTable, {EditTableColumnProps, EditTableComponentEnum} from "@/pages/common/edittable/EditTable";
import {IconMinusCircleFill, IconPlus} from "@arco-design/web-react/icon";
import {formatString, getTextBlenLength, stringifyObj} from "@/utils/util";
import {requestCreate} from "@/api/group";
import {Group, Project} from "@/types/insights-web";
import {_TokenPattern, _ColumnNamePattern} from "@/utils/constants";
import {useSelector} from "react-redux";
import {GlobalState} from "@/store";

export default function GroupCreateModal({projectId,callback,onClose}) {

  const [confirmLoading, setConfirmLoading] = useState(false);
  const userInfo = useSelector((state: GlobalState) => state.userInfo);
  const [columnsData,setColumnsData] = useState([]);

  const editTableRef= useRef(null);
  const t = useLocale(locale);
  const FormItem = Form.Item;
  const formRef = useRef(null);

  const onOk = async() => {
    try{
      await formRef.current.validate();
    }catch (error){
      console.log(error)
      return;
    }
    const values = formRef.current.getFieldsValue();
    const columns = editTableRef.current.getData();
    if(!columns || columns.length == 0){
      Notification.warning({style: { width: 420 }, title: 'Warning', content: t['groupCreate.form.validate.column.notEmpty.errorMsg']});
      return;
    }
    const columnNameArray:string[] = [];
    for(let i=0;i<columns.length;i++){
      const name = columns[i].name;
      const comment = columns[i].comment;
      if(!name){
        Notification.warning({style: { width: 420 }, title: 'Warning', content: t['groupCreate.form.validate.columnName.notEmpty']});
        return;
      }
      if(name.length < 3 || name.length > 15){
        Notification.warning({style: { width: 420 }, title: 'Warning', content: formatString(t['groupCreate.form.validate.columnName.length.failed'],name)});
        return;
      }
      if(!_ColumnNamePattern.test(name)){
        Notification.warning({style: { width: 420 }, title: 'Warning', content: formatString(t['groupCreate.form.validate.columnName.failed'],name)});
        return;
      }
      if(comment && getTextBlenLength(comment) > 50){
        Notification.warning({style: { width: 420 }, title: 'Warning', content: formatString(t['groupCreate.form.validate.columnComment.length.failed'],name)});
        return;
      }
      if(comment && getTextBlenLength(comment) < 3){
        Notification.warning({style: { width: 420 }, title: 'Warning', content: formatString(t['groupCreate.form.validate.columnComment.length.failed'],name)});
        return;
      }
      if(columnNameArray.includes(name)){
        Notification.warning({style: { width: 420 }, title: 'Warning', content: formatString(t['groupCreate.form.validate.columnName.duplicate.failed'],name)});
        return;
      }else{
        columnNameArray.push(name);
      }
      delete columns[i].key;
    }
    const group:Group = {
      projectId:projectId,
      token:values.token,
      desc:values.desc,
      columns:columns,
    }
    setConfirmLoading(true);
    requestCreate(group).then((response) => {
      const {code, data ,message} = response;
      if(code == '0'){
        Notification.info({style: { width: 420 }, title: 'Notification', content: t['groupCreate.form.submit.success']});
        group.id = data.id;
        group.token = data.token;
        callback('create-group',group);
        onClose();
      }else{
        Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
      }
      setConfirmLoading(false);
    }).catch((error) => {
      console.log(error);
      Message.error(t['system.error'])
    })
  }

  const [expandedKeys, setExpandedKeys] = useState([]);

  const columnsProps: EditTableColumnProps[]  = [
    {
      title: 'Name',
      dataIndex: 'name',
      editable: true,
      componentType:EditTableComponentEnum.INPUT,
      headerCellStyle: { width:'20%'},
    },
    {
      title: 'Type',
      dataIndex: 'type',
      editable: true,
      initValue:"string",
      componentType:EditTableComponentEnum.SELECT,
      headerCellStyle: { width:'130px'},
      render:(text, record) => {
        return (
            <Select size={"mini"}
                    popupVisible={expandedKeys.includes(record.key)}
                         onChange={(value) => {record['type'] = value}}
                    onFocus={(e) => {
                      setExpandedKeys((keys) => [...keys, record.key]);
                    }}
                    onKeyDown={(event) => {
                      if(event.key == 'Enter'){
                        setExpandedKeys((keys) => keys.filter((key) => key !== record.key));
                      }
                    }}
                    onBlur={() => {
                      setExpandedKeys((keys) => keys.filter((key) => key !== record.key));
                    }}
                          defaultValue={"string"}>
              <Select.Option style={{lineHeight:'30px'}} key={"string"}  value={"string"} onClick={() => {
                setExpandedKeys((keys) => keys.filter((key) => key !== record.key));
              }}>
                String
              </Select.Option>
              <Select.Option style={{lineHeight:'30px'}} key={"number"}  value={"number"} onClick={() => {
                setExpandedKeys((keys) => keys.filter((key) => key !== record.key));
              }}>
                Number
              </Select.Option>
        </Select>)
      }
    },
    {
      title: 'Comment',
      dataIndex: 'comment',
      componentType:EditTableComponentEnum.INPUT,
      editable: true,
    },
    {
        title: 'Operation',
        dataIndex: 'operation',
        componentType:EditTableComponentEnum.BUTTON,
        headerCellStyle: { width:'12%'},
        render: (_, record) => (
            <div style={{width:'100%',textAlign:"center"}}>
              <IconMinusCircleFill style={{ cursor:"pointer",marginTop:'-5px'}} onClick={() => editTableRef.current.removeRow(record.key)}/>
            </div>
        ),
    },
  ];
  return (
      <Modal
          title={t['groupCreate.modal.title']}
          onOk={onOk}
          visible={true}
          alignCenter={false}
          style={{width:'1060px',maxWidth:'80%',top: '100px'}}
          confirmLoading={confirmLoading}
          onCancel={onClose}
          focusLock={false}
          autoFocus={false}
      >
        <Form
            ref={formRef}
            autoComplete={"off"}
            layout={"vertical"}>
          <Typography.Title
              style={{ marginTop: 0, marginBottom: 15 ,fontSize:14}}
          >
            {'Token'}
          </Typography.Title>
          <Form.Item field="token"
                     rules={[
                       { required: true, message: t['groupCreate.form.validate.token.notEmpty.errorMsg'], validateTrigger : ['onSubmit'] },
                       {
                         required:true,
                         validator: (v, cb) => {
                           if (getTextBlenLength(v) < 5) {
                             return cb(t['groupCreate.form.token.less.limit'])
                           }else if (getTextBlenLength(v) > 25) {
                             return cb(t['groupCreate.form.token.exceeds.limit'])
                           }
                           cb(null);
                         }
                         , validateTrigger : ['onSubmit']
                       },
                       { required: true, match: new RegExp(_TokenPattern,"g"),message: t['groupCreate.form.validate.token.failed'] , validateTrigger : ['onSubmit']},
                     ]}>
            <Input
                allowClear
                autoFocus={false}
                placeholder={'Please Input Token'} addBefore={userInfo?.defaultDomain?.defaultTokenPrefix ? userInfo?.defaultDomain?.defaultTokenPrefix + ':' : null} />
          </Form.Item>
          <Form.Item field="columns">
            <Grid.Row>
              <Grid.Col span={16}>
                <Typography.Title
                    style={{ marginTop: 0, marginBottom: 15 ,fontSize:14}}>
                  {t['groupCreate.form.label.columns']}
                </Typography.Title>
              </Grid.Col>
              <Grid.Col span={8} style={{ textAlign: 'right' }}>
                <Button type={"secondary"} size={"mini"} onClick={() => editTableRef.current.addRow()}>{t['groupCreate.form.button.columnAdd']}</Button>
              </Grid.Col>
            </Grid.Row>
            <EditTable ref={editTableRef} columnsProps={columnsProps} columnsData={columnsData}/>
          </Form.Item>
          <Typography.Title
              style={{ marginTop: 0, marginBottom: 15 ,fontSize:14}}
          >
            {t['groupCreate.form.label.description']}
          </Typography.Title>
          <Form.Item field="desc" rules={[
            { required: true, message: t['groupCreate.form.validate.desc.notEmpty.errorMsg'], validateTrigger : ['onSubmit'] },
          ]}>
            <Input.TextArea maxLength={500} rows={3}  showWordLimit={true}/>
          </Form.Item>
        </Form>
      </Modal>
  );
}
   

