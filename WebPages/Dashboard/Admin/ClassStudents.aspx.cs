using Common;
using DataAccess;
using DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPages.Dashboard.Admin
{
    public partial class ClassStudents : System.Web.UI.Page
    {
        public void LoadDrpDList()
        {

        }

        public void loadLessonGroup()
        {
            string id = Request.QueryString["LGID"];

            if (id != "" || id != null)
            {
                OzviatRepository rep = new OzviatRepository();
                gvClassStudents.DataSource = rep.FindByLGID(id.ToInt());
                gvClassStudents.DataBind();

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { loadLessonGroup(); }

        }
    }
}