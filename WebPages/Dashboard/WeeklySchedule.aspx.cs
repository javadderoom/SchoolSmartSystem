using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.Repository;
using Common;

namespace WebPages.Dashboard
{
    public partial class WeeklySchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ScheduleLoad();
        }

        private BarnameRepository bn = new BarnameRepository();

        private void ScheduleLoad()
        {
            gvSchedule.DataSource = bn.FindByOzviat(6);
            gvSchedule.DataBind();
        }

        protected void gvSchedule_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void gvSchedule_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gvSchedule_RowEditing(object sender, GridViewEditEventArgs e)
        {
        }
    }
}