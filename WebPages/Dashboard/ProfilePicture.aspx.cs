﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.Repository;

namespace WebPages.Dashboard
{
    public partial class ProfilePicture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SchoolDBEntities db = new SchoolDBEntities();

                Student stuu = db.Students.Where(p => p.UserName == "javad").Single();
                imgUserPic.Src = stuu.Image;
            }
        }

        private void UpLoadAndDisplay()
        {
            string imgName = FileUpload1.FileName;
            string imgPath = "Images/" + imgName;
            int imgSize = FileUpload1.PostedFile.ContentLength;
            if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "")
            {
                imgUserPic.Src = "~/" + imgPath;
            }
        }

        protected void btnSabtEditProfile_Click(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {//D:\Projects\SchoolSmartSystem\New folder\OnlineSchool\WebPages\Dashboard\Images\3408.jpg
                string strname = FileUpload1.FileName.ToString();

                string FileName = System.IO.Path.GetFileName(FileUpload1.FileName);
                string path = Server.MapPath("/Dashboard/Images/") + FileName;
                FileUpload1.PostedFile.SaveAs(path);
                imgUserPic.Src = "Images/" + FileName;
                vStudentRepository sr = new vStudentRepository();

                SchoolDBEntities db = new SchoolDBEntities();

                Student stuu = db.Students.Where(p => p.UserName == "javad").Single();

                stuu.Image = "Images/" + strname;
                db.SaveChanges();
            }
            else
            {
            }
        }
    }
}