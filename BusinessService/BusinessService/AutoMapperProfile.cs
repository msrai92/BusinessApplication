using AutoMapper;
using BusinessService.Dtos.Pharmacy;
using BusinessService.Models;

namespace BusinessService
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Pharmacy, GetPharmacyDto>();
            CreateMap<Pharmacy, GetByIdPharmacyDto>();
            CreateMap<Pharmacy, UpdatePharmacyDto>();
            CreateMap<UpdatePharmacyDto, Pharmacy>();
        }
    }
}
