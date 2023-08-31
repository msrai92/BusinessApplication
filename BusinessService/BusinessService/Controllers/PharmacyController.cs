using BusinessService.Dtos.Pharmacy;
using BusinessService.Models;
using BusinessService.Services.PharmacyService;
using Microsoft.AspNetCore.Mvc;

namespace BusinessService.Controllers
{
    [ApiController]
    [Route("api/[Controller]")]
    public class PharmacyController : ControllerBase
    {
        private readonly IPharmacyService _pharmacyService;

        public PharmacyController(IPharmacyService pharmacyService)
        {
            _pharmacyService = pharmacyService;
        }

        [HttpGet("GetPharmacyById/{id}")]
        public async Task<ActionResult<ServiceResponse<GetByIdPharmacyDto>>> Get(int id)
        {
            var response = await _pharmacyService.GetPharmacyById(id);
            if(response.Data is null)
            {
                response.Message = $"Pharmacy with id {id} was not found";
                response.isSuccess = false;
                return NotFound(response);
            }
            return Ok();
        }

        [HttpGet("GetPharmacies")]
        public async Task<ActionResult<ServiceResponse<List<GetPharmacyDto>>>> GetAll()
        {
            return Ok(await _pharmacyService.GetAllPharmacies());
        }

        [HttpPut("UpdatePharmacy")]
        public async Task<ActionResult<ServiceResponse<GetByIdPharmacyDto>>> UpdatePharmacy(UpdatePharmacyDto pharmacy)
        {
            var response = await _pharmacyService.UpdatePharmacy(pharmacy);
            if(response.Data is null)
            {
                response.Message = $"Pharmacy with id {pharmacy.Id} was not found";
                response.isSuccess = false;
                return NotFound(response);
            }
            return Ok(response);
        }
    }
}
