using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public class StudentModels
    {
        public class StudentRegisterModel
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Email { get; set; }
            public string Contact { get; set; }
            public string Cnic { get; set; }
            public string City { get; set; }
            public System.DateTime DOB { get; set; }
            public System.DateTime RegistrationDate { get; set; }
            public string Password { get; set; }
        }

        public class CoursesViewModel
        {
            public List<Course> allCourses { get; set; }
        }

        public class FinalQuizModel
        {
            public Course course { get; set; }
            public List<Question> questions = new List<Question>();
        }
    }
}