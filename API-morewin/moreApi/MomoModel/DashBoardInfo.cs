using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class DashBoardInfo
{
    public int Id { get; set; }
    public string DashTitle { get; set; }

    public DateTime? DateStart { get; set; }
   
    public DateTime? DateToday { get; set; }
    public string ofYYYYMM { get; set; }


    public decimal? SalesVolumn { get; set; }

    public decimal? SalesValues { get; set; }
    public decimal? StockVolumn { get; set; }
    public decimal? StockValues { get; set; }
    public decimal? PoOSVolumn { get; set; }
    public decimal? PoOSValues { get; set; }
    public int StkCodeCount { get; set; }
    public int PluCodeCount { get; set; }
    public decimal? StkXVolumn { get; set; }
    public decimal? StkXValues { get; set; }
    public decimal? StkX7Volumn { get; set; }
    public decimal? StkX7Values { get; set; }
    public decimal? StkX30Volumn { get; set; }
    public decimal? StkX30Values { get; set; }
    public decimal? StkX180Volumn { get; set; }
    public decimal? StkX180Values { get; set; }

}
