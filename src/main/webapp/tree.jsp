<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/3
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
</head>
<body>


<div id="tree1"></div>
<script type="text/javascript">
    layui.use('tree',function () {
        var tree=layui.tree;
        //1.显示树节点,没有数据源
       var treeInst= tree.render({
            elem:'#tree1',
            data:[]
        });
       //2.向服务器发请求取原始数据{id,title,pid}
       $.ajax({
           url:'emp/depts',
           type:'post',
           dataType:'json',
           success:function (resp) {//[{id:101,title:'abc',pid:0]
                fn(resp);//对原始数据处理
               treeInst.reload({
                   data:resultObj//将处理后的结果赋值的data[数据源]
               })
           }
           
       })
        var resultObj=[];
        function fn(jsonData) {
            //取得顶级的数据
            for(var i=0;i<jsonData.length;i++){
                if(jsonData[i].pid==0){
                    resultObj.push(jsonData[i]);
                }
            }
            getChildren(resultObj, jsonData)
        }

        function getChildren(nodeList, jsonData) {
            nodeList.forEach(function(elemet, index) {
                elemet.children = jsonData.filter(function(item, indexI) {
                    return item.pid === elemet.id
                })
                if(elemet.children.length > 0) {
                    getChildren(elemet.children, jsonData)
                }
            })
        }
    })
</script>

</body>
</html>
