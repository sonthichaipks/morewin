using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MPOfollwup
{
    public int ReferQryId { get; set; }
    // public int Id { get; set; }
    public string? SupplId { get; set; }
    public string? SupplName { get; set; }
    public string? CatCode { get; set; }
    public string? MPONo { get; set; }
    public DateTime MPODate { get; set; }
    public string? SkuCode { get; set; }
    public string? PluCode { get; set; }
    public string? ItemDesc { get; set; }
    public decimal? MPOQty { get; set; }
    public decimal? instock { get; set; }
    public string? lastRcvNo { get; set; }
    public DateTime? lastChecked { get; set; }
    public string PurUnit { get; set; }
    public decimal? MPOprice { get; set; }
    public decimal? MPOamount { get; set; }
    public string? deliveryNote { get; set; }
    public decimal? plans { get; set; }

    public decimal? goal { get; set; }
    public decimal? reqQty { get; set; }
    public decimal? PurSelUnitRatio { get; set; }
    public string StkUnit { get; set; }



}
