using AutoMapper;
using BusinessService.Dtos.Pharmacy;
using BusinessService.Models;

namespace BusinessService.Services.PharmacyService
{
    public class PharmacyService : IPharmacyService
    {
        private readonly IMapper _mapper;
        private static List<Pharmacy> _pharmacyList = new List<Pharmacy>
        {
            new Pharmacy { Id = 1, Name = "Test Pharmacy 1"},
            new Pharmacy { Id = 2, Name = "Test Pharmacy 2"},
            new Pharmacy { Id = 3, Name = "Test Pharmacy 3"},
        };

        public PharmacyService(IMapper mapper)
        {
            _mapper = mapper;
        }

        public async Task<ServiceResponse<List<GetPharmacyDto>>> GetAllPharmacies()
        {
            var serviceResponse = new ServiceResponse<List<GetPharmacyDto>>();
            serviceResponse.Data = _pharmacyList.Select(pharmacy => _mapper.Map<GetPharmacyDto>(pharmacy)).ToList();
            return serviceResponse;
        }

        public async Task<ServiceResponse<GetByIdPharmacyDto>> GetPharmacyById(int id)
        {
            var pharmacy = _pharmacyList.FirstOrDefault(pharmacy => pharmacy.Id == id);
            var serviceResponse = new ServiceResponse<GetByIdPharmacyDto>();
            serviceResponse.Data = _mapper.Map<GetByIdPharmacyDto>(pharmacy);
            return serviceResponse;

        }

        public async Task<ServiceResponse<GetByIdPharmacyDto>> UpdatePharmacy(UpdatePharmacyDto updatedPharmacy)
        {
            var serviceResponse = new ServiceResponse<GetByIdPharmacyDto>();
            try
            {
                serviceResponse = new ServiceResponse<GetByIdPharmacyDto>();
                var pharmacyToUpdate = _pharmacyList.FirstOrDefault(pharmacy => pharmacy.Id == updatedPharmacy.Id);

                if (pharmacyToUpdate is null) { throw new Exception($"Pharmacy with id {updatedPharmacy.Id} was not found"); }
                
                updatedPharmacy.UpdatedDate = DateTime.Now; 
                _mapper.Map(updatedPharmacy, pharmacyToUpdate);

                serviceResponse.Data = _mapper.Map<GetByIdPharmacyDto>(pharmacyToUpdate);
                return serviceResponse;
            }
            catch (Exception ex)
            {
                serviceResponse.isSuccess = false;
                serviceResponse.Message = ex.Message;
            }
            return serviceResponse;
        }
    }
}
