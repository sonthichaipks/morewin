using System;
using System.Collections.Generic;
using System.Drawing;
using System.Numerics;
//using System.Runtime.InteropServices.JavaScript;

namespace moreApi.Model;

public partial class GpSalesSumByPluFormula
{
    //public int QryId { get; set; }
    public int? QryId { get; set; }
    //QryId int,
    //public DateTime? DateBegin { get; set; }
    //public DateTime? DateEnd { get; set; }
   
    public string? SkuCode { get; set; }
    public string? SkuDesc { get; set; }
    public string? PluShortDesc { get; set; }
    public string? PluCode { get; set; }
    public string? SellUnit { get; set; }
    public decimal? SellUnitRatio { get; set; }
  
    public string? PurUnit { get; set; }
    public decimal? PurUnitRatio { get; set; }
  
    public decimal? LastPurPrice { get; set; }
    public decimal? UnitSellPurRate { get; set; }
    
    //public string? style { get; set; }
    //public string? Size { get; set; }
    public string? vendor { get; set; }
    //public string? taste { get; set; }
    //public string? brand { get; set; }
    public string? category { get; set; }
    //public string? subcat1Name { get; set; }
    //public string? subcat2Name { get; set; }
    public string? branch { get; set; }
 
    public decimal? plans { get; set; }
    public decimal? goal { get; set; }
    public decimal? reqQty { get; set; }
    public decimal? avgPrice { get; set; }
    public decimal? sumPrice { get; set; }
    public decimal? salesamount { get; set; }
    public string StkUnit { get; set; }
    public decimal? OnhandQty { get; set; }

    public decimal? CostOnHand { get; set; }
    public decimal? CostAvg { get; set; }
    public decimal? planQty { get; set; }



}
