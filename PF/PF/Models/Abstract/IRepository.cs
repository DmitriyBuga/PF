using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PF.Models.Abstract
{
    public interface IRepository
    {
        IQueryable<Users> Users { get; }
        IQueryable<Role> Roles { get; }
        void CreateNewUser(Users user);
        void DeleteRecord<T>(T dbEntry);
        T CreateRecord<T>(T dbEntry);
        void UpdateRecord<T>(T dbEntry) where T : class;
        void SaveChanges<T>() where T : class;
    }
}
