
using moreApi.Model;
using moreApi.ModelVeiw;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace moreApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ShopOrderController : ControllerBase
    {
        private IConfiguration _configuration;
        private readonly ILogger<ShopOrderController> _logger;
        //OrderView hdView;
        ShopOrderView bdtView;
        public ShopOrderController(ILogger<ShopOrderController> logger, IConfiguration configuration, IConfiguration configuration2)
        {
            _logger = logger;
            _configuration = configuration;
            //hdView = new OrderView(_configuration);
            bdtView = new ShopOrderView(_configuration, configuration2);
        }

        //[HttpGet(Name = "ShopOrder")]
        //public IEnumerable<PsOrderDt> Get()
        //{

        //    IEnumerable<PsOrderDt> _search = bdtView.get();
        //    return _search;

        //}
        //[HttpPost]
        //[Route("CreatePosTranHd")]
        //public IActionResult CreatePosTranHd([FromForm] PsPosTranHdRecv additem)
        //{
        //    bdtView.addPosTranHd(additem);

        //    return Ok();
        //}





    }
}
