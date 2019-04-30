using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Models;

namespace IMS.Controllers
{

    [Authorize(Roles = "Student")]
    public class StudentController : Controller
    {
        DB44Entities db = new DB44Entities();
        // GET: Student
        public ActionResult Index()
        {
            StudentModels.CoursesViewModel model = new StudentModels.CoursesViewModel();
            model.allCourses = db.Courses.ToList();
            return View(model);
        }

        public ActionResult CourseDetails()
        {
            return View();
        }

        public ActionResult AttemptFinalQuiz()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Register(StudentModels.StudentRegisterModel item)
        {
            //DB44Entities db = new DB44Entities();
            ApplicationUser temp = new ApplicationUser();
            ////Student temp = new Student();
            //temp.FirstName = item.FirstName;
            //temp.LastName = item.LastName;
            //temp.Email = item.Email;
            //temp.Contact = item.Contact;
            //temp.Cnic = item.Cnic;
            //temp.City = item.City;
            //temp.DOB = Convert.ToDateTime(item.DOB).Date;
            //temp.Password = item.Password;
            //temp.RegistrationDate = DateTime.Now.Date;
            
            ////db.Students.Add(temp);
            //db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
    }
}