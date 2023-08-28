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

        public async Task<ServiceResponse<List<Pharmacy>>> GetAllPharmacies()
        {
            var serviceResponse = new ServiceResponse<List<Pharmacy>>();
            serviceResponse.Data = _pharmacyList;
            return serviceResponse;
        }

        public async Task<ServiceResponse<Pharmacy>> GetPharmacyById(int id)
        {
            var pharmacy = _pharmacyList.FirstOrDefault(p => p.Id == id);
            var serviceResponse = new ServiceResponse<Pharmacy>();
            serviceResponse.Data = pharmacy;
            return serviceResponse;

        }

        public async Task<ServiceResponse<Pharmacy>> UpdatePharmacy(Pharmacy pharmacy)
        {
            var serviceResponse = new ServiceResponse<Pharmacy>();
            serviceResponse.Data = pharmacy;
            return serviceResponse;
        }
    }
}
