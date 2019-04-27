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
            return View();
        }
        //public List<string> cmbtempstudentList = new List<string>();
        
        public ActionResult manageAnnoucements()
        {
            return View();
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

        public ActionResult AddAnnoucement()
        {
            return View();
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
            string fileName = item.Name + Path.GetExtension(item.CourseImage.FileName);
            var path = Path.Combine(Server.MapPath("~/Content/img/"), fileName);
            item.CourseImage.SaveAs(path);
            temp.ImagePath = path;
            db.Courses.Add(temp);
            db.SaveChanges();
            return RedirectToAction("AddCourse");
        }
        
        public ActionResult AddAnnouncement(AnnouncemntModel.AddAnnouncementModel item)
        {
            Announcement temp = new Announcement();

            temp.NewsText = item.NewsText;
            temp.CourseId = item.CourseId;


            temp.AnnoucementDate = item.AnnouncementDate;
            DB44Entities db = new DB44Entities();
            db.Announcements.Add(temp);
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
    }
}