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
    public class vLessonGroupRepository
    {
        private Connection conn;

        public vLessonGroupRepository()
        {
            conn = new Connection();
        }

        public vLessonGroup FindByClass(string clas)
        {
            vLessonGroup result = null;

            using (SchoolDBEntities sd = conn.GetContext())
            {
                //--  SELECT * FROM vPhoneList WHERE PhobeID = phoneID

                result = (from r in sd.vLessonGroups
                          where r.Class == clas
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
        public DataTable GetLessonGroupsByLGIDList(List<int> list)
        {
            List<vLessonGroup> result = new List<vLessonGroup>();
            foreach (int id in list)
            {

                SchoolDBEntities sd = conn.GetContext();

                IEnumerable<vLessonGroup> pl =
                    from r in sd.vLessonGroups
                    where r.LGID == id
                    orderby r.LGID
                    select r;
                foreach (var item in pl.ToList())
                { result.Add(item); }

            }

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

        public LessonGroup FindFromLgByLGID(int id)
        {
            SchoolDBEntities db = new SchoolDBEntities();

            return db.LessonGroups.Where(p => p.LGID == id).Single();
        }

        public vLessonGroup FindByYear(string year)
        {
            SchoolDBEntities db = new SchoolDBEntities();

            return db.vLessonGroups.Where(p => p.Year == year).Single();
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
        public List<int> GetClassesOfTeacher(string id)
        {
            SchoolDBEntities sd = conn.GetContext();

            IEnumerable<int> pl =
                from r in sd.LessonGroups
                where r.TeacherCode == id

                select r.LGID;

            return pl.ToList();
        }

        public DataTable FindByYeartest(string year)
        {
            List<vLessonGroup> result = new List<vLessonGroup>();

            SchoolDBEntities sd = conn.GetContext();

            IEnumerable<vLessonGroup> pl =
                from r in sd.vLessonGroups
                where r.Year.Contains(year)

                select r;

            result = pl.ToList();
            return OnlineTools.ToDataTable(result);
        }

        public DataTable FindByFullName(string firstName, string lastName)
        {
            List<vLessonGroup> result = new List<vLessonGroup>();

            using (SchoolDBEntities sd = conn.GetContext())
            {
                IEnumerable<vLessonGroup> pl =
                    from r in sd.vLessonGroups
                    where r.FirstName.Contains(firstName) && r.LastName.Contains(lastName)

                    select r;

                result = pl.ToList();
                return OnlineTools.ToDataTable(result);
            }
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