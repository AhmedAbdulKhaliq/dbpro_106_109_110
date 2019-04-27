using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.ComponentModel.DataAnnotations;

namespace IMS.Models
{
    public class CourseModels
    {
        public class AddCourseModel
        {
            [Required(ErrorMessage = "Name is Requirde")]
            [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Only alphabets are allowed.")]

            public string Name { get; set; }
            public bool isShort { get; set; }

            [RegularExpression(@"^[0-9]*$", ErrorMessage = "Only digits are allowed.")]
            public int Fee { get; set; }
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }

            [RegularExpression(@"([a - zA - Z0 - 9\s_\\.\-\(\):])+(.png|.jpg|.jpeg)$/i", ErrorMessage = "Select a valid image file.")]
            public HttpPostedFileBase CourseImage { get; set; }

        }


    }
}