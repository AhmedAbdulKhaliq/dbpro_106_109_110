using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace IMS.Models
{
    public class AnnouncemtentModels
    {
        public class AddAnnouncementModel
        {
            [Required]
            public string News { get; set; }

            public DateTime AnnouncementDate { get; set; }
            public IEnumerable<Course> allCourses { get; set; }

            public int CourseId { get; set; }
        }
        public class ShowAnnoucementModel : RegisterViewModel
        {
            public List<Announcement> allAnnoucement { get; set; }
        }
    }
}