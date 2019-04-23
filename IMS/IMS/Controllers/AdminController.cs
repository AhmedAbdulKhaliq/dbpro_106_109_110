using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
    }
}