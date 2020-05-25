using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStore.BLL;

namespace BookStore.WebApp.Web
{
    public partial class FrontEnd : System.Web.UI.MasterPage
    {
        private AboutService aboutSvc = new AboutService();
        private WebMenuService webMenuSvc = new WebMenuService();
        public string about_title, about_content;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            #region 关于我们的绑定

            var about = aboutSvc.GetAboutById(1);
            about_title = about.Title;
            about_content = about.Content;

            #endregion

            #region 网站菜单绑定

            this.RepNavi.DataSource = webMenuSvc.GetMenusByIsShow(1); //这个地方是我们要绑定到导航栏所以查看能够展示的内容
            this.RepNavi.DataBind();
            #endregion
        }
    }
}