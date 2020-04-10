<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RolesList.aspx.cs" Inherits="BookStore.WebApp.Admins.Roles.RolesList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>权限管理界面</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script language="javascript">
        $(function () {
            //导航切换
            $(".imglist li").click(function () {
                $(".imglist li.selected").removeClass("selected");
                $(this).addClass("selected");
            });
        })
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".click").click(function () {
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="../main/Main.aspx">首页</a></li>
                <li><a href="#">权限管理界面</a></li>
            </ul>
        </div>

        <div class="rightinfo">

            <div class="tools">

                <ul class="toolbar">
                    <li class="click"><span>
                        <img src="../images/t01.png" /></span>添加</li>
                    <li class="click"><span>
                        <img src="../images/t02.png" /></span>修改</li>
                    <li><span>
                        <img src="../images/t03.png" /></span>删除</li>
                    <li><span>
                        <img src="../images/t04.png" /></span>统计</li>
                </ul>


                <ul class="toolbar1">
                    <li><span>
                        <img src="../images/t05.png" /></span>设置</li>
                </ul>

            </div>


            <table class="tablelist">
                <thead>
                    <tr>
                        <th width="5%">序号</th>
                        <th width="5%">
                            <asp:CheckBox ID="ckAll" runat="server" />
                        </th>
                        <th width="30%">权限名称</th>
                        <th width="10%">修改</th>
                        <th width="10%">删除</th>
                    </tr>
                </thead>

                <tbody>
                    <asp:Repeater ID="RepRolesList" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%#Container.ItemIndex+1 %>
                                </td>
                                <td>
                                    <asp:CheckBox ID="ck_info" runat="server" />
                                    <asp:Label ID="lbl" runat="server" Text='<%#Eval("Id") %>' Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <%#Eval("Title") %>
                                </td>
                                <td>
                                    <a href='EditRoles.aspx?id=<%#Eval("Id") %>'>
                                        <img src="../images/t02.png" />
                                        
                                    </a>
                                </td>
                                <td>
                                    <a href='DeleteRoles.aspx?id=<%#Eval("Id") %>'>
                                        <img src="../images/t03.png" />
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                    <!--
                    GridView 自己本身就是表格类型的标签,但是Repeater不是,它更万能,所有样式的内容,只要是用到了循环遍历
                    它都可以使用,但是它有个问题,要求我们必须具备比较高的前端知识(html+css),它里面包含了一些模板
                    常用的是ItemTemplate item是项,主要用于foreach循环,代表循环的集合里面每一项内容
                    template 它本身就是模板的意思 
                    我们在GridView当中绑定数据的时候,是通过类似于winform的视图绑定,在界面当中用对应列的属性来进行操作
                    Repeater不支持上面的绑定方式,它更贴近于我们代码编程,让我们从视图与代码之间的频繁操作当中脱离出来,它是
                    完全通过代码来进行实现的,通过的是EVAL绑定,有点类似于 JSP小脚本
                -->

                </tbody>

            </table>






            <div class="pagin">
                <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
                <ul class="paginList">
                    <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
                    <li class="paginItem"><a href="javascript:;">1</a></li>
                    <li class="paginItem current"><a href="javascript:;">2</a></li>
                    <li class="paginItem"><a href="javascript:;">3</a></li>
                    <li class="paginItem"><a href="javascript:;">4</a></li>
                    <li class="paginItem"><a href="javascript:;">5</a></li>
                    <li class="paginItem more"><a href="javascript:;">...</a></li>
                    <li class="paginItem"><a href="javascript:;">10</a></li>
                    <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
                </ul>
            </div>


           

        <script type="text/javascript">
            $('.imgtable tbody tr:odd').addClass('odd');
        </script>
    </form>
</body>
</html>
