﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSystemMenu.aspx.cs" Inherits="BookStore.WebApp.Admins.SystemMenu.AddSystemMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增系统菜单信息</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="../main/Main.aspx">首页</a></li>
                <li><a href="SystemMenuList.aspx">系统菜单管理</a></li>
            </ul>
        </div>

        <div class="formbody">

            <div class="formtitle"><span>新增系统菜单信息</span></div>

            <ul class="forminfo">
                <li>
                    <label>菜单名称</label>
                    <asp:TextBox ID="MenuTitle" runat="server" CssClass="dfinput"></asp:TextBox>
                    <i>*必须填写
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="角色名称不能为空" ControlToValidate="MenuTitle"
                            Display="Dynamic">

                        </asp:RequiredFieldValidator>
                    </i>
                </li>
                <li>
                    <label>菜单连接</label>
                    <asp:TextBox ID="MenuLink" runat="server" CssClass="dfinput"></asp:TextBox>
                    <i>*必须填写
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="角色名称不能为空" ControlToValidate="MenuLink"
                            Display="Dynamic">

                        </asp:RequiredFieldValidator>
                    </i>
                </li>
                <li>
                    <label>菜单等级:</label>
                    <asp:DropDownList ID="ddlLevel" runat="server" OnSelectedIndexChanged="ddlLevel_SelectedIndexChanged" AutoPostBack="true" CssClass="dropdownlist">
                        <asp:ListItem Value="0">一级菜单</asp:ListItem>
                        <asp:ListItem Value="1">二级菜单</asp:ListItem>
                        <asp:ListItem Value="2">三级菜单</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlParentTitle" runat="server" Visible="false" CssClass="dropdownlist" OnSelectedIndexChanged="ddlParentTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    <asp:DropDownList ID="ddlSonTitle" runat="server" Visible="false" CssClass="dropdownlist"></asp:DropDownList>
                </li>
                <li>
                    <label>&nbsp;</label>
                    <asp:Button ID="btnSumbit" runat="server" Text="确认保存" CssClass="btn" OnClick="btnSumbit_Click" />
                </li>
            </ul>
        </div>
    </form>
</body>
</html>
