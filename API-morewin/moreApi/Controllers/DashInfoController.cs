using moreApi.ModelVeiw;
using Microsoft.AspNetCore.Mvc;
using moreApi.Model;

namespace moreApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DashInfoController : ControllerBase
    {
        private IConfiguration _configuration;
        private readonly ILogger<DashInfoController> _logger;
        DashInfoView newView;
        String rpc = "";
        public DashInfoController(ILogger<DashInfoController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
            newView = new DashInfoView(_configuration);
            rpc = _configuration.GetConnectionString("rpc");
        }

        [HttpGet(Name = "DashInfo")]
        public IEnumerable<DashBoardInfo> Get()
        {

            IEnumerable<DashBoardInfo> _search = newView.get(rpc);
            return _search;

        }

        [HttpGet("{content}")]
        public IEnumerable<DashBoardInfo> GetACode(String content)
        {
            IEnumerable<DashBoardInfo> _search = newView.getAcode(content, rpc);
            return _search;

        }

        [HttpPut("{menu}")]
        public async Task<IActionResult> genNew(string menu)
        {

            return Ok(newView.genNew(menu));


        }

        [HttpPost]
        [Route("EndMonthProcess")]
        public IActionResult CreatePosTranRecv([FromForm] EndMonthProcessData endmth)
        {
            newView.endmonthprocess(endmth);

            return Ok();
        }

    }
}
