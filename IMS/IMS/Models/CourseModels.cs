using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public class CourseModels
    {
        public class AddCourseModel
        {
            public string Name { get; set; }
            public bool isShort { get; set; }
            public int Fee { get; set; }
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }
            
        }
    }
}