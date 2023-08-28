using BusinessService.Models;

namespace BusinessService.Services.PharmacyService
{
    public class PharmacyService : IPharmacyService
    {
        private static List<Pharmacy> _pharmacyList = new List<Pharmacy>
        {
            new Pharmacy { Id = 1, Name = "Test Pharmacy 1"},
            new Pharmacy { Id = 2, Name = "Test Pharmacy 2"},
            new Pharmacy { Id = 3, Name = "Test Pharmacy 3"},
        };

        public async Task<List<Pharmacy>> GetAllPharmacies()
        {
            return _pharmacyList;
        }

        public async Task<Pharmacy> GetPharmacyById(int id)
        {
            var pharmacy = _pharmacyList.FirstOrDefault(p => p.Id == id);
            if (pharmacy is not null) return pharmacy;
            else throw new Exception($"Pharmacy with Id {id} does not exist");
            
        }

        public async Task<Pharmacy> UpdatePharmacy(Pharmacy pharmacy)
        {
            return pharmacy;
        }
    }
}
