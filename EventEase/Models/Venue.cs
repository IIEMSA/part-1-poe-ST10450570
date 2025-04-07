using System.ComponentModel.DataAnnotations;



namespace EventEase.Models
{
    public class Venue
    {
        public int Id { get; set; }

        [Required]
        [StringLength(4)]
        public string VenueId { get; set; }

        [Required]
        public string VenueName { get; set; }

        [Required]
        public string Location { get; set; }

        [Required]
        public int Capacity { get; set; }

        [Required]
        [Display(Name = "Image URL")]
        public string ImageURL { get; set; }

        public ICollection<Event>? Events { get; set; }
        public ICollection<Booking>? Bookings { get; set; }
    }
}
