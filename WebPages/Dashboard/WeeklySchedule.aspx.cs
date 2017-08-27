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
            List<int?> days = bn.GetListOfDay(6);
            List<int?> Times = bn.GetListOfTime(6);
            vbarnameHaftegi bh = bn.FindByOzviatTak(6);
            lblYear.InnerText = bh.Year;

            gvSchedule.DataSource = bn.FindByOzviat(6);
            gvSchedule.DataBind();
            for (int i = 0; i < days.Count; i++)
            {
                GridViewRow row = gvSchedule.Rows[i];
                switch (days[i])
                {
                    case 1: row.Cells[2].Text = Times[i].ToString(); break;
                    case 2: row.Cells[3].Text = Times[i].ToString(); break;
                    case 3: row.Cells[4].Text = Times[i].ToString(); break;
                    case 4: row.Cells[5].Text = Times[i].ToString(); break;
                    case 5: row.Cells[6].Text = Times[i].ToString(); break;
                    case 6: row.Cells[7].Text = Times[i].ToString(); break;
                }
            }
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