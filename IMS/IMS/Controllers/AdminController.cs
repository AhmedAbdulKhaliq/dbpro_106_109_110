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
using CrystalDecisions.CrystalReports.Engine;

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
        [HttpGet]
        public ActionResult ManageStudent()
        {
            FeeModels model = new FeeModels();
            List<Course> AllCourses = db.Courses.ToList();
            model.StudenstCourses = AllCourses.ToList();
            model.AllStudents = getStudents();
            


            return View(model);
        }
        public ActionResult ManageInstructors()
        {
            AccountController temp = new AccountController();
            return View(getInstructors());
        }
        public ActionResult ManageReports()
        {
            return View();
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
        [HttpPost]
        public ActionResult ManageStudent(FeeModels item)
        {
            StudentFee temp = new StudentFee();
            temp.StudentId = item.StudentId;
            temp.CourseId = item.CourseId;

            if (item.isPaid)
            {
                temp.IsPaid = 1;
            }
            else
            {
                temp.IsPaid = 0;
            }
            temp.PaymentDate = item.PaymentDate;


            db.StudentFees.Add(temp);
            db.SaveChanges();
            return RedirectToAction("ManageStudent");
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
        public List<AspNetUser> getStudents()
        {
            DB44Entities db = new DB44Entities();
            List<AspNetUser> students = new List<AspNetUser>();
            foreach(AspNetUser u in db.AspNetUsers.ToList())
            {
                if (UserManager.IsInRole(u.Id, "Student"))
                {
                    students.Add(u);
                }
            }
            return students;
            
        }

        public ActionResult exportCourseReport()
        {
            List<Course_Report_Result> cr_list = new List<Course_Report_Result>();
            foreach(Course_Report_Result cr in db.Course_Report())
            {
                if(cr.Type == 0)
                {
                    cr.CourseType = "Short";
                }
                if(cr.Type == 1)
                {
                    cr.CourseType = "Long";
                }
                cr_list.Add(cr);
            }
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CourseReport.rpt"));
            rd.SetDataSource(cr_list);
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearContent();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "CourseReport.pdf");
            }
            catch
            {
                throw;
            }
        }
        public ActionResult exportAnnouncementReport()
        {
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "AnnouncementReport.rpt"));
            rd.SetDataSource(db.Announcement_Report().ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearContent();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "AnnouncementReport.pdf");
            }
            catch
            {
                throw;
            }
        }
        public ActionResult exportStudentReport()
        {
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "StudentReport.rpt"));
            rd.SetDataSource(db.Student_Report().ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearContent();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "StudentReport.pdf");
            }
            catch
            {
                throw;
            }
        }
        public ActionResult exportInstructorReport()
        {
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "InstructorReport.rpt"));
            rd.SetDataSource(db.Instructor_Report().ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearContent();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "InstructorReport.pdf");
            }
            catch
            {
                throw;
            }
        }
        public ActionResult exportCourseInstructorReport()
        {
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "CourseInstructorReport.rpt"));
            rd.SetDataSource(db.Course_Instructor_Report().ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearContent();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "CourseInstructorReport.pdf");
            }
            catch
            {
                throw;
            }
        }
        public ActionResult exportStudentEnrollmentReport()
        {
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "StudentEnrollmentReport.rpt"));
            rd.SetDataSource(db.Student_Enrollment_Report().ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearContent();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "StudentEnrollmentReport.pdf");
            }
            catch
            {
                throw;
            }
        }
        public ActionResult exportStudentFeeReport()
        {
            List<Student_Fee_Report_Result> sfr_list = new List<Student_Fee_Report_Result>();
            foreach(Student_Fee_Report_Result sfr in db.Student_Fee_Report().ToList())
            {
                if(sfr.IsPaid == 1)
                {
                    sfr.FeePaid = "Paid";
                }
                if(sfr.IsPaid == 0)
                {
                    sfr.FeePaid = "UnPaid";
                }
                sfr_list.Add(sfr);
            }
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "StudentFeeReport.rpt"));
            rd.SetDataSource(sfr_list);
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearContent();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "StudentFeeReport.pdf");
            }
            catch
            {
                throw;
            }
        }

    }
}