using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class SumReceiveBySup
{

    public DateTime? FmDate { get; set; }
    public DateTime? ToDate { get; set; }

    public string? SupplId { get; set; }

    public string? SupplName { get; set; }

    public string? SkuCode { get; set; }

    public string? SkuDesc { get; set; }

    public decimal? SupplQty { get; set; }
    public string? PurUnit { get; set; }
    public decimal? LastPurPrice { get; set; }
    public decimal? SupplAmt { get; set; }

    public decimal? QtyInStkUnit { get; set; }

    public string? StkUnit { get; set; }
    public string? CatCode { get; set; }
    public string? CatName { get; set; }

}
