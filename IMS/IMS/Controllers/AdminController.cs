using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Models;
namespace IMS.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult manageCourses()
        {
            return View();
        }
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
        public ActionResult AddCourses()
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
            temp.Type = item.Type;
            temp.StartDate = item.StartDate;
            temp.EndDate = item.EndDate;
            
            DB44Entities db = new DB44Entities();
            db.Courses.Add(temp);
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
    }
}