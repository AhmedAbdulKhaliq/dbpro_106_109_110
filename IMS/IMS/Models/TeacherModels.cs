using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public class TeacherModels
    {
        public class AddQuestionsModel
        {
            public string QuestionText { get; set; }
            
            public int CourseId { get; set; }

        }
    }
}