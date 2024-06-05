import React, {useContext, useRef} from 'react';
import dayjs from 'dayjs';
import {
  Form,
  Input,
  DatePicker,
  Button,
  Grid, TreeSelect,
} from '@arco-design/web-react';
import { GlobalContext } from '@/context';
import locale from './locale';
import useLocale from '@/utils/useLocale';
import { IconRefresh, IconSearch } from '@arco-design/web-react/icon';
import styles from './style/index.module.less';
import {translate} from "@/pages/department/base";
const { Row, Col } = Grid;
const { useForm } = Form;

function SearchForm({onSearch, form,onClear, allDepartInfo}) {
  const { lang } = useContext(GlobalContext);
  const treeRef = useRef(null);
  const t = useLocale(locale);

  const handleSubmit = () => {
    const values = form.getFieldsValue();
    onSearch(values);
  };

  const handleReset = () => {
    form.resetFields();
    onSearch({});
  };

  const colSpan = 12;

  return (
      <div className={styles['search-form-wrapper']}>
      <Form
        form={form}
        className={styles['search-form']}
        labelAlign="left"
        labelCol={{ span: 5 }}
        wrapperCol={{ span: 19 }}
        colon={' :'}
      >
        <Row gutter={24}>
          <Col span={colSpan}>
            <Form.Item label={t['projectList.columns.name']} field="search">
              <Input
                allowClear
                placeholder={t['projectList.name.placeholder']}
              />
            </Form.Item>
          </Col>
          <Col span={colSpan}>
            <Form.Item label={t['projectList.columns.department']} field="departmentIds">
              <TreeSelect
                  ref={treeRef}
                  placeholder={"Please select"}
                  multiple={true}
                  treeProps={{
                    height: 200,
                    renderTitle: (props) => {
                      return (
                          <span style={{ whiteSpace: 'nowrap', }} >
                                            {props.title}
                                        </span>
                      );
                    },
                  }}
                  allowClear={true}
                  treeData={translate(allDepartInfo)}
              />
            </Form.Item>
          </Col>
          <Col span={colSpan}>
            <Form.Item
              label={t['projectList.columns.createdTime']}
              field="createTime"
            >
              <DatePicker.RangePicker
                  allowClear
                  style={{ width: '100%' }}
                  disabledDate={(date) => dayjs(date).isAfter(dayjs())}
              />
            </Form.Item>
          </Col>
        </Row>
      </Form>
      <div className={styles['right-button']}>
        <Button size={"small"} type="primary" icon={<IconSearch />} onClick={handleSubmit}>
          {t['projectList.form.search']}
        </Button>
        <Button size={"small"} icon={<IconRefresh />} onClick={onClear}>
          {t['projectList.form.reset']}
        </Button>
      </div>
    </div>
  );
}

export default SearchForm;
