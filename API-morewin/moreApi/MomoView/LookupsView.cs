using moreApi.Model;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Globalization;
using Microsoft.AspNetCore.Mvc;

namespace moreApi.MomoView
{
    public class LookupsView
    {
        IConfiguration configuration;
      
        MomoMngContext _context2;
        public LookupsView(IConfiguration configuration)
        {
            
            _context2 = new MomoMngContext(configuration);
        }

        public IEnumerable<Lup_supp> get()
        {
            IEnumerable<Lup_supp> result = _context2.Lup_supps.FromSqlRaw(" SELECT * FROM  [dbo].[Lup_supp]  ('xxx')").AsEnumerable();
            return result;
        }
        public IEnumerable<Lup_supp> getSupp(String search)
        {
            if (search.IndexOf("บวก") >= 0)
            {
                search = search.Replace("บวก", "+");
            }
            IEnumerable<Lup_supp> result = _context2.Lup_supps.FromSqlRaw(" SELECT * FROM [dbo].[Lup_supp] ('" + search + "')").AsEnumerable();
            return result;

        }
        public IEnumerable<Lup_mpo> getMpo(String search)
        {
            IEnumerable<Lup_mpo> result = _context2.Lup_mpos.FromSqlRaw(" SELECT * FROM [dbo].[Lup_mpo] ('" + search + "')").AsEnumerable();
            return result;

        }
        public IEnumerable<Lup_sku> getSku(String search, int mode)
        {
            if (search.IndexOf("บวก") >= 0) {
                search = search.Replace("บวก", "+");
            }
            IEnumerable<Lup_sku> result = _context2.Lup_skus.FromSqlRaw(" SELECT * FROM [dbo].[Lup_sku] ('" + search + "', " +mode.ToString()+ ")").AsEnumerable();
            return result;

        }
        public IEnumerable<Lup_sku> lookupSku([FromForm] Lookup search)
        {
          
            IEnumerable<Lup_sku> result = _context2.Lup_skus.FromSqlRaw(" SELECT * FROM [dbo].[Lup_sku] ('" + search.Code + "', " + search.Mode.ToString() + ")").AsEnumerable();
            return result;

        }
        public IEnumerable<Lup_mpo> lookupMpo([FromForm] Lookup search)
        {
            IEnumerable<Lup_mpo> result = _context2.Lup_mpos.FromSqlRaw(" SELECT * FROM [dbo].[Lup_mpo] ('" + search.Code + "')").AsEnumerable();
            return result;

        }
        public IEnumerable<Lup_supp> lookupSupp([FromForm] Lookup search)
        {
            IEnumerable<Lup_supp> result = _context2.Lup_supps.FromSqlRaw(" SELECT * FROM [dbo].[Lup_supp] ('" + search.Code + "')").AsEnumerable();
            return result;

        }

        
    }
}