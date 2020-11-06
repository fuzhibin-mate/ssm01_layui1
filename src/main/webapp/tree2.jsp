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
            var tree = layui.tree;
            //1.显示树节点,没有数据源
            var treeInst = tree.render({
                elem: '#tree1',
                data: []
            });
        $.ajax({
            url:'emp/depts1',
            type:'post',
            dataType:'json',
            success:function (resp) {//[{title:'湖北省',children:[{},{}]]
                treeInst.reload({
                    data:resp//将处理后的结果赋值的data[数据源]
                })
            }

        })
        });
</script>
</body>
</html>
