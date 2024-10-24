//using moreApi.Model;
//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;

//namespace moreApi.ModelView
//{
//    [Route("api/[controller]")]
//    [ApiController]
//    public class SalesView : ControllerBase
//    {
//    }
//}
using Microsoft.AspNetCore.Http;

using System.Net.Http.Json;
using System.Reflection;
using System.Reflection.Metadata;
using System.Reflection.PortableExecutable;

using System.Globalization;
using moreApi.Model;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Text.RegularExpressions;
using System.Linq.Expressions;
using Microsoft.IdentityModel.Tokens;
using System.Security.Cryptography;
using System.Linq;
using System.Diagnostics.Eventing.Reader;
using System;
using System.Numerics;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace moreApi.ModelVeiw
{

    public class SalesView
    {
        IConfiguration configuration;
      
        MomoMng2Context _context1;
        MomoMngContext _context2;
        public SalesView(IConfiguration configuration, IConfiguration configuration2)
        {

            _context1 = new MomoMng2Context(configuration2);
            _context2 = new MomoMngContext(configuration2);
        }
        public IEnumerable<GpSalesSumByPluFormula> getAcode(String search)
        {
            int? newqid = _context1.QrydataDetails.OrderByDescending(e => e.QryId).FirstOrDefault().QryId;
            //IEnumerable<PsPosTranDt> result = _context.PsPosTranDts.Where(a => a.DocNo == id).AsEnumerable();
            return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GetSKUtoFormula]  (" + newqid.ToString() + ",1.4,100,'" + search + "')  order by SkuDesc").AsEnumerable();
            //return result;
        }
        public IEnumerable<GpSalesSumByPluFormula> GetLikeCode(int mode, String search)
        {
            int? newqid = _context1.QrydataDetails.OrderByDescending(e => e.QryId).FirstOrDefault().QryId; //.Where(a => a.Id.ToString() == qryid).AsEnumerable();
            if (mode == 3)
            {
                return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GetSKUtoFormulaByCat]  (" + newqid.ToString() + ",1.4,100,'" + search + "')  order by PluShortDesc").AsEnumerable();
            }
            else 
            {
                return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GetSKUtoFormula]  (" + newqid.ToString() + ",1.4,100,'" + search + "')  order by PluShortDesc").AsEnumerable();
            }
        }
        public IEnumerable<GpSalesSumByPluFormula> GetQueryCode(String id, String i, String query)
        {
            int? newqid = _context1.QrydataDetails.OrderByDescending(e => e.QryId).FirstOrDefault().QryId; //.Where(a => a.Id.ToString() == qryid).AsEnumerable();


            if (query == "a")
            {
                return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GpSalesSumSkuQryFormula]  (" + newqid.ToString() + ",1.4,100,'xxx','" + query + "', " + i + ") order by PluShortDesc").AsEnumerable();
            }
            else
            {
                // IEnumerable<GpSalesSumByPluFormula> result1 =
                return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GpSalesSumSkuQryFormula]  (" + newqid.ToString() + ",1.4,100,'xxx','" + query + "', " + i + ") order by PluShortDesc").Where(e => e.planQty > 0).AsEnumerable();
            }
        }
        public IEnumerable<GpSalesSumByPluFormula> GetQueryLikeACode(String id, String i, String query, String skucode)
        {


            int? newqid = _context1.QrydataDetails.OrderByDescending(e => e.QryId).FirstOrDefault().QryId; //.Where(a => a.Id.ToString() == qryid).AsEnumerable();
            if (query == "a")
            {
                if (skucode == "xxx")
                {
                    return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GpSalesSumSkuQryFormula]  (" + newqid.ToString() + ",1.4,100,'xxx','" + skucode + "', 1) order by PluShortDesc");//.AsEnumerable();
                }
                else
                {
                    return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GpSalesSumSkuQryFormula]  (" + newqid.ToString() + ",1.4,100,'xxx','" + skucode + "', 1) order by PluShortDesc").Where(GetSelectXpr(i, skucode));//.AsEnumerable();
                }
            }
            else
            {
                // IEnumerable<GpSalesSumByPluFormula> result1 =
                return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GpSalesSumSkuQryFormula]  (" + newqid.ToString() + ",1.4,100,'xxx','" + skucode+ "', 1) order by PluShortDesc").Where(GetSelectXpr(i, skucode)).Where(e => e.planQty > 0);//.AsEnumerable();
            }
            // IEnumerable<GpSalesSumByPluFormula> result1 =


        }
        public Expression<Func<GpSalesSumByPluFormula, bool>> GetSelectXpr(string filter, string value)
        {


            if (filter == "0")
                return e => e.vendor.Equals(value);
            else if (filter == "1")
                return e => e.SkuCode.Equals(value);
            else if (filter == "2")
                return e => e.PluCode.Equals(value);
            else if (filter == "3")
                return e => e.category.Equals(value);
         
            else
                return e => e.SkuCode.Contains(value);
        }
        public IEnumerable<GpSalesSumByPluFormula> GetQueryLikeSupplierACode( String supid, String mode, String code)
        {
            //String sku = code.Split(" , ")[0];
            //String ven = supid.Split(" , ")[0];
            int? newqid;
            //if (qryid != "0")
            //{
            //    newqid = int.Parse(qryid);
            //}
            //else
            //{
            newqid = 0; // _context1.QrydataDetails.OrderByDescending(e => e.QryId).FirstOrDefault().QryId;
            //if (newqid == null) {
            //    newqid = 0;
            //}
            //}
            return _context2.GpSalesSumByPluFormulas.FromSqlRaw("SELECT * FROM [dbo].[GpSalesSumSkuQryFormula]  (" + newqid.ToString() + ",1.4,100,'" + supid + "','" + code+"', " + mode + ") order by SkuDesc");

        

        }

    }
}

