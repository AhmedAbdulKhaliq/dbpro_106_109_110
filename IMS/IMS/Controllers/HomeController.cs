using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Models;

namespace IMS.Controllers
{
    public class HomeController : Controller
    {
        DB44Entities db = new DB44Entities();
        public ActionResult Index()
        {
            CourseModels.ShowCoursesModel model = new CourseModels.ShowCoursesModel();
            model.allCourses = db.Courses.ToList();
            return View(model);
        }

        public ActionResult Annoucements()
        {
            return View();
        }

        public ActionResult Instructors()
        {
            return View();
        }
    }
}