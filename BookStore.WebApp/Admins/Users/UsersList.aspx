﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersList.aspx.cs" Inherits="BookStore.WebApp.Admins.Users.UsersList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户管理界面</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        function selectAll(obj) {
            var allInput = document.getElementsByTagName("input");
            //alert(allInput.length);
            var loopTime = allInput.length;
            for (i = 0; i < loopTime; i++) {
                //alert(allInput[i].type);
                if (allInput[i].type == "checkbox") {
                    allInput[i].checked = obj.checked;
                }
            }
        }
 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="../main/Main.aspx">首页</a></li>
            <li><a href="UsersList.aspx">用户管理</a></li>
        </ul>
    </div>
    <div class="rightinfo">
        <div class="tools">
            <div class="ss_kuang">
                <p>
                    查找：</p>
                <asp:TextBox ID="txtKeyWords" runat="server" class="ss_wk"></asp:TextBox>
                <div class="ss_tu">
                    <asp:ImageButton ID="ibtnGetSubmit" runat="server" ImageUrl="../images/ico06.png"
                        OnClick="ibtnGetSubmit_OnClick" />
                </div>
            </div>
            <ul class="float">
                <li class="click"><a href='AddUsers.aspx'>
                    <asp:Image ID="imgAdd" runat="server" ImageUrl="../images/AddWZ.png" Width="100"
                        Height="35"></asp:Image></a>
                </li>
                <li style="float:left; padding-right:0px;">
                    <asp:ImageButton ID="ibtnDelAll" runat="server" ImageUrl="../images/DelWZ.png" Width="100"
                        Height="35" OnClientClick="return confirm('确定执行删除选中操作？')" OnClick="ibtnDelAll_OnClick" />
                </li>
            </ul>
        </div>
        <table class="tablelist">
            <thead>
                <tr>
                    <th>
                        <asp:CheckBox ID="chk_JS" runat="server" Text="" onclick="selectAll(this)" />
                    </th>
                    <th>
                        编号
                    </th>
                    <th>
                        邮箱地址
                    </th>
                    <th>
                        密码
                    </th>
                    <th>
                        昵称
                    </th>
                    <th>
                        头像
                    </th>
                    <th>
                        权限
                    </th>
                    <th>
                        修改
                    </th>
                    <th>
                        删除
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="RepUsersList" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td width="5%">
                                <asp:CheckBox ID="chk_Del" runat="server" />
                                <asp:Label ID="lbl" Text='<%#Eval("Id") %>' runat="server" Visible="false"></asp:Label>
                            </td>
                            <td width="5%">
                                <%# Container.ItemIndex + 1 + (this.AspNetPager1.CurrentPageIndex - 1) * this.AspNetPager1.PageSize%>
                            </td>
                            <td width="10%">
                                <%# Eval("Email")%>
                            </td>
                            <td width="10%">
                                <%# Eval("Password")%>
                            </td>
                            <td width="10%">
                                <%# Eval("NickName")%>
                            </td>
                            <td width="10%">
                                <img src='../../upload/users/<%#Eval("Photo") %>' width="100" height="100" alt="预览图片失败" />
                            </td>
                            <td width="10%">
                                <%# GetRolesTitle(int.Parse(Eval("RolesId").ToString()))%>
                            </td>
                            <td width="5%">
                                <a href='EditUsers.aspx?action=<%#Eval("Id") %>'>
                                    <asp:Image ID="imgedit" runat="server" ImageUrl="../images/t02.png" Width="20" Height="20">
                                    </asp:Image></a>
                            </td>
                            <td width="5%">
                                <a href='DeleteUsers.aspx?action=<%#Eval("Id") %>'>
                                    <asp:Image ID="imgdel" runat="server" ImageUrl="../images/t03.png" Width="20" Height="20">
                                    </asp:Image></a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <div class="pagin">
            <webdiyer:AspNetPager ID="AspNetPager1" CssClass="pages" CurrentPageButtonClass="cpb"
                HorizontalAlign="Right" PageIndexBoxType="TextBox"  
                 ShowMoreButtons="False" ShowNavigationToolTip="True"
                runat="server" AlwaysShow="True" PageSize="8" ShowInputBox="Always"
                LayoutType="Table" OnPageChanging="AspNetPager1_OnPageChanging" 
                FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页" 
                PagingButtonSpacing="2px" SubmitButtonClass="btngo">
            </webdiyer:AspNetPager>
        </div>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    </form>
</body>
</html>
