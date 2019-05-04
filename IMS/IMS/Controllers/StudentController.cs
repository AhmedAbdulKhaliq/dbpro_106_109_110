using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Models;

namespace IMS.Controllers
{

    //[Authorize(Roles = "Student")]
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

        public ActionResult AttemptFinalQuiz(int Id)
        {
            DB44Entities db = new DB44Entities();
            StudentModels.FinalQuizModel model = new StudentModels.FinalQuizModel();
            model.course = db.Courses.SingleOrDefault(i => i.Id == Id);
            foreach(Question q in model.course.Questions)
            {
                model.questions.Add(q);
            }
            return View(model);
        }

        public ActionResult EnrolledCourses()
        {
            StudentModels.CoursesViewModel model = new StudentModels.CoursesViewModel();
            List<Course> courses = new List<Course>();
            var user = db.AspNetUsers.Single(i => i.UserName == User.Identity.Name);
            foreach(StudentEnrollment se in user.StudentEnrollments)
            {
                courses.Add(se.Course);
            }
            model.allCourses = courses;
            return View(model);
         }

    }
}