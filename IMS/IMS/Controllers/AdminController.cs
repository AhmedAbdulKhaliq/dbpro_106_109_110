using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Models;
using System.IO;
namespace IMS.Controllers
{
    public class AdminController : Controller
    {
        DB44Entities db = new DB44Entities();
        // GET: Admin
        public ActionResult manageCourses()
        {
            List<Course> AllCourses = db.Courses.ToList();
            return View(AllCourses);
        }
        //public List<string> cmbtempstudentList = new List<string>();
        
        public ActionResult manageAnnoucements()
        {
            List<Announcement> AllAnnoucement = db.Announcements.ToList();
            return View(AllAnnoucement);
        }
        public ActionResult manageStudent()
        {
            return View();
        }
        public ActionResult manageInstructors()
        {
            return View();
        }
        public ActionResult Courses()
        {
            return View();
        }
        public ActionResult InstructorCourses()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AddCourse()
        {
            return View();
        }
        public ActionResult AddInstructor()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AddAnnouncement()
        {
            AnnouncemtentModels.AddAnnouncementModel model = new AnnouncemtentModels.AddAnnouncementModel();
            model.allCourses = db.Courses;
            return View(model);
        }

        [HttpPost]
        public ActionResult AddCourse(CourseModels.AddCourseModel item)
        {
            Course temp = new Course();
            temp.Name = item.Name;
            temp.Fee = item.Fee;
            if(item.isShort)
            {
                temp.Type = 0;
            }
            else
            {
                temp.Type = 1;
            }
            temp.StartDate = item.StartDate;
            temp.EndDate = item.EndDate;
            string fileName = DateTime.Now.Ticks.ToString() + Path.GetExtension(item.CourseImage.FileName);

            //Set the Image File Path.
            string filePath = "/Content/img/" + fileName;

            //Save the Image File in Folder.
            item.CourseImage.SaveAs(Server.MapPath(filePath));
            temp.ImagePath = filePath;
            db.Courses.Add(temp);
            db.SaveChanges();
            return RedirectToAction("AddCourse");
        }
        
        public ActionResult AddAnnouncement(AnnouncemtentModels.AddAnnouncementModel model)
        {
            Course c = db.Courses.Single(x => x.Id == model.CourseId);
            Announcement temp = new Announcement();

            temp.NewsText = model.News;
            //temp.CourseId = model.CourseId;
            temp.Course = c;

            temp.AnnoucementDate = model.AnnouncementDate;
            //ds
            db.Announcements.Add(temp);
            db.SaveChanges();
            return RedirectToAction("AddAnnouncement");
        }
    }
}