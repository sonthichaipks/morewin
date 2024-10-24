using moreApi.Model;
using moreApi.ModelVeiw;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Cors;
using System.Numerics;

namespace moreApi.Controllers
{
    //[EnableCors("momoPolicy")]
    [ApiController]
    [Route("[controller]")]
    public class QryDatumController : ControllerBase
    {
        private IConfiguration _configuration;
        private readonly ILogger<QryDatumController> _logger;
        QryDataView newView;
        public QryDatumController(ILogger<QryDatumController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
            newView = new QryDataView(_configuration);
        }

        [HttpGet(Name = "QryData")]
        public IEnumerable<Qrydatum> Get()
        {

            IEnumerable<Qrydatum> _search = newView.get();
            return _search;

        }

        [HttpGet("{qryid}")]
        public IEnumerable<Qrydatum> GetACode(String qryid)
        {
            IEnumerable<Qrydatum> _search = newView.getAcode(qryid);
            return _search;

        }

        [HttpGet("{i}/{qryid}")]
        public IEnumerable<QrydataDetail> GetLikeCode(int i, String qryid)
        {
            IEnumerable<QrydataDetail> _search = newView.GetDetails(i, qryid);
            return _search;

        }
        [HttpGet("{1}/{2}/{3}")]
        public Qrydatum GetLastCode()
        {
            Qrydatum _search = newView.getLastcode();
            return _search;

        }
        [HttpPut("{1}/{2}/{3}/{4}")]
        public async Task<IActionResult> clearQryAndDetails()
        {
            //Qrydatum _search = newView.delQry();
            return Ok(newView.delQry()); 

        }
        [HttpGet("{i}/{a}/{menu}/{datebegin}/{dateend}/{goal}/{plan}")]
        public IEnumerable<QrydataDetail> GetNewCode(String menu, String datebegin, String dateend, decimal goal, decimal plan)
        {
            IEnumerable<QrydataDetail> _search = newView.GetNewQuery(menu, datebegin, dateend, goal, plan);
            return _search;

        }
        [HttpPut("{a}/{menu}/{datebegin}/{dateend}/{goal}/{plan}")]
        public async Task<IActionResult> addQryData(String menu, String datebegin, String dateend, decimal goal, decimal plan)
        {
            return Ok(newView.addQryData(menu,datebegin, dateend,goal,plan));
        }
    }
}
