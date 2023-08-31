using AutoMapper;
using BusinessService;
using BusinessService.Controllers;
using BusinessService.Data;
using BusinessService.Dtos.Pharmacy;
using BusinessService.Models;
using BusinessService.Services.PharmacyService;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Moq;

namespace BusinessServiceTest
{
    public class PharmacyControllerTest
    {
        private DbContextOptions<DataContext> _options;
        private IConfigurationRoot _config;
        private readonly IMapper _mapper; 
        public PharmacyControllerTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile("appsettings.json", optional: false);
            _config = builder.Build();
            _options = new DbContextOptionsBuilder<DataContext>().UseSqlServer(_config.GetConnectionString("DefaultConnection")).Options;
            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new AutoMapperProfile());
            });
            _mapper = mappingConfig.CreateMapper();
        }

        [Fact]
        public async void GetAllPharmaciesTest()
        {
            using (var context = new DataContext(_options))
            {
                context.Database.EnsureCreated();
                var _pharmacyService = new PharmacyService(_mapper, context);
                var _pharmacyController = new PharmacyController(_pharmacyService);

                var response = await _pharmacyController.GetAll();
                var result = Assert.IsType<OkObjectResult>(response.Result);
                var value = Assert.IsType<ServiceResponse<List<GetPharmacyDto>>>(result.Value);
                Assert.True(value.isSuccess);
            }
        }
    }
}