using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using IMS.Controllers;

namespace IMS.Models
{
    public class HomeViewModels
    {
        public class HomeModel
        {
            [Required]
            public string FirstName { get; set; }

            [Required]
            public string LastName { get; set; }

            [Required]
            public string Contact { get; set; }

            [Required]
            public string Cnic { get; set; }

            [Required]
            public string City { get; set; }

            [Required]
            public System.DateTime DOB { get; set; }

            [Required]
            [EmailAddress]
            [Display(Name = "Email")]
            public string Email { get; set; }

            [Required]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
            [DataType(DataType.Password)]
            [Display(Name = "Password")]
            public string Password { get; set; }

            public List<Course> allCourses { get; set; }

            public List<AspNetUser> allInstructors { get; set; }

            public HomeModel()
            {
                DB44Entities db = new DB44Entities();
                AspNetRole role = db.AspNetRoles.Single(x => x.Name == "Instructor");
                List<AspNetUser> instructors = new List<AspNetUser>();
                foreach (AspNetUser u in db.AspNetUsers.ToList())
                {
                    if (u.AspNetRoles.Contains(role))
                    {
                        instructors.Add(u);
                    }
                }
                allCourses = db.Courses.ToList();
                allInstructors = instructors;
            }
        }
    }
}