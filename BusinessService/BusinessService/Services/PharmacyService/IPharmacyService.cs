using BusinessService.Models;

namespace BusinessService.Services.PharmacyService
{
    public interface IPharmacyService
    {
        Task<ServiceResponse<Pharmacy>> GetPharmacyById(int id);
        Task<ServiceResponse<List<Pharmacy>>> GetAllPharmacies();
        Task<ServiceResponse<Pharmacy>> UpdatePharmacy(Pharmacy pharmacy);
    }
}
