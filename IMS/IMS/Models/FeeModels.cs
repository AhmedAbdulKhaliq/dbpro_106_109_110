using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public class FeeModels
    {
        public bool isPaid { get; set; }

        public DateTime PaymentDate { get; set; }

        public string StudentId { get; set; }
        public List<AspNetUser> AllStudents = new List<AspNetUser>();


        public int CourseId { get; set; }
        public List<Course> StudenstCourses = new List<Course>();
        //
        //

    }
}