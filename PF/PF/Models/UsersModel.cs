using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PF.Models
{
    public class UsersModel
    {
        public int id { get; set; }
        public string name { get; set; }
        public string login { get; set; }
        public string password { get; set; }
        public string position { get; set; }
        public Nullable<int> department_id { get; set; }
        public int role_id { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
    }
}