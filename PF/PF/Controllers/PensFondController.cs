using PF.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PF.Controllers
{
    public class PensFondController : Controller
    {
        private IRepository repository;
        public PensFondController(IRepository repo)
        {
            repository = repo;
        }
        [HttpGet]
        [Authorize]//(Roles = "Admin, User")]
        public ActionResult Table()
        {
            return View();
        }
        // GET: PensFond
        public ActionResult Index()
        {
            return View();
        }
    }
}