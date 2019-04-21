using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Annoucements()
        {
            return View();
        }

        public ActionResult Instructors()
        {
            return View();
        }
    }
}