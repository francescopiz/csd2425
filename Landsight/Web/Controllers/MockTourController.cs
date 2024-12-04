using Landsight.Application.Abstractions.Services;
using Microsoft.AspNetCore.Mvc;
namespace Landsight.Web.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]/Tour")]
    public class MocktourController : ControllerBase
    {
        ITourService _service;

        public MocktourController(ITourService service)
        {
            _service = service;
        }

        [HttpGet]
        [Route("GetAll")]
        public IActionResult GetAll()
        {
            return Ok(_service.GetTours());
        }

        [HttpGet]
        [Route("GetPois")]
        public IActionResult GetPois(int tourId)
        {
            return Ok(_service.GetPois(tourId));
        }
    }
}
