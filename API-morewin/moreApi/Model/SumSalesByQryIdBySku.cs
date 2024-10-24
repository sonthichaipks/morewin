using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class SumSalesByQryIdBySku
{
    public string? SkuCode { get; set; }

    public decimal? SalVolumn { get; set; }

    public decimal? SalValues { get; set; }
}
