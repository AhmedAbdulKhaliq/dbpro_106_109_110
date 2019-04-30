﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Models;
using System.IO;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;

namespace IMS.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        DB44Entities db = new DB44Entities();
        private ApplicationUserManager _userManager;

        public AdminController()
        {
        }

        public AdminController(ApplicationUserManager userManager)
        {
            UserManager = userManager;
        }


        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
        
        // GET: Admin

        public ActionResult Index()
        {
            return RedirectToAction("ManageCourses");
        }
        public ActionResult ManageCourses()
        {
            List<Course> AllCourses = db.Courses.ToList();
            return View(AllCourses);
        }
        //public List<string> cmbtempstudentList = new List<string>();
        
        public ActionResult ManageAnnoucements()
        {
            List<Announcement> AllAnnoucement = db.Announcements.ToList();
            return View(AllAnnoucement);
        }
        public ActionResult ManageStudent()
        {
            return View();
        }
        public ActionResult ManageInstructors()
        {
            AccountController temp = new AccountController();
            return View(getInstructors());
        }
        public ActionResult Courses()
        {
            return View();
        }
        public ActionResult InstructorCourses()
        {
            List<Course> AllCourses = db.Courses.ToList();
            return View(AllCourses);
        }

        [HttpGet]
        public ActionResult AddCourse()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AddInstructor()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> AddInstructor(InstructorModels.RegisterInstructorModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser
                {
                    UserName = model.Email,
                    Email = model.Email,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    City = model.City,
                    Cnic = model.Cnic,
                    Contact = model.Contact,
                    DOB = model.DOB,
                    RegistrationDate = DateTime.Now.Date
                };

                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    UserManager.AddToRole(user.Id, "Instructor");

                    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                    // Send an email with this link
                    // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                    // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                    // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");

                    return RedirectToAction("AddInstructor", "Admin");
                }
                AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        [HttpGet]
        public ActionResult AddAnnouncement()
        {
            AnnouncemtentModels.AddAnnouncementModel model = new AnnouncemtentModels.AddAnnouncementModel();
            model.allCourses = db.Courses;
            return View(model);
        }

        [HttpGet]
        public ActionResult AssignCourse(string Id)
        {
            InstructorModels.AssignCourse model = new InstructorModels.AssignCourse();
            List<Course> courses = db.Courses.ToList();
            foreach(CourseInstructor c in db.CourseInstructors)
            {
                courses.Remove(c.Course);
            }
            model.allCourses = courses;
            return View(model);
        }

        [HttpPost]
        public ActionResult AssignCourse(string Id, InstructorModels.AssignCourse model)
        {
            CourseInstructor assignment = new CourseInstructor();
            assignment.Course = db.Courses.Single(c => c.Id == model.CourseId);
            assignment.AspNetUser = db.AspNetUsers.Single(c => c.Id == Id);
            db.CourseInstructors.Add(assignment);
            db.SaveChanges();
            return RedirectToAction("ManageInstructors");
        }
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

        [HttpGet]
        public ActionResult UpdateCourse(int Id)
        {
            CourseModels.AddCourseModel model = new CourseModels.AddCourseModel();
            var u_course = db.Courses.Single(c => c.Id == Id);
            model.Name = u_course.Name;
            model.Fee = u_course.Fee;
            model.StartDate = u_course.StartDate;
            model.EndDate = u_course.EndDate;
            if (model.isShort)
            {
                u_course.Type = 0;
            }
            else
            {
                u_course.Type = 1;
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult UpdateCourse(int Id, CourseModels.AddCourseModel model)
        {
            var u_course = db.Courses.Single(c => c.Id == Id);
            if(u_course.ImagePath != null)
            {
                var folderPath = Server.MapPath("~/" + u_course.ImagePath);
                System.IO.File.Delete(folderPath);
            }
            u_course.Name = model.Name;
            u_course.Fee = model.Fee; ;
            u_course.StartDate = model.StartDate;
            u_course.EndDate = model.EndDate;
            string fileName = DateTime.Now.Ticks.ToString() + Path.GetExtension(model.CourseImage.FileName);

            //Set the Image File Path.
            string filePath = "/Content/img/" + fileName;

            //Save the Image File in Folder.
            model.CourseImage.SaveAs(Server.MapPath(filePath));
            u_course.ImagePath = filePath;
            //db.Courses.Add(temp);
            db.SaveChanges();
            return RedirectToAction("ManageCourses");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteCourse(int Id)
        {
            var u_course = db.Courses.Single(c => c.Id == Id);
            db.Courses.Remove(u_course);
            db.SaveChanges();
            return View("ManageCourses");
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

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        public List<AspNetUser> getInstructors()
        {
            DB44Entities db = new DB44Entities();
            List<AspNetUser> instructors = new List<AspNetUser>();
            foreach (AspNetUser u in db.AspNetUsers.ToList())
            {
                if (UserManager.IsInRole(u.Id, "Instructor"))
                {
                    instructors.Add(u);
                }
            }
            return instructors;
        }
    }
}