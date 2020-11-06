package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Emp;

import java.util.List;

public interface EmpService {

    /**
     *
     * @param page  页面号
     * @param limit  PageSize
     * @param emp    查询条件
     * @return
     */
    PageInfo<Emp> findAll(int page, int limit,Emp emp);

    void saveEmp(Emp emp);

    void deleteEmp(int id);
    Emp findById(int id);

    void updateEmp(Emp emp);

    void deletesEmp(int[] ids);
}
