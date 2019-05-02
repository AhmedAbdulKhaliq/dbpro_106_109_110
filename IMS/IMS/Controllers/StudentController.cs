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

        public ActionResult EnrollCourse(int Id)
        {
            return View(db.Courses.Single(x => x.Id == Id));

        }

        [HttpPost]
        public ActionResult EnrollCourse(int Id, Course model)
        {
            bool alreadyEnrolled = false;
            var course = db.Courses.Single(x => x.Id == Id);
            var user = db.AspNetUsers.Single(x => x.UserName == User.Identity.Name);
            List<StudentEnrollment> studentEnrolls = db.StudentEnrollments.ToList();
            if (studentEnrolls != null)
            {
                foreach(StudentEnrollment s in studentEnrolls)
                {
                    if(s.AspNetUser == user && s.Course == course)
                    {
                        alreadyEnrolled = true;
                        break;
                    }
                }
            }
            if(!alreadyEnrolled)
            {
                StudentEnrollment enrollment = new StudentEnrollment();
                enrollment.AspNetUser = user;
                enrollment.Course = course;
                enrollment.DateOfEnrollment = DateTime.Now.Date;
                db.StudentEnrollments.Add(enrollment);
                db.SaveChanges();
            }
            return EnrollCourse(course.Id);
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