package com.cits.lms.DAO;

import com.cits.lms.domain.Admin;

/**
 *
 * @author janeman
 */
public interface AdminDao {

    public void insertAdmin(Admin a);

    public void updateAdmin(Admin a);

    public void deleteAdmin(Admin a);

    public void deleteAdmin(Integer adminId);

    public Admin isAdminExists(String username);

}
