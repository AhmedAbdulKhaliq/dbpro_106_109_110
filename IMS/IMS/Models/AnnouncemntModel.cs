using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public class AnnouncemntModel
    {
        public class AddAnnouncementModel
        {
            public string NewsText { get; set; }
            public DateTime AnnouncementDate { get; set; }
            public int CourseId { get; set; }
            
        }
    }
}