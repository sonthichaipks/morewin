using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class PrqryDtFormula
{
    public int QryId { get; set; }

    public string Mpono { get; set; } = null!;

    public DateTime Mpodate { get; set; }

    public string SkuCode { get; set; } = null!;

    public string PluCode { get; set; } = null!;

    public string? DeliveNote { get; set; }

    public decimal? LastPurPrice { get; set; }

    public decimal? PurSelUnitRatio { get; set; }

    public decimal? Plans { get; set; }

    public decimal? Goal { get; set; }

    public decimal? ReqQty { get; set; }

    public decimal? PlanQty { get; set; }

    public decimal? Salesamount { get; set; }
}
