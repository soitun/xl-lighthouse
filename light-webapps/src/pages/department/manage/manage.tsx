import React, {useEffect, useRef, useState} from 'react';
import {Input, Notification, Popconfirm, Spin, Tree} from '@arco-design/web-react';
import {IconFile, IconFolder, IconMinus, IconPen, IconPlus} from '@arco-design/web-react/icon';
import useLocale from '@/utils/useLocale';
import locale from './locale';
import styles from './style/index.module.less';
import {ResultData} from "@/types/insights-common";
import {
    requestCreate,
    requestDeleteById,
    requestStructure,
    requestUpdateById
} from "@/api/department";
import {getRandomString, getTextBlenLength, validateWithRegex} from "@/utils/util";
import {TEXT_BASE_PATTERN_3} from "@/utils/constants";

export default function ManagePanel() {
    const t = useLocale(locale);
    const [loading, setLoading] = useState(false);
    const [treeData, setTreeData] = useState([]);
    const treeRef = useRef<Tree>(null);
    const [selectedKeys, setSelectedKeys] = useState([]);
    const [checkedKeys, setCheckedKeys] = useState([]);
    const [expandedKeys, setExpandedKeys] = useState([]);

    async function fetchData() {
        setLoading(true);
        try {
            await requestStructure().then((response:ResultData) => {
                const {code, message} = response;
                let data = response.data;
                if (code === '0') {
                    data = [{
                        "key":"0",
                        "value":0,
                        "label":t['department.enterprise.structure'],"children":data}] ;
                    setTreeData([...data]);
                    setExpandedKeys(["0"]);
                }else{
                    Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
                }
            });
        } catch (error) {
            console.log(error);
            Notification.error({style: { width: 420 }, title: 'Error', content: t['system.error']});
        }finally {
            setLoading(false);
        }
    }

    useEffect(() => {
        fetchData().then();
    }, []);


    async function addNode(pid, title) {
        setLoading(true);
        let id = "-1";
        try {
            await requestCreate({'pid': pid, 'name': title}).then((response: ResultData) => {
                const {code, message, data} = response;
                if (code === '0') {
                    id = data;
                    sessionStorage.removeItem('cache_all_department');
                } else {
                    Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
                }
            });
        } catch (error) {
            console.log(error);
            Notification.error({style: { width: 420 }, title: 'Error', content: t['system.error']});
        } finally {
            setLoading(false);
        }
        return id;
    }

    async function updateNode(id,pid,title) {
        setLoading(true);
        let result = "-1";
        try {
            await requestUpdateById({'id': id, 'pid':pid,'name': title}).then((response: ResultData) => {
                const {code, message, data} = response;
                if (code === '0') {
                    result = code;
                    sessionStorage.removeItem('cache_all_department');
                } else {
                    Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
                }
            });
        } catch (error) {
            console.log(error);
            Notification.error({style: { width: 420 }, title: 'Error', content: t['system.error']});
        } finally {
            setLoading(false);
        }
        return result;
    }


    async function deleteNode(id) {
        setLoading(true);
        let result = "-1";
        try {
            await requestDeleteById({id}).then((response: ResultData) => {
                const {code, message, data} = response;
                if (code === '0') {
                    result = code;
                    sessionStorage.removeItem('cache_all_department');
                } else {
                    Notification.warning({style: { width: 420 }, title: 'Warning', content: message || t['system.error']});
                }
            });
        } catch (error) {
            console.log(error);
            Notification.error({style: { width: 420 }, title: 'Error', content: t['system.error']});
        } finally {
            setLoading(false);
        }
        return result;
    }

    const generatorTreeNodes = (treeData,parentKey = "0") => {
        return treeData.map((item) => {
            const { children, key, ...ret} = item;
            item.parentKey = parentKey;
            return (
                <Tree.Node icon={children || item.key == "0" ? <IconFolder /> : <IconFile/> }
                         key={item.key} title={item.label}  {...ret} dataRef={item}>
                    {children ? generatorTreeNodes(item.children,item.key) : null}
                </Tree.Node>
            );
        });
    };

    function deleteNodeByKey(dataArray,inputValue) {
        const params = dataArray;
        const loop = (data) => {
            data.map((item,index) => {
                if(item.key === inputValue) {
                    data.splice(index,1);
                }
                if (item.children) {
                    loop(item.children);
                }
            });
        }
        loop(params);
        return params;
    }

    return (
        <Spin loading={loading} size={20} style={{ display: 'block' }}>
          <div className={styles['department-manage-panel']}>
            <Tree
                ref={treeRef}
                draggable={true}
                multiple={false}
                checkedKeys={checkedKeys}
                selectedKeys={selectedKeys}
                expandedKeys={expandedKeys}
                onSelect={(keys, extra) => {
                    setSelectedKeys(keys);
                    if (extra.e.isTrusted && selectedKeys[0] === keys[0] && [...expandedKeys].find(item => item === keys[0])) {
                        const newArr = [...expandedKeys].filter(item => item !== keys[0]);
                        setExpandedKeys([...newArr]);
                    } else {
                        const newArr = [...expandedKeys].filter(item => item !== keys[0]);
                        setExpandedKeys([...newArr, ...keys]);
                    }
                }}
                onCheck={(keys, extra) => {
                    setCheckedKeys(keys);
                }}
                onExpand={(keys, extra) => {
                    setExpandedKeys(keys);
                }}
                onDrop={async ({dragNode, dropNode, dropPosition}) => {
                    let destPid;
                    if(dropPosition === 0){
                        destPid = treeRef.current.getCacheNode([dropNode.props._key])[0].props.dataRef.key;
                    }else{
                        destPid = treeRef.current.getCacheNode([dropNode.props._key])[0].props.dataRef.parentKey;
                    }
                    const result = await updateNode(dragNode.props._key, destPid,dragNode.props.title);
                    if(result == '-1'){
                        return;
                    }
                    const loop = (data, key, callback) => {
                        data.some((item, index, arr) => {
                            if (String(item.key) === String(key)) {
                                callback(item, index, arr);
                                return true;
                            }
                            if (item.children) {
                                return loop(item.children, key, callback);
                            }
                        });
                    };

                    const data = [...treeData];
                    let dragItem;
                    loop(data, dragNode.props._key, (item, index, arr) => {
                        arr.splice(index, 1);
                        dragItem = item;
                        dragItem.className = 'tree-node-dropover';
                    });

                    if (dropPosition === 0) {
                        loop(data, dropNode.props._key, (item, index, arr) => {
                            item.children = item.children || [];
                            item.children.push(dragItem);
                        });
                    } else {
                        loop(data, dropNode.props._key, (item, index, arr) => {
                            arr.splice(dropPosition < 0 ? index : index + 1, 0, dragItem);
                        });
                    }
                    setTreeData([...data]);
                    setTimeout(() => {
                        dragItem.className = '';
                        setTreeData([...data]);
                    }, 1000);
                }}
                renderExtra={(node) => {
                  return (
                      <div>
                          <IconPlus
                              style={{
                                  position: 'absolute',
                                  right: 41,
                                  fontSize: 13,
                                  top: 10,
                                  color: 'rgb(132 160 224)',
                              }}
                              onClick={async (e) => {
                                  const titleNode = e.currentTarget.parentElement.parentElement.querySelector(".arco-tree-node-title");
                                  const event = new Event('click', {
                                      bubbles: true,
                                      cancelable: true,
                                  });
                                  titleNode.dispatchEvent(event);
                                  const dataChildren = node.dataRef.children || [];
                                  const nodeTitle = "New Node_" + getRandomString(8);
                                  const currentId = await addNode(node.dataRef.key, nodeTitle);
                                  if(currentId == "-1"){
                                      return;
                                  }
                                  dataChildren.push({
                                      key: currentId,
                                      value:currentId,
                                      label: nodeTitle,
                                      parentKey: node.dataRef.key,
                                  });
                                  node.dataRef.children = dataChildren;
                                  setTreeData([...treeData]);
                                  const newArr = [...expandedKeys].filter(item => item !== node.dataRef.key);
                                  setExpandedKeys([...newArr, node.dataRef.key]);
                              }}
                          />
                          {node._level != 0  &&  (
                              <IconPen
                                  style={{
                                      display:`${node.dataRef.key != "0" ? 'block' : 'none'}`,
                                      position: 'absolute',
                                      right: 25,
                                      fontSize: 13,
                                      top: 10,
                                      color: 'rgb(132 160 224)',
                                  }}
                                  onClick={(e) => {
                                      const titleNode = e.currentTarget.parentElement.parentElement.querySelector(".arco-tree-node-title");
                                      const clickEvent = new Event('click', {
                                          bubbles: true,
                                          cancelable: true
                                      });
                                      titleNode.dispatchEvent(clickEvent);
                                      const originTitle = node.title;
                                      node.dataRef.title = <Input type={"text"} autoFocus={true}
                                                                  style={{
                                                                      width: 230,
                                                                      height: 22,
                                                                      paddingLeft:3,
                                                                      borderColor: 'rgb(132 160 224)',
                                                                      backgroundColor: "var(--color-fill-1)"
                                                                  }}
                                                                  defaultValue={originTitle + ""}
                                                                  onClick={(e) => {
                                                                      e.stopPropagation();
                                                                  }}
                                                                  onBlur={async (ie) => {
                                                                      const len = getTextBlenLength(ie.target.value);
                                                                      if (len < 3 || len > 30) {
                                                                          Notification.warning({style: { width: 420 }, title: 'Warning', content: t['department.manage.invalidLength']});
                                                                          node.dataRef.title = originTitle;
                                                                      } else if(!validateWithRegex(TEXT_BASE_PATTERN_3,ie.target.value)) {
                                                                          Notification.warning({style: { width: 420 }, title: 'Warning', content: t['department.manage.hasInvalidChars']});
                                                                          node.dataRef.title = originTitle;
                                                                      } else {
                                                                          const newTitle = ie.target.value;
                                                                          if(newTitle.length  > 0 && newTitle != originTitle){
                                                                              const result = await updateNode(node.dataRef.key,node.dataRef.parentKey, newTitle);
                                                                              if(result == '0'){
                                                                                  node.dataRef.title = newTitle;
                                                                              }else{
                                                                                  node.dataRef.title = originTitle;
                                                                              }
                                                                          }else{
                                                                              node.dataRef.title = originTitle;
                                                                          }
                                                                      }
                                                                      setTreeData([...treeData]);
                                                                  }}
                                      />;
                                      setTreeData([...treeData]);
                                      const newArr = [...expandedKeys].filter(item => item !== node.dataRef.key);
                                      setExpandedKeys([...newArr, node.dataRef.key]);
                                  }}
                              />
                          )}
                          {node._level != 0 && (
                              <Popconfirm
                                  focusLock
                                  title='Confirm'
                                  content= {t['department.manage.deletePrompt']}
                                  onOk={async () => {
                                      const dataChildren = node.dataRef.children || [];
                                      if (dataChildren.length > 0) {
                                          Notification.warning({style: { width: 420 }, title: 'Warning', content: t['department.manage.deleteHasChild']});
                                      } else {
                                          const result = await deleteNode(node.dataRef.key);
                                          if (result == "-1") {
                                              return;
                                          }
                                          const w = deleteNodeByKey([...treeData], node.dataRef.key)
                                          setTreeData([...w]);
                                      }
                                  }}
                              >
                                  <IconMinus
                                      style={{
                                          display:`${node.dataRef.key != "0" ? 'block' : 'none'}`,
                                          position: 'absolute',
                                          right: 8,
                                          fontSize: 13,
                                          top: 10,
                                          color: 'rgb(132 160 224)',
                                      }}
                                  />
                              </Popconfirm>
                          )}
                      </div>
                  );
                }}
            >
              {generatorTreeNodes(treeData)}
            </Tree>
          </div>
        </Spin>
  );

}
