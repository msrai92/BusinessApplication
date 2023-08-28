using BusinessService.Models;

namespace BusinessService.Services.PharmacyService
{
    public interface IPharmacyService
    {
        Task<Pharmacy> GetPharmacyById(int id);
        Task<List<Pharmacy>> GetAllPharmacies();
        Task<Pharmacy> UpdatePharmacy(Pharmacy pharmacy);
    }
}
