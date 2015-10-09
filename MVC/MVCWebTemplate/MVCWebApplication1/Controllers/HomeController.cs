using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCWebApplication1.Infrastructure;

namespace MVCWebApplication1.Controllers
{
    public class HomeController : Controller
    {
        private readonly IDoThings _doThings;

        public HomeController(IDoThings doThings)
        {
            _doThings = doThings;
        }

        public ActionResult Index()
        {
            _doThings.Do();

            return View();
        }
    }
}