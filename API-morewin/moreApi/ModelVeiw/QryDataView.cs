//using moreApi.Model;

//namespace moreApi.ModelView
//{
//    public class QryDataView
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
using Microsoft.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Numerics;
using System.Linq;

namespace moreApi.ModelVeiw
{

    public class QryDataView
    {
        IConfiguration configuration;
        MomoMng2Context _context;
        public QryDataView(IConfiguration configuration)
        {
            _context = new MomoMng2Context(configuration);
        }
        public IEnumerable<Qrydatum> get()
        {
            IEnumerable<Qrydatum> result = _context.Qrydata.AsEnumerable();
            return result;
        }
        public IEnumerable<Qrydatum> getAcode(String qryid)
        {
            IEnumerable<Qrydatum> result = _context.Qrydata.Where(a => a.Id.ToString() == qryid).AsEnumerable();
            return result;
        }
        public Qrydatum getLastcode()
        {
            return _context.Qrydata.OrderByDescending(e => e.Id).AsEnumerable().ToList()[0];
            //turn result;
        }
        public IEnumerable<QrydataDetail> GetDetails(int i, String id)
        {
            int? newqid = _context.Qrydata.OrderByDescending(e => e.Id).FirstOrDefault().Id; //.Where(a => a.Id.ToString() == qryid).AsEnumerable();

            //IEnumerable<QRYdataDetail> result = _context.QRYdataDetails.Where(a => a.QryId.Equals(newqid!)).AsEnumerable();
            //return result;
            IEnumerable<QrydataDetail> result;
            if (i == 1)
            {
                result = _context.QrydataDetails.FromSqlRaw("select * from [dbo].[GpSKU] ('" + id + "')").AsEnumerable();
            }
            else if (i == 0)
            {
                result = _context.QrydataDetails.FromSqlRaw("select * from [dbo].[GpSupplier] ('" + id + "')").AsEnumerable();
            }
            else if (i == 2)
            {
                result = _context.QrydataDetails.FromSqlRaw("select * from [dbo].[GpPLU] ('" + id + "')").AsEnumerable();
            }
            else if (i == 3)
            {
                result = _context.QrydataDetails.FromSqlRaw("select * from [dbo].[GpCategory] ('" +id+ "')").AsEnumerable();
            }
            else { ///i==9
                result = _context.QrydataDetails.FromSqlRaw("select * from [dbo].[GpSHOP] ('" + id + "')").AsEnumerable();
            }
            return result;
        }

        public  IEnumerable<QrydataDetail> GetNewQuery(String menu, String datebegin, String dateend, decimal goal, decimal plan)
        {
         

            try
            {
                 DateTime dtBegin = Convert.ToDateTime(datebegin.Replace("%2F", "/"), CultureInfo.InvariantCulture);
                DateTime dtEnd = Convert.ToDateTime(dateend.Replace("%2F", "/"), CultureInfo.InvariantCulture);

                    using (var cmd = _context.Database.GetDbConnection().CreateCommand())
                {
                    cmd.CommandText = "[dbo].[GpAddQry]";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    if (cmd.Connection.State != System.Data.ConnectionState.Open) cmd.Connection.Open();
                    cmd.Parameters.Add(new SqlParameter("menu", SqlDbType.VarChar) { Value = menu });
                    cmd.Parameters.Add(new SqlParameter("datebegin", SqlDbType.DateTime) { Value = dtBegin });
                    cmd.Parameters.Add(new SqlParameter("dateend", SqlDbType.DateTime) { Value = dtEnd });
                    cmd.Parameters.Add(new SqlParameter("goal", SqlDbType.Decimal) { Value = goal });
                    cmd.Parameters.Add(new SqlParameter("plan", SqlDbType.Decimal) { Value = plan });

                    cmd.ExecuteNonQuery();
                }
            }
            catch (DbUpdateConcurrencyException)
            {

            }
           int? newqid =  _context.QrydataDetails.OrderByDescending(e => e.QryId).FirstOrDefault().QryId; //.Where(a => a.Id.ToString() == qryid).AsEnumerable();

            IEnumerable<QrydataDetail> result = _context.QrydataDetails.Where(a => a.QryId.Equals(newqid!)).AsEnumerable();
            return result;
            


        }

        public String addQryData(String menu, String datebegin, String dateend, decimal goal,decimal plan)
        {
            try
            {
                DateTime dtBegin = Convert.ToDateTime(datebegin.Replace("%2F", "/"), CultureInfo.InvariantCulture);
                DateTime dtEnd = Convert.ToDateTime(dateend.Replace("%2F", "/"), CultureInfo.InvariantCulture);
                using (var cmd = _context.Database.GetDbConnection().CreateCommand())
                {
                    cmd.CommandText = "[dbo].[GpAddQry]";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    if (cmd.Connection.State != System.Data.ConnectionState.Open) cmd.Connection.Open();
                    cmd.Parameters.Add(new SqlParameter("menu", SqlDbType.VarChar) { Value = menu });
                    cmd.Parameters.Add(new SqlParameter("datebegin", SqlDbType.DateTime) { Value = dtBegin });
                    cmd.Parameters.Add(new SqlParameter("dateend", SqlDbType.DateTime) { Value = dtEnd });
                    cmd.Parameters.Add(new SqlParameter("goal", SqlDbType.Decimal) { Value = goal });
                    cmd.Parameters.Add(new SqlParameter("plan", SqlDbType.Decimal) { Value = plan });

                    cmd.ExecuteNonQuery();
                }


            


            }
            catch (DbUpdateConcurrencyException)
            {
                return "Not succcess";
            }
            try {

                IEnumerable<Qrydatum> result = _context.Qrydata.OrderByDescending(e=>e.Id).AsEnumerable();
                return result.ToList()[0].Id.ToString();
            } catch (DbUpdateConcurrencyException) {
                return "succcess";
            }

        }
        public String updQrydata(String tid, String tnm, String tad, String builder)
        {
            try
            {
                
            }
            catch (DbUpdateConcurrencyException)
            {
                return "NotFound";
            }


            return "good";
        }
        public String delQry()
        {
            try
            {
                //DateTime dtBegin = Convert.ToDateTime(datebegin.Replace("%2F", "/"), CultureInfo.InvariantCulture);
                //DateTime dtEnd = Convert.ToDateTime(dateend.Replace("%2F", "/"), CultureInfo.InvariantCulture);
                using (var cmd = _context.Database.GetDbConnection().CreateCommand())
                {
                    cmd.CommandText = "[dbo].[GpClearQry]";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    if (cmd.Connection.State != System.Data.ConnectionState.Open) cmd.Connection.Open();

                    cmd.ExecuteNonQuery();
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                return "NotFound";
            }


            return "good";
        }
        private bool CheckExists(string tid) =>
        _context.Qrydata.Any(e => e.Id.ToString() == tid);
    }

}


