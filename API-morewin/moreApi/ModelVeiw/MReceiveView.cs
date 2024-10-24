using moreApi.Model;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Globalization;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
namespace moreApi.ModelVeiw
{

    public class MReceiveView
    {
        IConfiguration configuration;
        MomoMngContext _context;
        public MReceiveView(IConfiguration configuration)
        {
            _context = new MomoMngContext(configuration);
        }
        public IEnumerable<SumReceiveBySup> get()
        {
            

            DateTime dtBegin = DateTime.Now.AddDays(-30); 
            DateTime dtEnd = DateTime.Now; 
            string fmdate = dtBegin.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
            string todate = dtEnd.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
            IEnumerable<SumReceiveBySup> result = _context.SumReceiveBySups.FromSqlRaw("SELECT * FROM [dbo].[GpReceiveBySup] ('" +fmdate+ "'  ,'" + todate+"','','','')").AsEnumerable();
            return result;
        }
        public IEnumerable<SumReceiveBySup> getLastNday(int days, String supp, String cat, String sku)
        {
            DateTime dtBegin = DateTime.Now.AddDays((-1)* days);
            DateTime dtEnd = DateTime.Now;
            string fmdate = dtBegin.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
            string todate = dtEnd.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
            IEnumerable<SumReceiveBySup> result = _context.SumReceiveBySups.FromSqlRaw("SELECT * FROM [dbo].[GpReceiveBySup] ('" + fmdate + "'  ,'" + todate + "','" + supp+ "','" +cat+ "','" +sku+ "')").AsEnumerable();
            return result;
        }
        public IEnumerable<ReceiveBySupList> GetLikeCode(String supplid, String skucode)
        {
            IEnumerable<ReceiveBySupList> result = _context.ReceiveBySupLists.FromSqlRaw("SELECT * FROM [dbo].[GpReceiveBySup] (''  ,'')").AsEnumerable();
            return result;
        }
    }
}
