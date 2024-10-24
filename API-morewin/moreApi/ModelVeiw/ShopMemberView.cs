using System.Text;
using System.Net.Http;
using Microsoft.AspNetCore.Http;

using System.Net.Http.Json;
using System.Reflection;
using System.Reflection.Metadata;
using System.Reflection.PortableExecutable;

using System.Globalization;
using moreApi.Model;

using Microsoft.EntityFrameworkCore;


namespace moreApi.ModelVeiw
{

    public class ShopMemberView
    {
        IConfiguration configuration;
       
        MomoMng2Context _context1;
        MomoMngContext _context2;
        public ShopMemberView(IConfiguration configuration, IConfiguration configuration2)
        {
            
            _context1 = new MomoMng2Context(configuration2);
            _context2 = new MomoMngContext(configuration2);
        }


        //public IEnumerable<PsMember> getMember()
        //{
        //    IEnumerable<PsMember> result = _context2.PsMembers.AsEnumerable();
        //    return result;
        //}

        //public IEnumerable<PsMember> getVMember(String mbid)
        //{
        //    IEnumerable<PsMember> result = _context2.PsMembers.Where(e => e.MbId.Equals(mbid)).AsEnumerable();
        //    return result;
        //}

        //public IEnumerable<User> getLogin(String shopid, String userid, String pass)
        //{
        //    IEnumerable<User> result = _context2.Users.Where(e => e.Username.Equals(userid)).AsEnumerable();
        //    return result;
        //}

    }
}
