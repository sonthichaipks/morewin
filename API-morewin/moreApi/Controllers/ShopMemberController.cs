using moreApi.Model;
using moreApi.ModelVeiw;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace moreApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ShopMemberController : ControllerBase
    {
        private IConfiguration _configuration;
        private IConfiguration _configuration2;
        private readonly ILogger<ShopMemberController> _logger;
        ShopMemberView newView;
        public ShopMemberController(ILogger<ShopMemberController> logger, IConfiguration configuration, IConfiguration configuration2)
        {
            _logger = logger;
            _configuration = configuration;
            _configuration2 = configuration2;
            newView = new ShopMemberView(_configuration, _configuration2);
        }



        //[HttpGet(Name = "ShopMember")]
        //public IEnumerable<PsMember> Get()
        //{
        //    IEnumerable<PsMember> _search = newView.getMember().AsEnumerable();

        //    return _search;

        //}
        //[HttpGet("{mbid}")]
        //public IEnumerable<PsMember> GetACode(String mbid)
        //{

        //    IEnumerable<PsMember> _search = newView.getVMember(mbid).AsEnumerable();

        //    return _search;
        //}

        //[HttpGet("{shopid}/{userid}/{pass}")]
        //public IEnumerable<User> GetLogin(String shopid, String userid, String pass)
        //{

        //    IEnumerable<User> _search = newView.getLogin(shopid, userid, pass).AsEnumerable();

        //    return _search;
        //}


    }
}
