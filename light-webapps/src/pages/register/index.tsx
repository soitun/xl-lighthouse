import React from 'react';
import Footer from '@/components/Footer';
import RegisterForm from './form';
import styles from './style/index.module.less';
import License from "@/pages/license";

function Register() {

  return (
    <div className={styles.container}>
      <div className={styles.content}>
        <div className={styles['content-inner']}>
          <RegisterForm />
        </div>
        <div className={styles.footer}>
          <Footer />
        </div>
      </div>
    </div>
  );
}

Register.displayName = 'RegisterPage';
export default Register;