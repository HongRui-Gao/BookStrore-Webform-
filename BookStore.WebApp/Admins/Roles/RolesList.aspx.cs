using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BookStore.BLL;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore.WebApp.Admins.Roles
{
    public partial class RolesList : System.Web.UI.Page
    {
        private RolesService bll = new RolesService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            #region Repeater绑定

            this.RepRolesList.DataSource = bll.GetRolesList(); //查询所有的权限信息,并且把这个集合添加到Repeater控件当中
            this.RepRolesList.DataBind();  //绑定数据源
            #endregion

        }
    }
}