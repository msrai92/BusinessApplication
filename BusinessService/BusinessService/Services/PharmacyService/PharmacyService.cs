using AutoMapper;
using BusinessService.Data;
using BusinessService.Dtos.Pharmacy;
using BusinessService.Models;

namespace BusinessService.Services.PharmacyService
{
    public class PharmacyService : IPharmacyService
    {
        private readonly IMapper _mapper;
        private readonly DataContext _context;

        public PharmacyService(IMapper mapper, DataContext context)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<ServiceResponse<List<GetPharmacyDto>>> GetAllPharmacies()
        {
            var serviceResponse = new ServiceResponse<List<GetPharmacyDto>>();

            try
            {
                var dbPharmacies = await _context.tPharmacies.ToListAsync();
                serviceResponse.Data = dbPharmacies.Select(pharmacy => _mapper.Map<GetPharmacyDto>(pharmacy)).ToList();
            } 
            catch (Exception ex)
            {
                serviceResponse.isSuccess = false;
                serviceResponse.Message = ex.Message;
            }
            return serviceResponse;
        }

        public async Task<ServiceResponse<GetByIdPharmacyDto>> GetPharmacyById(int id)
        {
            var serviceResponse = new ServiceResponse<GetByIdPharmacyDto>();
            try
            {
                var dbPharmacy = await _context.tPharmacies.FirstOrDefaultAsync(pharmacy => pharmacy.Id == id);
                serviceResponse.Data = _mapper.Map<GetByIdPharmacyDto>(dbPharmacy);
            }
            catch (Exception ex)
            {
                serviceResponse.isSuccess = false;
                serviceResponse.Message = ex.Message;
            }
            
            return serviceResponse;
        }

        public async Task<ServiceResponse<GetByIdPharmacyDto>> UpdatePharmacy(UpdatePharmacyDto updatedPharmacy)
        {
            var serviceResponse = new ServiceResponse<GetByIdPharmacyDto>();
            try
            {
                serviceResponse = new ServiceResponse<GetByIdPharmacyDto>();
                var pharmacyToUpdate = await _context.tPharmacies.FindAsync(updatedPharmacy.Id);
                if (pharmacyToUpdate is null) { throw new Exception($"Pharmacy with id {updatedPharmacy.Id} was not found"); }
                
                updatedPharmacy.UpdatedDate = DateTime.Now;
                updatedPharmacy.CreatedDate = pharmacyToUpdate.CreatedDate;
                _mapper.Map(updatedPharmacy, pharmacyToUpdate);
                await _context.SaveChangesAsync();

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
