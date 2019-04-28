using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace IMS.Models
{
    public class InstructorModels
    {
        public class AddQuestionsModel
        {
            public string QuestionText { get; set; }
            
            public int CourseId { get; set; }

        }

        public class RegisterInstructorModel
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
        }
    }
}