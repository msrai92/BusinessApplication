using BusinessService.Models;
using Microsoft.AspNetCore.Mvc;

namespace BusinessService.Controllers
{
    [ApiController]
    [Route("api/[Controller]")]
    public class PharmacyController : ControllerBase
    {
        private static List<Pharmacy> _pharmacyList = new List<Pharmacy>
        {
            new Pharmacy { Id = 1, Name = "Test Pharmacy 1"},
            new Pharmacy { Id = 2, Name = "Test Pharmacy 2"},
            new Pharmacy { Id = 3, Name = "Test Pharmacy 3"},
        };

        [HttpGet("GetPharmacyById/{id}")]
        public ActionResult<Pharmacy> Get(int id)
        {
            return Ok(_pharmacyList.FirstOrDefault(p => p.Id == id));
        }

        [HttpGet("GetPharmacies")]
        public ActionResult<List<Pharmacy>> GetAll()
        {
            return Ok(_pharmacyList);
        }

        [HttpPut("UpdatePharmacy")]
        public ActionResult<Pharmacy> UpdatePharmacy(Pharmacy pharmacy)
        {
            return Ok(pharmacy);
        }
    }
}
