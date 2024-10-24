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
using System.Drawing;
using System.Numerics;
using System.Linq;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace moreApi.ModelVeiw
{

    public class DashInfoView
    {
        IConfiguration configuration;
        MomoMngContext _context;
      
        public DashInfoView(IConfiguration configuration)
        {
            _context = new MomoMngContext(configuration);
            
        }
        public IEnumerable<DashBoardInfo> get(String rpc)
        {
            if (rpc == "")
            {
                IEnumerable<DashBoardInfo> result = _context.DashBoardInfos.FromSqlRaw("SELECT * FROM [dbo].[QRYdash]  Order by Id desc ").AsEnumerable();
                return result;
            }
            else
            {
                IEnumerable<DashBoardInfo> result = _context.DashBoardInfos.FromSqlRaw("SELECT * FROM " + rpc + ".[MomoMng].[dbo].[QRYdash]  Order by Id desc ").AsEnumerable();
                return result;
            }
            }
        public IEnumerable<DashBoardInfo> getAcode(String content, String rpc)

        {
            //if (rpc == "") {
            //    IEnumerable<DashBoardInfo> result = _context.DashBoardInfos.FromSqlRaw("SELECT top 1 * FROM [dbo].[QRYdash]  Order by Id desc ").AsEnumerable();
            //    return result;
            //}
            //else {
            //    IEnumerable<DashBoardInfo> result = _context.DashBoardInfos.FromSqlRaw("SELECT top 1 * FROM " +rpc + " .[MomoMng].[dbo].[QRYdash]  Order by Id desc ").AsEnumerable();
            //    return result;
            //}
            if (rpc == "")
            {
                IEnumerable<DashBoardInfo> result = _context.DashBoardInfos.FromSqlRaw("SELECT  * FROM [dbo].[QRYdash]  Where YEAR(DateStart) = " + content +" Order by Id desc ").AsEnumerable();
                return result;
            }
            else
            {
                IEnumerable<DashBoardInfo> result = _context.DashBoardInfos.FromSqlRaw("SELECT  * FROM " + rpc + " .[MomoMng].[dbo].[QRYdash]   Where YEAR(DateStart) = " + content + "  Order by Id desc ").AsEnumerable();
                return result;
            }
        }
     
       
        public String genNew(String menu)
        {
            try
            {
                DateTime dtBegin = DateTime.Now.AddDays(-30);
                DateTime dtEnd = DateTime.Now;
                string fmdate = dtBegin.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
                string todate = dtEnd.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.GetCultureInfo("en-US"));

                using (var cmd = _context.Database.GetDbConnection().CreateCommand())
                {
                    cmd.CommandText = "[dbo].[GetDashboardInfo]";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    if (cmd.Connection.State != System.Data.ConnectionState.Open) cmd.Connection.Open();
                    cmd.Parameters.Add(new SqlParameter("menu", SqlDbType.VarChar) { Value = menu });
                    cmd.Parameters.Add(new SqlParameter("datebegin", SqlDbType.VarChar) { Value = fmdate });
                    cmd.Parameters.Add(new SqlParameter("dateend", SqlDbType.VarChar) { Value = todate });

                    cmd.ExecuteNonQuery();
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                return "NotFound";
            }


            return "good";
        }

        public String endmonthprocess(EndMonthProcessData endmth)
        {
            try
            {
              
                string fmdate = endmth.datebegin.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
                string todate = endmth.dateend.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US"));

                using (var cmd = _context.Database.GetDbConnection().CreateCommand())
                {
                    cmd.CommandText = "[dbo].[GetDashboardInfo]";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    if (cmd.Connection.State != System.Data.ConnectionState.Open) cmd.Connection.Open();
                    cmd.Parameters.Add(new SqlParameter("menu", SqlDbType.VarChar) { Value = endmth.Menu });
                    cmd.Parameters.Add(new SqlParameter("datebegin", SqlDbType.VarChar) { Value = fmdate });
                    cmd.Parameters.Add(new SqlParameter("dateend", SqlDbType.VarChar) { Value = todate });

                    cmd.ExecuteNonQuery();
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                return "NotFound";
            }


            return "good";
        }
    }

}


