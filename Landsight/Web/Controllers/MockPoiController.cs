using Landsight.Application.Abstractions.Services;
using Microsoft.AspNetCore.Mvc;
namespace Landsight.Web.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]/Poi")]
    public class MockPoiController : ControllerBase
    {
        IPoiService _service;

        public MockPoiController(IPoiService service)
        {
            _service = service;
        }

        [HttpGet]
        [Route("GetAll")]
        public IActionResult GetAll()
        {
            return Ok(_service.GetPois());
        }
    }
}
