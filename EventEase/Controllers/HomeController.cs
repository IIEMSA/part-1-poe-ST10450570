using System.Diagnostics;
using EventEase.Models;
using Microsoft.AspNetCore.Mvc;

namespace EventEase.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        // New ActionResult for Venue
        public IActionResult Venue()
        {
            return View();
        }

        // New ActionResult for Event
        public IActionResult Event()
        {
            return View();
        }

        // New ActionResult for Booking
        public IActionResult Booking()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
