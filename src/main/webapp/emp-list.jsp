<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/31
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Emp List</title>
</head>
<link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
<body>
<!-- emp Query Form begin -->
<div id="empQueryFormDiv" style="width:800px" >
    <form class="layui-form"  style="margin: 20px 10px"  id="empQueryForm" >
        <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="ename" id="ename"  placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-inline">
                <select name="deptid" id="deptid2" class="layui-input">
                    <option value="-1">-------------全部---------------</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit lay-filter="empQueryForm">查询</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<!-- emp Query Form end -->

    <button class="layui-btn layui-btn-warm layui-btn-radius" id="btn_add">增加</button>
    <button class="layui-btn layui-btn-warm layui-btn-radius" id="btn_del">删除</button>
    <!-- emp Add Form begin -->
    <div id="empFormDiv" style="display: none" >
        <form class="layui-form"  style="margin: 20px 10px"  id="empAddForm" >
            <div class="layui-form-item">
                <label class="layui-form-label">编号</label>
                <div class="layui-input-block">
                    <input type="text" name="empno" required  lay-verify="required" placeholder="请输入编号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="ename" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">工资</label>
                <div class="layui-input-block">
                    <input type="text" name="salary" required  lay-verify="required" placeholder="请输入工资" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门</label>
                <div class="layui-input-block">
                   <select name="deptid" id="deptid" class="layui-input"></select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="empAddForm">增加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

    <!-- emp Update Form begin -->
    <div id="empUpdateFormDiv" style="display: none" >
        <form class="layui-form"  style="margin: 20px 10px"  id="empUpdateForm" lay-filter="empUpdateFormFilter">
            <div class="layui-form-item">
                <label class="layui-form-label">编号</label>
                <div class="layui-input-block">
                    <input type="text" name="empno" required   readonly lay-verify="required" placeholder="请输入编号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="ename" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">工资</label>
                <div class="layui-input-block">
                    <input type="text" name="salary" required  lay-verify="required" placeholder="请输入工资" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门</label>
                <div class="layui-input-block">
                    <select name="deptid" id="deptid1" class="layui-input"></select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="empUpdateForm">修改提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

    <!-- 表格的工具栏-->
    <script type="text/html" id="toolbar1">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <!-- empForm end -->
    <table id="empTable" lay-filter="empTableFilter"></table>


    <script type="text/javascript">
        layui.use(['table','form'],function () {
            var table=layui.table;
            var form=layui.form;


        //1.初始化table分页显示数据
         var tabIns=table.render({
                elem : '#empTable',
                url : 'emp/list',//json{code,msg,count,data}  page limit
                page: true,
                limit:3,
                limits:[3,5,7],
                cols:[[
                    {checkbox: true},
                    {field: 'empno', title: '员工编号', width: 177},
                    {field: 'ename', title: '员工姓名', width: 177},
                    {field: 'salary', title: '工资', width: 177},
                    {field: 'mgr', title: '上级编号', width: 177},
                    {field: 'deptid', title: '部门编号', width: 177},
                    {fixed: 'right', width:150, align:'center', toolbar: '#toolbar1'}
                ]]
            });

            //2.1 取部门数据
            $.ajax({
                type:'post',
                url:'dept/list',
                dataType:'json',
                success:function (data) {
                    //console.info(data);
                    $.each(data,function (index,item) {
                        console.info(item.deptname+","+item.deptid);
                        $("#deptid").append(new Option(item.deptname+item.deptid,item.deptid));
                        $("#deptid1").append(new Option(item.deptname+item.deptid,item.deptid));
                        $("#deptid2").append(new Option(item.deptname+item.deptid,item.deptid));
                    })
                    form.render('select');
                }
            });

            //2.增加一个员工的btn_add事件
            $("#btn_add").click(function () {

                //2.2打开窗口显示增加界面
                layer.open({
                    type:1,
                    title:'增加员工',
                    area:['600px','500px'],
                    content:$("#empFormDiv")//doma节点
                });
            });
            //3.完成数据的增加
            form.on('submit(empAddForm)', function(data){//响应提交单表button
                //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                $.ajax({
                    type:"post",
                    url:'emp/save',//接受一个Emp类型的对象来封装表单元素中的值
                   // data:"empno="+data.field.empno+"&ename="+data.field.ename+"&salary="+data.field.salary,
                    data:$("#empAddForm").serialize(),
                    success:function (resp) {
                        //清空表单中的数据
                        $("#empAddForm")[0].reset();
                        //关闭增加层
                        layer.closeAll();
                        //表格flush
                        tabIns.reload({
                            page:true
                        });
                        layer.msg(resp.msg);
                    },
                    dataType:"json"
                });
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });
            //4.响应表格中toolbar中的事件
            //table.ontable的监听程序  tool  事件名称
            table.on('tool(empTableFilter)',function (obj) {
               // console.info(obj.data.empno+","+obj.event)
                var id=obj.data.empno;
                if(obj.event=='del'){//删除
                    //1.将id传后台，后台删除这个编号
                    $.post("emp/del/"+id,{},function (resp) {
                        if(resp.code==0){
                            tabIns.reload({
                                page:true
                            });
                        }
                        layer.msg(resp.msg);
                    },'json');
                    //2.刷新table
                }else{//修改
                    //1.将id传后台，后台删除这个编号
                    $.post("emp/find/"+id,{},function (resp) {
                        //为表单赋值
                        form.val('empUpdateFormFilter',{
                            empno:resp.empno,
                            ename:resp.ename,
                            salary:resp.salary,
                            deptid:resp.deptid
                        });
                    },'json');

                    //显示要修改的数据
                    layer.open({
                        type:1,
                        title:'修改员工信息',
                        area:['600px','500px'],
                        content:$("#empUpdateFormDiv")//doma节点
                    });
                }
            })

            //5.完成数据的修改
            form.on('submit(empUpdateForm)', function(data){//响应提交单表button
                //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                $.ajax({
                    type:"post",
                    url:'emp/update',//接受一个Emp类型的对象来封装表单元素中的值
                    // data:"empno="+data.field.empno+"&ename="+data.field.ename+"&salary="+data.field.salary,
                    data:$("#empUpdateForm").serialize(),
                    success:function (resp) {
                        //清空表单中的数据
                        $("#empUpdateForm")[0].reset();
                        //关闭增加层
                        layer.closeAll();
                        //表格flush
                        tabIns.reload({
                            page:true
                        });
                        layer.msg(resp.msg);
                    },
                    dataType:"json"
                });
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });
            //6.批量删除
            $("#btn_del").click(function () {
                //取被选中的行，准备删除的
                var ids=[];//存储要删除的编号
                var checkStatus = table.checkStatus('empTable'); //idTest 即为基础参数 id 对应的值
                //console.info(checkStatus.data);
                $.each(checkStatus.data,function (index,item) {
                    ids.push(item.empno);
                })
                //console.info(ids);
                $.ajax({
                    type:'post',
                    url:'emp/dels?ids='+ids,
                    success:function(resp){
                        tabIns.reload({
                            page:true
                        });
                        layer.msg(resp.msg);
                    }
                })
            });
            //7.带条件查询
            form.on('submit(empQueryForm)',function () {
               //1.将表单的值（查询条件）提交控制器
                tabIns.reload({//emp/list?page=1&limit=3
                    page:true,//currentPage:1
                    method:'post',
                    where:{
                        ename:$("#ename").val(),
                        deptid:$("#deptid2").val()
                    }
                });
                return false;
            });

        });

    </script>
</body>
</html>
