using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class VSumPosSalesByLastQryId
{
    public string? SkuCode { get; set; }

    public string? SkuDesc { get; set; }

    public decimal? ReqQtyInSku { get; set; }

    public string? StkUnit { get; set; }

    public decimal? ReqQtyInPur { get; set; }

    public string? PurUnit { get; set; }

    public decimal? PurUnitRatio { get; set; }

    public decimal? LastPurPrice { get; set; }

    public decimal? SumPrice { get; set; }

    public decimal? Salesamount { get; set; }

    public decimal? QtyOnhandInPur { get; set; }

    public decimal? StockCostValue { get; set; }
}
