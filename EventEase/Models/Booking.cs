using EventEase.Models;
using System.ComponentModel.DataAnnotations;
namespace EventEase.Models;

public class Booking
{
    public int Id { get; set; }

    [Required]
    [StringLength(4)]
    public string BookingId { get; set; }

    [Required]
    public string EventId { get; set; }

    [Required]
    public string VenueId { get; set; }

    public DateTime BookingDate { get; set; }

    public Event Event { get; set; }

    public Venue Venue { get; set; }
}
