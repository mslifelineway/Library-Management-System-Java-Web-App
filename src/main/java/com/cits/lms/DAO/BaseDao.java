
package com.cits.lms.DAO;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;

// NOTE: do not use @Repository or @Component or @Service annotations here...
abstract public class BaseDao extends NamedParameterJdbcDaoSupport{
    @Autowired
    public void setDataSource2(DataSource ds){
        super.setDataSource(ds);
    }
}
