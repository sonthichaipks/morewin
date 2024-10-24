
using moreApi.ModelVeiw;
using Microsoft.AspNetCore.Mvc;
using moreApi.Model;

namespace moreApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class FgExpController : ControllerBase
    {
        private IConfiguration _configuration;
        private readonly ILogger<FgExpController> _logger;
        FgExpView newView;
        public FgExpController(ILogger<FgExpController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
            newView = new FgExpView(_configuration);
        }

        [HttpGet(Name = "FgExp")]
        public IEnumerable<FgExpRcvExpInfoBy> Get()
        {

            IEnumerable<FgExpRcvExpInfoBy> _search = newView.get();
            return _search;

        }

        [HttpGet("{content}/{mode}/{aging}")]
        public IEnumerable<FgExpRcvExpInfoBy> GetACode(String content,int mode, int aging)
        {
            IEnumerable<FgExpRcvExpInfoBy> _search = newView.getAcode(content,mode,aging);
            return _search;

        }

    }
}
