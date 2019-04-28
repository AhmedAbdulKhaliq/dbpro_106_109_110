using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Models;

namespace IMS.Controllers
{
    public class InstructorController : Controller
    {
        DB44Entities db = new DB44Entities();
        // GET: Teacher
        public ActionResult Index()
        {
            InstructorModels.AddQuestionsModel model = new InstructorModels.AddQuestionsModel();
            var user = db.AspNetUsers.Single(u => u.UserName == "ahmed1026ak@gmail.co");
            foreach(CourseInstructor assignment in db.CourseInstructors)
            {
                if(assignment.AspNetUser == user)
                {
                    model.InstructorCourses.Add(assignment.Course);
                }
            }
            return View(model);    
        }

        [HttpPost]
        public ActionResult Index(InstructorModels.AddQuestionsModel model)
        {
            var course = db.Courses.Single(x => x.Id == model.CourseId);
            Question que = new Question { QuestionText = model.QuestionText, Course = course};
            Answer ans1 = new Answer { AnswerText = model.Answer1, Question = que};
            Answer ans2 = new Answer { AnswerText = model.Answer2, Question = que };
            Answer ans3 = new Answer { AnswerText = model.Answer3, Question = que };
            CorrectAnswer corAns = new CorrectAnswer { AnswerText = model.CorrectAnswer, Question = que };
            que.QuestionText = model.QuestionText;
            var user = db.AspNetUsers.Single(u => u.UserName == "ahmed1026ak@gmail.co");
            db.Questions.Add(que);
            db.Answers.Add(ans1);
            db.Answers.Add(ans2);
            db.Answers.Add(ans3);
            db.CorrectAnswers.Add(corAns);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}