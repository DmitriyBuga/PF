using PF.Models;
using PF.Models.Abstract;
using PF.Models.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PF.Controllers
{
    [AllowAnonymous]
    public class AccountController : Controller
    {
        private IRepository repository;
        public AccountController(IRepository repo)
        {
            repository = repo;
        }
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult ViewUsers()
        {
            List<UsersModel> model = new List<UsersModel>();
            IQueryable<Users> users = repository.Users.OrderBy(x => x.id);
            foreach (var user in users)
                model.Add(new UsersModel
                {
                    id = user.id,
                    login = user.login,
                    password = user.password,
                    role_id = user.role_id,
                    department_id = user.department_id,
                    name = user.name,
                    firstname = user.firstname,
                    lastname = user.lastname,
                });
            return View(model);
        }
        public ActionResult Register()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (!IsFreeLogin(model.UserName))
                {
                    ModelState.AddModelError("", "Пользователь уже существует в базе");
                    return View(model);
                }
                CreateNewUser(model.UserName, model.Password);
                FormsAuthentication.SetAuthCookie(model.UserName, false);
                return RedirectToAction("Table", "PensFond");
            }
            else
                return View(model);
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LogViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (ValidateUser(model.UserName, model.Password))
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);

                    if (Url.IsLocalUrl(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Table", "PensFond");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Неправильный пароль или логин");
                }

            }
            return View(model);
        }
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Login", "Account");
        }
        private bool IsFreeLogin(string login)
        {
            return (repository.Users.Where(x => x.login == login).Count() == 0);
        }
        private void CreateNewUser(string login, string password)
        {
            Users user = new Users();
            user.login = login;
            user.password = password;
            user.role_id = 2;
            user.name = login;
            user.position = "";
            repository.CreateNewUser(user);
        }
        private bool ValidateUser(string login, string password)
        {
            bool isValid = false;

            using (DB_PensEntities _db = new DB_PensEntities())
            {
                try
                {

                    Users user = (from u in _db.Users
                                  where u.login == login && u.password == password
                                  select u).FirstOrDefault();

                    if (user != null)
                    {
                        isValid = true;
                    }
                }
                catch
                {
                    isValid = false;
                }
            }
            return isValid;
        }
    }
}