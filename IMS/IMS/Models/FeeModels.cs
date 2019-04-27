using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace IMS.Models
{
    public class FeeModels
    {
        public class AddFeeModel
        {
            [Required]
            public bool isPaid { get; set; }

            public DateTime PaymentDate { get; set; }
            public IEnumerable<Course> allCourses { get; set; }

            public int CourseId { get; set; }
            public int StudentId { get; set; }
        }

    }
}