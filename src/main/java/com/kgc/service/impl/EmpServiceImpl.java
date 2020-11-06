package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.dao.EmpMapper;
import com.kgc.entity.Emp;
import com.kgc.entity.EmpExample;
import com.kgc.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;
    public PageInfo<Emp> findAll(int page, int limit,Emp emp) {

        PageHelper.startPage(page,limit);
        EmpExample empExample=new EmpExample();

        EmpExample.Criteria criteria = empExample.createCriteria();
        //增加查询条件
        if(emp.getDeptid()!=null&&emp.getDeptid()!=-1){
            criteria.andDeptidEqualTo(emp.getDeptid());
        }

        if(emp.getEname()!=null){
            criteria.andEnameLike("%"+emp.getEname()+"%");
        }
        //
        List<Emp> list=empMapper.selectByExample(empExample);
        PageInfo<Emp> pageInfo=new PageInfo<Emp>(list);

        return pageInfo;
    }

    public void saveEmp(Emp emp) {
        emp.setDeptid(5);
        emp.setMgr(102);
        empMapper.insert(emp);
    }

    public void deleteEmp(int id) {
        empMapper.deleteByPrimaryKey(id);
    }

    public Emp findById(int id) {
        return empMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Emp emp) {
        empMapper.updateByPrimaryKeySelective(emp);
    }

    public void deletesEmp(int[] ids) {
        /*for(int i=0;i<ids.length;i++){
            empMapper.deleteByPrimaryKey(ids[i]);
        }*/
        empMapper.deleteEmps(ids);
    }
}
