using back_end_ASP.Models;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Scaffolding.Metadata;
using System.Reflection.Metadata;

/*a session with the database, allowing us to query and save data. 
 * We define a context that derives from System.Data.Entity.DbContext and exposes a typed DbSet<TEntity> 
 * for each class in our model*/
namespace back_end_ASP.Data
{
    public class ClickMeContext : DbContext
    {
        public ClickMeContext(DbContextOptions<ClickMeContext> options)
            : base(options)
        {
       
        }

        public DbSet<Message> Messages { get; set; } = null!;
        public DbSet<Translation> Translations { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
 
        }
    }
}
