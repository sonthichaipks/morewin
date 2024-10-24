using moreApi.Model;
using moreApi.ModelVeiw;
using Microsoft.AspNetCore.Mvc;
using Azure;
using System.Diagnostics;
using moreApi.MomoView;

namespace moreApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LookupsController : ControllerBase
    {
        private IConfiguration _configuration;
        private readonly ILogger<LookupsController> _logger;
        LookupsView newView;
        public LookupsController(ILogger<LookupsController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
            newView = new LookupsView(_configuration);
        }

        [HttpGet(Name = "Lookups")]
        public IEnumerable<Lup_supp> Get()
        {

            IEnumerable<Lup_supp> _search = newView.get();
            return _search;

        }

        [HttpGet("{search}")] //1
        public IEnumerable<Lup_supp> getSupp(String search)
        {
            IEnumerable<Lup_supp> _search = newView.getSupp(search);
            return _search;

        }
        [HttpGet("{search}/{mode}")] //2
        public IEnumerable<Lup_sku> getSku(String search, int mode)
        {
            IEnumerable<Lup_sku> _search = newView.getSku(search,mode);
            return _search;

        }

        [HttpGet("{search}/{a}/{b}")] //2
        public IEnumerable<Lup_mpo> getMpo(String search)
        {
            IEnumerable<Lup_mpo> _search = newView.getMpo(search);
            return _search;

        }



        [HttpPost]
        [Route("LookupSku")]
        public IEnumerable<Lup_sku> LookupSku([FromForm] Lookup search)
        {
            IEnumerable<Lup_sku> _search =  newView.lookupSku(search);

            return _search;
        }
        [HttpPost]
        [Route("LookupMpo")]
        public IEnumerable<Lup_mpo> LookupMpo([FromForm] Lookup search)
        {
            IEnumerable<Lup_mpo> _search = newView.lookupMpo(search);

            return _search;
        }
        [HttpPost]
        [Route("LookupSupp")]
        public IEnumerable<Lup_supp> LookupSupp([FromForm] Lookup search)
        {
            IEnumerable<Lup_supp> _search = newView.lookupSupp(search);

            return _search;
        }

      

    }
}
