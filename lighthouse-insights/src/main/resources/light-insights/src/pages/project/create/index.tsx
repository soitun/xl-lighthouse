import React, {useRef} from 'react';
import {Form, Input, Message, Modal, Radio, TreeSelect} from "@arco-design/web-react";
import UserTermQuery from "@/pages/user/common/userTermQuery";
import {translate} from "@/pages/department/common";
import useLocale from "@/utils/useLocale";
import locale from "./locale";
import {getTextBlenLength} from "@/utils/util";
import {requestCreate} from "@/api/project";

function ProjectCreatePanel({onClose,allDepartInfo}){

    const t = useLocale(locale);

    const formRef = useRef(null);

    function handlerSubmit(){
        formRef.current.validate().then((values) => {
            console.log("values is:" + JSON.stringify(values));
            requestCreate(values).then(result => {
                if(result.code === '0'){
                    Message.success(t['projectCreate.form.submit.success']);
                }else{
                    Message.error(result.message || t['system.error']);
                }
            })
        })
    }

    return (
        <Modal
            title= {t['projectCreate.form.title']}
            style={{ width:'750px',top:'20px' }}
            visible={true}
            onOk={handlerSubmit}
            onCancel={() => onClose()}
        >
            <div>
                <Form
                    autoComplete='off'
                    ref={formRef}
                >
                    <Form.Item label='Name' field='name' rules={[
                        { required: true, message: t['projectCreate.form.name.errMsg'] , validateTrigger : ['onBlur']},
                        {
                        required:true,
                        validator: (v, cb) => {
                            if (getTextBlenLength(v) < 4) {
                                return cb(t['projectCreate.form.name.less.limit'])
                            }else if (getTextBlenLength(v) > 26) {
                                return cb(t['projectCreate.form.name.exceeds.limit'])
                            }
                            cb(null);
                        }
                        , validateTrigger : ['onBlur']
                    }]}>
                        <Input placeholder='Please enter project name' autoFocus={false} />
                    </Form.Item>
                    <Form.Item label='Department' field="department" rules={[{ required: true ,message: t['projectCreate.form.department.errMsg'], validateTrigger : ['onBlur']}]}>
                        <TreeSelect
                            placeholder={"Please Select"}
                            allowClear={true}
                            treeData={translate(allDepartInfo)}
                        />
                    </Form.Item>
                    <Form.Item label={'Description'} field="desc" rules={[
                        {required: true ,message:t['projectCreate.form.description.errMsg'],validateTrigger : ['onBlur']}
                        ]}>
                        <Input.TextArea placeholder='Please enter ...' style={{ minHeight: 64}} maxLength={100} showWordLimit={true}/>
                    </Form.Item>
                    <Form.Item label={'Private'} field="private">
                        <Radio.Group defaultValue={0}>
                            <Radio value={0}>Private</Radio>
                            <Radio value={1}>Public</Radio>
                        </Radio.Group>
                    </Form.Item>
                    <Form.Item label={'Admins'} field="admins" rules={[{ required: true,validateTrigger : ['onBlur']}]}>
                        <UserTermQuery formRef={formRef}/>
                    </Form.Item>
                </Form>
            </div>
        </Modal>
    );
}

export default ProjectCreatePanel;