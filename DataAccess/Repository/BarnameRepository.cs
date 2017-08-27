using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using System.Data;
using System.Web.Configuration;
using System.Configuration;

namespace DataAccess.Repository
{
    public class BarnameRepository
    {
        private Connection conn;

        public BarnameRepository()
        {
            conn = new Connection();
        }

        public vLessonGroup FindByStudent1(string Stu)
        {
            vLessonGroup result = null;

            using (SchoolDBEntities sd = conn.GetContext())
            {
                //--  SELECT * FROM vPhoneList WHERE PhobeID = phoneID

                result = (from r in sd.vLessonGroups
                          where r.Class == Stu
                          select r).FirstOrDefault();
            }

            return result;
        }

        public List<string> GetlistOfAllYears()
        {
            List<string> result = new List<string>();

            using (SchoolDBEntities sd = conn.GetContext())
            {
                IEnumerable<string> pl =
                    from r in sd.vLessonGroups

                    orderby r.Year
                    select r.Year;

                pl.Distinct();
                result = pl.ToList();
                return result;
            }
        }

        public DataTable GetAllLessonGroups()
        {
            List<vLessonGroup> result = new List<vLessonGroup>();

            SchoolDBEntities sd = conn.GetContext();

            IEnumerable<vLessonGroup> pl =
                from r in sd.vLessonGroups

                orderby r.LGID
                select r;

            result = pl.ToList();
            return OnlineTools.ToDataTable(result);
        }

        public Boolean SaveLessonGroups(LessonGroup lessonGroup)
        {
            SchoolDBEntities pb = conn.GetContext();

            if (lessonGroup.LGID > 0)
            {
                //==== UPDATE ====
                pb.LessonGroups.Attach(lessonGroup);
                pb.Entry(lessonGroup).State = EntityState.Modified;
            }
            else
            {
                //==== INSERT ====
                pb.LessonGroups.Add(lessonGroup);
            }

            return Convert.ToBoolean(pb.SaveChanges());
        }

        public vLessonGroup FindByLGID(int id)
        {
            SchoolDBEntities db = new SchoolDBEntities();

            return db.vLessonGroups.Where(p => p.LGID == id).Single();
        }

        public List<string> GetTeacher(int lgid)
        {
            SchoolDBEntities sd = conn.GetContext();

            IEnumerable<string> pl =
                from r in sd.LessonGroups
                where r.LGID == lgid

                select r.TeacherCode;

            return pl.ToList();
        }

        public DataTable FindByOzviat(int ozviat)
        {
            List<vbarnameHaftegi> result = new List<vbarnameHaftegi>();

            SchoolDBEntities sd = conn.GetContext();

            IEnumerable<vbarnameHaftegi> pl =
                from r in sd.vbarnameHaftegis
                where r.OzviatID == ozviat

                select r;

            result = pl.ToList();
            return OnlineTools.ToDataTable(result);
        }

        public void DeleteLessonGroup(int EID)
        {
            SchoolDBEntities pb = conn.GetContext();

            LessonGroup selectedLesson = pb.LessonGroups.Where(p => p.LGID == EID).Single();

            if (selectedLesson != null)
            {
                pb.LessonGroups.Remove(selectedLesson);
                pb.SaveChanges();
            }
        }

        public void DeleteLessonGroups(List<int> EIDs)
        {
            SchoolDBEntities pb = conn.GetContext();

            var selectedLGroups =
                from r in pb.LessonGroups
                join at in EIDs
                on r.LGID equals at
                select r;

            foreach (var lGroup in selectedLGroups)
            {
                pb.LessonGroups.Remove(lGroup as LessonGroup);
            }

            pb.SaveChanges();
        }

        public void DeleteAll()
        {
            using (SchoolDBEntities pb = conn.GetContext())
            {
                System.Configuration.ConnectionStringSettingsCollection connectionStrings =
                    WebConfigurationManager.ConnectionStrings as ConnectionStringSettingsCollection;

                if (connectionStrings.Count > 0)
                {
                    System.Data.Linq.DataContext db = new System.Data.Linq.DataContext(connectionStrings["ConnectionString"].ConnectionString);

                    db.ExecuteCommand("TRUNCATE TABLE LessonGroups");
                }
            }
        }
    }
}