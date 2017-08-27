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
    public partial class AddLessonGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadDrpDList();
        }

        public void LoadDrpDList()
        {
            LessonsRepository LR = new LessonsRepository();
            KarmandRepository KR = new KarmandRepository();
            vLessonGroupRepository vLR = new vLessonGroupRepository();

            Grade.Items.Add("مقطع");
            Grade.Items[0].Value = "0";
            Grade.Items.Add("اول");
            Grade.Items[1].Value = "1";
            Grade.Items.Add("دوم");
            Grade.Items[2].Value = "2";
            Grade.Items.Add("سوم");
            Grade.Items[3].Value = "3";
            Grade.Items.Add("چهارم");
            Grade.Items[4].Value = "4";
            Grade.Items.Add("پنجم");
            Grade.Items[5].Value = "5";
            Grade.Items.Add("ششم");
            Grade.Items[6].Value = "6";
            Grade.Items.Add("هفتم");
            Grade.Items[7].Value = "7";
            Grade.Items.Add("هشتم");
            Grade.Items[8].Value = "8";
            Grade.Items.Add("نهم");
            Grade.Items[9].Value = "9";
            Grade.Items.Add("دهم");
            Grade.Items[10].Value = "10";
            Grade.Items.Add("یازدهم");
            Grade.Items[11].Value = "11";
            Grade.Items.Add("دوازدهم");
            Grade.Items[12].Value = "12";
            /////////////
            Field.Items.Add("رشته تحصیلی");
            Field.Items[0].Value = "0";
            Field.Items.Add("ریاضی");
            Field.Items[1].Value = "1";
            Field.Items.Add("تجربی");
            Field.Items[2].Value = "2";
            Field.Items.Add("انسانی");
            Field.Items[3].Value = "3";
            ///////////////
            Day.Items.Add("روز");
            Day.Items[0].Value = "0";
            Day.Items.Add("شنبه");
            Day.Items[1].Value = "1";
            Day.Items.Add("یکشنبه");
            Day.Items[2].Value = "2";
            Day.Items.Add("دوشنبه");
            Day.Items[3].Value = "3";
            Day.Items.Add("سه شنبه");
            Day.Items[4].Value = "4";
            Day.Items.Add("چهار شنبه");
            Day.Items[5].Value = "5";
            Day.Items.Add("پنج شنبه");
            Day.Items[6].Value = "6";
            ////////////////////////
            Class.Items.Add("شماره کلاس");
            Class.Items[0].Value = "0";
            Class.Items.Add("101");
            Class.Items[1].Value = "101";
            Class.Items.Add("102");
            Class.Items[2].Value = "102";
            Class.Items.Add("103");
            Class.Items[3].Value = "103";
            Class.Items.Add("201");
            Class.Items[4].Value = "201";
            Class.Items.Add("202");
            Class.Items[5].Value = "202";
            Class.Items.Add("203");
            Class.Items[6].Value = "203";
            /////////////////////////////////
            Time.Items.Add("ساعت");
            Time.Items[0].Value = "0";
            Time.Items.Add("ساعت اول");
            Time.Items[1].Value = "1";
            Time.Items.Add("ساعت دوم");
            Time.Items[2].Value = "2";
            Time.Items.Add("ساعت سوم");
            Time.Items[3].Value = "3";
            Time.Items.Add("ساعت چهارم");
            Time.Items[4].Value = "4";
            ////////////////////////
            List<Lesson> lessonList = LR.GetListOfAllLessons();
            LessonDrpDList.Items.Add("نام درس");
            LessonDrpDList.Items[0].Value = "0";
            for (int i = 1; i <= lessonList.Count; i++)
            {
                LessonDrpDList.Items.Add(lessonList[i - 1].LessonTitle);
                LessonDrpDList.Items[i].Value = lessonList[i - 1].LessonID.ToString();
            }
            ////////////////////////////
            List<Karmand> teacherList = KR.GetListOfAllEmployees();
            Teacher.Items.Add("نام مدرس");
            Teacher.Items[0].Value = "0";
            for (int i = 1; i <= teacherList.Count; i++)
            {
                Teacher.Items.Add(teacherList[i - 1].FirstName + " " + teacherList[i - 1].LastName);
                Teacher.Items[i].Value = teacherList[i - 1].PersonalCode.ToString();
            }
            //////////////////////
            List<string> yearsList = vLR.GetlistOfAllYears();
            IEnumerable<string> dYears = yearsList.Distinct();
            yearsList = dYears.ToList();
            Year.Items.Add("سال تحصیلی");
            Year.Items[0].Value = "0";
            for (int i = 1; i <= yearsList.Count; i++)
            {
                Year.Items.Add(yearsList[i - 1]);
                Year.Items[i].Value = yearsList[i - 1];
            }
        }

        protected void btnSabtLessonGroup_Click(object sender, EventArgs e)
        {
            if (Grade.SelectedIndex != 0 && Class.SelectedIndex != 0 && Day.SelectedIndex != 0 && Time.SelectedIndex != 0 && LessonDrpDList.SelectedIndex != 0 && Teacher.SelectedIndex != 0)
            {
                LessonGroup newLesson = new LessonGroup();
                if (Field.SelectedIndex > 0)
                {
                    newLesson.FieldID = Field.SelectedItem.Value.ToInt();
                }
                else
                {
                    newLesson.FieldID = 0;
                }
                newLesson.GradeID = Grade.SelectedItem.Value.ToInt();

                newLesson.Class = Class.SelectedItem.Value;
                newLesson.Day = Day.SelectedItem.Value.ToInt();
                newLesson.Time = Time.SelectedItem.Value.ToInt();
                newLesson.LessonID = LessonDrpDList.SelectedItem.Value.ToInt();
                newLesson.TeacherCode = Teacher.SelectedItem.Value;
                newLesson.Year = Year.SelectedItem.Value;
                SchoolDBEntities db = new SchoolDBEntities();
                db.LessonGroups.Add(newLesson);
                if (Convert.ToBoolean(db.SaveChanges()))
                {
                    //Response.Write("<script>alert('ثبت با موفقیت انجام شد');</script>");
                    Response.Redirect("http://localhost:4911/Dashboard/Admin/LessonGroups.aspx");
                }
                else
                {
                    // Response.Write("<script>alert('ثبت با خطا مواجه شد');</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('ثبت با خطا مواجه شد! ')", true);
                }
            }
            else
            {
                // Response.Write("<script>alert('لطفا مقدار همه فیلد ها را معین کنید');</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('لطفا تمام فیلد ها را انتخاب کنید! ')", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://localhost:4911/Dashboard/Admin/LessonGroups.aspx");
        }

        protected void asf_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("http://localhost:4911/Dashboard/Admin/LessonGroups.aspx");
        }
    }
}