using moreApi.Model;
using moreApi.ModelVeiw;
using Microsoft.AspNetCore.Mvc;
using Azure;
using System.Diagnostics;

namespace moreApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MReceiveController : ControllerBase
    {
        private IConfiguration _configuration;
        private readonly ILogger<MReceiveController> _logger;
        MReceiveView newView;
        public MReceiveController(ILogger<MReceiveController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
            newView = new MReceiveView(_configuration);
        }

        [HttpGet(Name = "MReceive")]
        public IEnumerable<SumReceiveBySup> Get()
        {

            IEnumerable<SumReceiveBySup> _search = newView.get();
            return _search;

        }

        [HttpGet("{days}/{supp}/{cat}/{sku}")]
        public IEnumerable<SumReceiveBySup> getApo(int days, String supp, String cat, String sku)
        {
            if (supp == "xxx") { supp = ""; }
            if (cat == "xxx") { cat = ""; }
            if (sku == "xxx") { sku = ""; }
            IEnumerable<SumReceiveBySup> _search = newView.getLastNday(days,supp,cat,sku);
            return _search;

        }

        //[HttpGet("{i}/{docno}")]
        //public IEnumerable<MomoPurOrderItem> getApoItems(String docno)
        //{
        //    IEnumerable<MomoPurOrderItem> _search = newView.getApoItems(docno);
        //    return _search;

        //}
        //[HttpGet("{i}/{f}/{docno}")]
        //public IEnumerable<PrqryDtFormula> getApoFormulaItem(String docno)
        //{
        //    IEnumerable<PrqryDtFormula> _search = newView.getApoFormulaItem(docno);
        //    return _search;

        //}
        //[HttpGet("{i}/{searchkey}/{ctype}/{stdate}/{enddate}")]
        //public IEnumerable<MPOfollwup> getPoFollowupm(String searchkey, int ctype, string stdate, string enddate)
        //{
        //    IEnumerable<MPOfollwup> _search = newView.getMpoFollowup(searchkey, ctype, stdate, enddate);
        //    return _search;

        //}

        //[HttpGet("{i}/{f}/{docno}/{d}")]
        //public IEnumerable<MomoRPoItem> getMpoEditItem(String docno)
        //{
        //    IEnumerable<MomoRPoItem> _search = newView.getMpoEditItem(docno);
        //    return _search;

        //}
        //[HttpPost]
        //[Route("CreateMPOALL")]
        //public IActionResult CreateMPOALL([FromForm] PurOrder podata)
        //{
        //    //var modelData = Request.Form["invoice_file"];


        //    String mpono = podata.mpono;

        //    //foreach (var key in podata.mpo)
        //    //{
        //    //    foreach (var val in podata.mpoitems)
        //    //    {
        //    //        //Trace.WriteLine(string.Format("{0}: {1}", key, val));
        //    //    }
        //    //}

        //    return Ok();
        //}
        //[HttpPost]
        //[Route("CreatePurOrder")]
        //public IActionResult CreatePurOrder([FromForm] MomoPurOrder podata)
        //{
        //    //var modelData = Request.Form["invoice_file"];


        //    //String mpono = podata.Mpono;

        //    newView.addMpo(podata);

        //    return Ok();
        //}
        //[HttpPost]
        //[Route("CreatePurOrderItem")]
        //public IActionResult CreatePurOrderItem([FromForm] MomoPurOrderItem podataitem)
        //{
        //    //var modelData = Request.Form["invoice_file"];


        //    //String mpono = podataitem.Mpono;
        //    newView.addMpoItem(podataitem);
        //    return Ok();
        //}
        //[HttpPost]
        //[Route("CreatePurOrderItFormula")]
        //public IActionResult CreatePurOrderItFormula([FromForm] PrqryDtFormula podataitformula)
        //{

        //    //String mpono = podataitformula.Mpono;

        //    newView.addFormula(podataitformula);

        //    return Ok();
        //}
    }
}
