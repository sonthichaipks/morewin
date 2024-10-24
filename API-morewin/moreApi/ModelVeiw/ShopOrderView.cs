using Microsoft.AspNetCore.Http;

using System.Net.Http.Json;
using System.Reflection;
using System.Reflection.Metadata;
using System.Reflection.PortableExecutable;

using System.Globalization;
using moreApi.Model;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;
using System.Data;

namespace moreApi.ModelVeiw
{

    public class ShopOrderView
    {
        IConfiguration configuration;
       
        MomoMngContext _context2;
        public ShopOrderView(IConfiguration configuration, IConfiguration configuration2)
        {
          
            _context2 = new MomoMngContext(configuration2);
        }
     


    }
}
