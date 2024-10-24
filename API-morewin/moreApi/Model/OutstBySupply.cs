using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class OutstBySupply
{
    public string? SupplId { get; set; }

    public string? SkuCode { get; set; }

    public string? SkuDesc { get; set; }

    public string? PurUnit { get; set; }

    public string? StkUnit { get; set; }

    public decimal? Mpoqty { get; set; }

    public decimal? PurUnitRatio { get; set; }

    public decimal? RcvPurQty { get; set; }
}
