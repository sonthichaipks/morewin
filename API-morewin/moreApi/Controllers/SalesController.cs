//using moreApi.Model;
//using moreApi.ModelVeiw;
//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;

//namespace moreApi.Controllers
//{
//    [Route("api/[controller]")]
//    [ApiController]
//    public class SalesController : ControllerBase
//    {
//    }
//}

using moreApi.Model;
using moreApi.ModelVeiw;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Cors;

namespace moreApi.Controllers
{
    //[EnableCors("momoPolicy")]
    [ApiController]
    [Route("[controller]")]
    public class SalesController : ControllerBase
    {
        private IConfiguration _configuration;
        private IConfiguration _configuration2;
        private readonly ILogger<SalesController> _logger;
        SalesView newView;
        public SalesController(ILogger<SalesController> logger, IConfiguration configuration, IConfiguration configuration2)
        {
            _logger = logger;
            _configuration = configuration;
            _configuration2 = configuration2;
            newView = new SalesView(_configuration, _configuration2);
        }

       
        [HttpGet("{search}")]
        public IEnumerable<GpSalesSumByPluFormula> GetACode(String search)
        {
            IEnumerable<GpSalesSumByPluFormula> _search = newView.getAcode(search);
            return _search;

        }

        [HttpGet("{mode}/{search}")]
        public IEnumerable<GpSalesSumByPluFormula> GetLikeCode(int mode, String search)
        {
            IEnumerable<GpSalesSumByPluFormula> _search = newView.GetLikeCode(mode,search);
            return _search;

        }
        [HttpGet("{qryid}/{i}/{a}")]
        public IEnumerable<GpSalesSumByPluFormula> GetSalesData(String qryid, String i, String a)
        {
            IEnumerable<GpSalesSumByPluFormula> _search = newView.GetQueryCode(qryid, i, a);
            return _search;

        }
        [HttpGet("{qryid}/{i}/{a}/{sku}")]
        public IEnumerable<GpSalesSumByPluFormula> GetSalesLikeSkuData(String qryid, String i, String a, String sku)
        {
            IEnumerable<GpSalesSumByPluFormula> _search = newView.GetQueryLikeACode(qryid, i, a, sku);
            return _search;

        }
        [HttpGet("{supid}/{mode}/{code}/{a}/{b}")]
        public IEnumerable<GpSalesSumByPluFormula> GetSalesLikeSupplierData(String supid, String mode, String code)
        {
            IEnumerable<GpSalesSumByPluFormula> _search = newView.GetQueryLikeSupplierACode(supid, mode, code);
            return _search;

        }
    }
}
