using EventEase.Models;
using System.ComponentModel.DataAnnotations;
namespace EventEase.Models;

public class Event
{
    public int Id { get; set; }

    [Required]
    [StringLength(4)]
    public string EventId { get; set; }

    [Required]
    public string EventName { get; set; }

    [Required]
    public DateTime EventDate { get; set; }

    public string? Description { get; set; }

    [Required]
    public string VenueId { get; set; }  

    public Venue Venue { get; set; }  

    public ICollection<Booking>? Bookings { get; set; }
}
