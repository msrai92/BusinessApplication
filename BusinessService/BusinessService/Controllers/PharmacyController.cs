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
        public async Task<ActionResult<Pharmacy>> Get(int id)
        {
            return Ok(await _pharmacyService.GetPharmacyById(id));
        }

        [HttpGet("GetPharmacies")]
        public async Task<ActionResult<List<Pharmacy>>> GetAll()
        {
            return Ok(await _pharmacyService.GetAllPharmacies());
        }

        [HttpPut("UpdatePharmacy")]
        public async Task<ActionResult<Pharmacy>> UpdatePharmacy(Pharmacy pharmacy)
        {
            return Ok(await _pharmacyService.UpdatePharmacy(pharmacy));
        }
    }
}
