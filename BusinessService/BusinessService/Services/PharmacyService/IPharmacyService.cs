using BusinessService.Dtos.Pharmacy;
using BusinessService.Models;

namespace BusinessService.Services.PharmacyService
{
    public interface IPharmacyService
    {
        Task<ServiceResponse<GetByIdPharmacyDto>> GetPharmacyById(int id);
        Task<ServiceResponse<List<GetPharmacyDto>>> GetAllPharmacies();
        Task<ServiceResponse<GetByIdPharmacyDto>> UpdatePharmacy(UpdatePharmacyDto updatdePharmacy);
    }
}
