//using Microsoft.Data.SqlClient;
//using Microsoft.EntityFrameworkCore;
//using moreApi.Model;
//using System.Data;
//using System.Globalization;

//namespace moreApi.ModelVeiw
//{
//    public class FgExpView
//    {
//    }
//}
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
using System.Net.NetworkInformation;
using System;

namespace moreApi.ModelVeiw
{

    public class FgExpView
    {
        IConfiguration configuration;
        MomoMngContext _context;
        MomoMng2Context _context2;
        public FgExpView(IConfiguration configuration)
        {
            _context = new MomoMngContext(configuration);
            _context2 = new MomoMng2Context(configuration);
        }
        public IEnumerable<FgExpRcvExpInfoBy> get()
        {
            IEnumerable<FgExpRcvExpInfoBy> result = _context.FgExpRcvExpInfoBys.FromSqlRaw("SELECT * FROM [dbo].[FgExpRcvExpInfoBy] ('xxx' , 3, -1) order by exR,SkuDesc").AsEnumerable();
            return result;
        }
        public IEnumerable<FgExpRcvExpInfoBy> getAcode(String content,int mode, int aging)
        {
            IEnumerable<FgExpRcvExpInfoBy> result = _context.FgExpRcvExpInfoBys.FromSqlRaw("SELECT * FROM [dbo].[FgExpRcvExpInfoBy] ('" + content + "' , "+mode.ToString()+", "+ aging.ToString()+ ") order by exR,SkuDesc").AsEnumerable();
            return result;
        }
        //public Qrydatum getLastcode()
        //{
        //    return _context.Qrydata.OrderByDescending(e => e.Id).AsEnumerable().ToList()[0];
        //    //turn result;
        //}
        //public IEnumerable<QRYdataDetail> GetDetails(int i, int id)
        //{
        //    int? newqid = _context.QRYdataDetails.OrderByDescending(e => e.QryId).FirstOrDefault().QryId; //.Where(a => a.Id.ToString() == qryid).AsEnumerable();

        //    //IEnumerable<QRYdataDetail> result = _context.QRYdataDetails.Where(a => a.QryId.Equals(newqid!)).AsEnumerable();
        //    //return result;
        //    IEnumerable<QRYdataDetail> result = _context.QRYdataDetails.Where(a => a.QryId.Equals(newqid!)).Where(f => f.QryNumber.Equals(i)).AsEnumerable();
        //    return result;
        //}

        //public IEnumerable<QRYdataDetail> GetNewQuery(String menu, String datebegin, String dateend, decimal goal, decimal plan)
        //{


        //    try
        //    {
        //        DateTime dtBegin = Convert.ToDateTime(datebegin.Replace("%2F", "/"), CultureInfo.InvariantCulture);
        //        DateTime dtEnd = Convert.ToDateTime(dateend.Replace("%2F", "/"), CultureInfo.InvariantCulture);

        //        using (var cmd = _context.Database.GetDbConnection().CreateCommand())
        //        {
        //            cmd.CommandText = "[dbo].[GpAddQry]";
        //            cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //            if (cmd.Connection.State != System.Data.ConnectionState.Open) cmd.Connection.Open();
        //            cmd.Parameters.Add(new SqlParameter("menu", SqlDbType.VarChar) { Value = menu });
        //            cmd.Parameters.Add(new SqlParameter("datebegin", SqlDbType.DateTime) { Value = dtBegin });
        //            cmd.Parameters.Add(new SqlParameter("dateend", SqlDbType.DateTime) { Value = dtEnd });
        //            cmd.Parameters.Add(new SqlParameter("goal", SqlDbType.Decimal) { Value = goal });
        //            cmd.Parameters.Add(new SqlParameter("plan", SqlDbType.Decimal) { Value = plan });

        //            cmd.ExecuteNonQuery();
        //        }
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {

        //    }
        //    int? newqid = _context.QRYdataDetails.OrderByDescending(e => e.QryId).FirstOrDefault().QryId; //.Where(a => a.Id.ToString() == qryid).AsEnumerable();

        //    IEnumerable<QRYdataDetail> result = _context.QRYdataDetails.Where(a => a.QryId.Equals(newqid!)).AsEnumerable();
        //    return result;



        //}

        //public String addQryData(String menu, String datebegin, String dateend, decimal goal, decimal plan)
        //{
        //    try
        //    {
        //        DateTime dtBegin = Convert.ToDateTime(datebegin.Replace("%2F", "/"), CultureInfo.InvariantCulture);
        //        DateTime dtEnd = Convert.ToDateTime(dateend.Replace("%2F", "/"), CultureInfo.InvariantCulture);
        //        using (var cmd = _context.Database.GetDbConnection().CreateCommand())
        //        {
        //            cmd.CommandText = "[dbo].[GpAddQry]";
        //            cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //            if (cmd.Connection.State != System.Data.ConnectionState.Open) cmd.Connection.Open();
        //            cmd.Parameters.Add(new SqlParameter("menu", SqlDbType.VarChar) { Value = menu });
        //            cmd.Parameters.Add(new SqlParameter("datebegin", SqlDbType.DateTime) { Value = dtBegin });
        //            cmd.Parameters.Add(new SqlParameter("dateend", SqlDbType.DateTime) { Value = dtEnd });
        //            cmd.Parameters.Add(new SqlParameter("goal", SqlDbType.Decimal) { Value = goal });
        //            cmd.Parameters.Add(new SqlParameter("plan", SqlDbType.Decimal) { Value = plan });

        //            cmd.ExecuteNonQuery();
        //        }





        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        return "Not succcess";
        //    }
        //    try
        //    {

        //        IEnumerable<Qrydatum> result = _context.Qrydata.OrderByDescending(e => e.Id).AsEnumerable();
        //        return result.ToList()[0].Id.ToString();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        return "succcess";
        //    }

        //}
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
        public String delTad(String tid)
        {
            try
            {
                if (CheckExists(tid))
                {
                    //PsTaxInvoiceAddress addsh = _context.PsTaxInvoiceAddresses.Where(e => e.TaxId == tid).First();


                    //try
                    //{
                    //    _context.PsTaxInvoiceAddresses.Remove(addsh);
                    //    _context.SaveChangesAsync();
                    //}
                    //catch (DbUpdateConcurrencyException)
                    //{
                    //    return "NotFound";
                    //}
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                return "NotFound";
            }


            return "good";
        }
        private bool CheckExists(string tid) =>
        _context2.Qrydata.Any(e => e.Id.ToString() == tid);
    }

}


