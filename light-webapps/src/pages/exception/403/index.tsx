import React, {useEffect} from 'react';
import { Result, Button } from '@arco-design/web-react';
import locale from './locale';
import useLocale from '@/utils/useLocale';
import styles from './style/index.module.less';

function Exception403({fromExternalEmbedding = false,errorMessage = null}) {

  const t = useLocale(locale);

  return (
      <div className={fromExternalEmbedding?styles.externalEmbeddingWrapper : styles.wrapper}>
          <Result
              className={styles.result}
              status="403"
              subTitle={errorMessage ? errorMessage : t['exception.result.403.description']}
          />
      </div>
  );
}

export default Exception403;
