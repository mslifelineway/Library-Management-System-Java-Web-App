
package com.cits.lms.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"com.cits.lms.DAO","com.cits.lms.services"})
public class SpringRootConfig {
    
    @Bean
    public BasicDataSource getDataSource(){
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl("jdbc:mysql://node23900-cits-library.cloudjiffy.net/cits_lms");
        ds.setUsername("root");
        ds.setPassword("sLuj00X5CT");
        ds.setMaxTotal(2);
        ds.setInitialSize(1);
        ds.setTestOnBorrow(true);
        ds.setValidationQuery("SELECT 1");
        ds.setDefaultAutoCommit(Boolean.TRUE);
        return ds;
    }
}
