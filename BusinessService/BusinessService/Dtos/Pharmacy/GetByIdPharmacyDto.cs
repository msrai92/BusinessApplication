namespace BusinessService.Dtos.Pharmacy
{
    public class GetByIdPharmacyDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string City { get; set; } = string.Empty;
        public string State { get; set; } = string.Empty;
        public string Zip { get; set; } = string.Empty;
        public long NumberOfFilledPrescriptions { get; set; }
        public DateTime CreatedDate { get; set; }

    }
}
