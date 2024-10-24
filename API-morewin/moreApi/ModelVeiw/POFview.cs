using moreApi.Model;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Globalization;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
namespace moreApi.ModelVeiw
{

    public class POFview
    {
        IConfiguration configuration;
        MomoMngContext _context;
        public POFview(IConfiguration configuration)
        {
            _context = new MomoMngContext(configuration);
        }
        //public IEnumerable<SumReceiveBySup> get()
        //{


        //    DateTime dtBegin = DateTime.Now.AddDays(-30);
        //    DateTime dtEnd = DateTime.Now;
        //    string fmdate = dtBegin.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
        //    string todate = dtEnd.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
        //    IEnumerable<SumReceiveBySup> result = _context.SumReceiveBySups.FromSqlRaw("SELECT * FROM [dbo].[GpReceiveBySup] ('" + fmdate + "'  ,'" + todate + "','','','')").AsEnumerable();
        //    return result;
        //}
        public IEnumerable<POFbyRcv> getPOFbyRcv(String supp, String sku)
        {

            IEnumerable<POFbyRcv> result = _context.POFbyRcvs.FromSqlRaw("SELECT * FROM [dbo].[OutstBySupply_rcv] WHERE SkuCode='" + sku + "' and SupplId='" + supp + "'").AsEnumerable();
            return result;
        }
        public IEnumerable<POFbyPo> getPOFbyPo(String supp, String sku)
        {
          
            IEnumerable<POFbyPo> result = _context.POFbyPos.FromSqlRaw("SELECT * FROM [dbo].[OutstBySupply_po] WHERE SkuCode='"+ sku+"' and SupplId='"+ supp+"'").AsEnumerable();
            return result;
        }
        public IEnumerable<POFbySup> getPOFbySup(String supp, String sku)
        {
            if (supp == "xxx")
            {
                if (sku == "xxx")
                {
                    IEnumerable<POFbySup> result = _context.POFbySups.FromSqlRaw("SELECT * FROM [dbo].[OutstBySupply]").AsEnumerable();
                    return result;
                }
                else
                {
                    IEnumerable<POFbySup> result = _context.POFbySups.FromSqlRaw("SELECT * FROM [dbo].[OutstBySupply] WHERE SkuCode='" + sku + "'").AsEnumerable();
                    return result;
                }
            }
            else
            if (sku == "xxx")
            {
                IEnumerable<POFbySup> result = _context.POFbySups.FromSqlRaw("SELECT * FROM [dbo].[OutstBySupply] WHERE SupplId='" + supp + "'").AsEnumerable();
                return result;
            }
            else
            {
                IEnumerable<POFbySup> result = _context.POFbySups.FromSqlRaw("SELECT * FROM [dbo].[OutstBySupply] WHERE SkuCode='" + sku + "' and SupplId='" + supp + "'").AsEnumerable();
                return result;
            }
        }
    }
}
