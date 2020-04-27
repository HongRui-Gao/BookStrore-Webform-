using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStore.BLL;
using BookStore.WebApp.Tools;

namespace BookStore.WebApp.Admins.Users
{
    public partial class EditUsers : System.Web.UI.Page
    {
        private RolesService rolesSvc = new RolesService();
        private UsersService usersSvc = new UsersService();
        private UploadImages upload = new UploadImages();
        public string imgSrc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            #region 权限列表绑定

            this.RolesList.DataSource = rolesSvc.GetRolesList();
            this.RolesList.DataTextField = "Title";
            this.RolesList.DataValueField = "Id";
            this.RolesList.DataBind();

            #endregion

            #region 根据传递过来的id值,找到对应的用户信息

            int id = Request.Params["action"] == null ? 0 : int.Parse(Request.Params["action"]);
            var data = usersSvc.GetUsersById(id);
            if (data == null)
            {
                Response.Write("<script>alert('该用户信息不存在');location.href='UsersList.aspx'</script>");
            }
            else
            {
                this.UsersId.Text = data.Id.ToString();
                this.Email.Text = data.Email.ToString();
                this.Password.Text = data.Password.ToString();
                this.RePassword.Text = data.Password.ToString();
                this.NickName.Text = data.NickName.ToString();
                imgSrc = data.Photo;
                this.RolesList.SelectedValue = data.RolesId.ToString();
            }
            #endregion

        }

        protected void btnSumbit_OnClick(object sender, EventArgs e)
        {
            int id = int.Parse(this.UsersId.Text);
            var data = usersSvc.GetUsersById(id);
            if (data == null)
            {
                Response.Write("<script>alert('该用户信息不存在');location.href='UsersList.aspx'</script>");
            }
            else
            {
                data.Email = this.Email.Text;
                data.Password = this.Password.Text;
                data.NickName = this.NickName.Text;
                data.RolesId = int.Parse(this.RolesList.SelectedValue);
                if (!String.IsNullOrEmpty(this.FileUpload1.FileName))
                {
                  data.Photo = upload.UpFileName(FileUpload1, "../../upload/users/");
                }

                var rs = usersSvc.Edit(data);
                if (rs > 0)
                {
                    Response.Write("<script>alert('修改成功');location.href='UsersList.aspx'</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败');location.href='EditUsers.aspx?action="+data.Id+"'</script>");
                }
            }
        }
    }
}