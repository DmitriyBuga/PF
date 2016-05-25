using PF.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace PF.Models.Concrete
{
    public class EFRepository : IRepository
    {
        private DB_PensEntities dbContext;
        public EFRepository(DB_PensEntities context)
        {
            dbContext = context;
        }
        public IQueryable<Users> Users
        {
            get { return dbContext.Users; }
        }
        public IQueryable<Role> Roles
        {
            get { return dbContext.Roles; }
        }
        public void CreateNewUser(Users user)
        {
            dbContext.Users.Add(user);
            dbContext.SaveChanges();
        }
        public void DeleteRecord<T>(T dbEntry)
        {
            DbSet dbSet = dbContext.Set(typeof(T));
            dbSet.Remove(dbEntry);
            dbContext.SaveChanges();
        }
        public T CreateRecord<T>(T dbEntry)
        {
            DbSet dbSet = dbContext.Set(typeof(T));
            dbSet.Add(dbEntry);
            try
            {
                dbContext.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Debug.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:", eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Debug.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                //throw;
            }
            return dbEntry;
        }
        public void SaveChanges<T>() where T : class
        {
            dbContext.SaveChanges();
        }
        public void UpdateRecord<T>(T dbEntry) where T : class
        {
            //dbContext.Entry<T>(dbEntry).State = EntityState.Modified;
            dbContext.SaveChanges();

        }
    }
}