using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.Repository;
using Common;

namespace WebPages.Dashboard.Admin
{
    public partial class Ozviat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSelectedStudents();
                LoadStudents();
            }
        }

        private OzviatRepository or = new OzviatRepository();
        private vStudentRepository rep = new vStudentRepository();
        private vLessonGroupRepository lg = new vLessonGroupRepository();

        public void LoadStudents()
        {
            gvStudents.DataSource = rep.GetAllStudents();
            gvStudents.DataBind();
        }

        #region SelectedStudents

        public void LoadSelectedStudents()
        {
            List<vOzviat> vs = new List<vOzviat>();
            List<string> St = or.FindStudentCodeByLGID(3);
            for (int i = 0; i < St.Count; i++)
            {
                vs.Add(or.FindStudentinOzviat(St[i]));
            }
            gvSelectedStudents.DataSource = OnlineTools.ToDataTable(vs); ;
            gvSelectedStudents.DataBind();
            lblStudentsCount.InnerText = St.Count.ToString();
            vLessonGroup lgg = lg.FindByLGID(3);
            lblTeacherName.InnerText = lgg.FirstName + " " + lgg.LastName;
            lblClass.InnerText = lgg.Class;
            lblLesson.InnerText = lgg.LessonTitle;
        }

        protected void gvSelectedStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void gvSelectedStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gvSelectedStudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
        }

        protected void gvSelectedStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                // Retrieve the row index stored in the
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button
                // from the Rows collection.
                GridViewRow row = gvStudents.Rows[index];

                //Response.Redirect("http://localhost:4911/Dashboard/Admin/Details.aspx?LGID=" + row.Cells[0].Text);
                string id = row.Cells[0].Text;

                if (id != "" || id != null)
                {
                    Student lo = rep.FindByStudentCode(id);
                    tbxFirstName.InnerText = lo.FirstName;
                    tbxLastName.InnerText = lo.LastName;
                    tbxStudentCode.InnerText = lo.StudentCode;
                    tbxNatinalCode.InnerText = lo.NationalCode;
                    tbxBirthDay.InnerText = string.Format("{0}/{1}/{2}", lo.BirthDate.Substring(0, 4), lo.BirthDate.Substring(4, 2), lo.BirthDate.Substring(6, 2));
                    tbxUserName.InnerText = lo.UserName;
                    tbxPassword.InnerText = lo.Password;
                    tbxFixTel.InnerText = lo.PhoneNumber;
                    tbxMobile.InnerText = lo.MobileNumber;
                    tbxAddress.InnerText = lo.Address;

                    //tbxEmail.Value = lo.Email;
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#modalShowDetails').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "ModalScript", sb.ToString(), false);
                }
            }
            if (e.CommandName == "Delet")
            {
                // Retrieve the row index stored in the
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button
                // from the Rows collection.
                GridViewRow row = gvSelectedStudents.Rows[index];
                string id = row.Cells[0].Text;
                OzviatRepository rep = new OzviatRepository();

                rep.DeleteOzviat(id.ToInt());
                LoadSelectedStudents();
                LoadStudents();
            }
        }

        #endregion SelectedStudents

        #region AllStudents

        protected void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void gvStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gvStudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                // Retrieve the row index stored in the
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button
                // from the Rows collection.
                GridViewRow row = gvStudents.Rows[index];

                //Response.Redirect("http://localhost:4911/Dashboard/Admin/Details.aspx?LGID=" + row.Cells[0].Text);
                string id = row.Cells[0].Text;

                if (id != "" || id != null)
                {
                    Student lo = rep.FindByStudentCode(id);
                    tbxFirstName.InnerText = lo.FirstName;
                    tbxLastName.InnerText = lo.LastName;
                    tbxStudentCode.InnerText = lo.StudentCode;
                    tbxNatinalCode.InnerText = lo.NationalCode;
                    tbxBirthDay.InnerText = string.Format("{0}/{1}/{2}", lo.BirthDate.Substring(0, 4), lo.BirthDate.Substring(4, 2), lo.BirthDate.Substring(6, 2));
                    tbxUserName.InnerText = lo.UserName;
                    tbxPassword.InnerText = lo.Password;
                    tbxFixTel.InnerText = lo.PhoneNumber;
                    tbxMobile.InnerText = lo.MobileNumber;
                    tbxAddress.InnerText = lo.Address;

                    //tbxEmail.Value = lo.Email;
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#modalShowDetails').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "ModalScript", sb.ToString(), false);
                }
            }
            if (e.CommandName == "Add")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button
                // from the Rows collection.
                GridViewRow row = gvStudents.Rows[index];

                string id = row.Cells[0].Text;
                DataAccess.Ozviat oo = new DataAccess.Ozviat();
                oo.LGID = 3;
                List<string> St = or.FindStudentCodeByLGID(3);

                if (St.IndexOf(id) == -1)
                {
                    oo.StudentCode = id;
                    or.SaveOzviat(oo);
                    LoadSelectedStudents();
                    LoadStudents();
                }
                else
                {
                }
            };
        }

        #endregion AllStudents
    }
}