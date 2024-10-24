using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class OutstBySupplyPo
{
    public string? SupplId { get; set; }

    public DateTime? Mpodate { get; set; }

    public string? Mpono { get; set; }

    public string SkuCode { get; set; } = null!;

    public decimal? Mpoqty { get; set; }

    public string? Remark { get; set; }

    public string? Free { get; set; }
}
