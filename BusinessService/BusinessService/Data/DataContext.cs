
using BusinessService.Models;

namespace BusinessService.Data
{
    public class DataContext : DbContext
    {
        private string _schemaName = "Pharmacy";
        public DataContext(DbContextOptions<DataContext> options) : base(options) 
        {
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("Pharmacy");
        }

        public DbSet<Pharmacy> tPharmacies => Set<Pharmacy>();
    }
}
