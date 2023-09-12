using MytraModel.Models;

namespace MytraApp.DTOs
{
    public class UserOrdersDto
    {
        public int OrderId { get; set; }
        public int UserId { get; set; }
        public Location Location { get; set; }
        //public int locationId { get; set; }
        //public string locationName { get; set; }
        //public List<int> serviceId { get; set; }
        public List<Service> Service { get; set; }
        public string BuildingName { get; set; }
        public string Description { get; set; }

    }
}
