using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class ReceiveBySupList
{
  
    public string? DocNo { get; set; }

    public DateTime? DocDate { get; set; }

    public string? SupplId { get; set; }

    public string? SupplName { get; set; }
    public string? PONO { get; set; }

    public string? SkuCode { get; set; }

    public string? ItemRemark { get; set; }

    public decimal? Qty { get; set; }
    public string? PurUnit { get; set; }
    public decimal? PurUnitPrice { get; set; }
    public decimal? CostValue { get; set; }

    public DateTime? ExpDate { get; set; }
    public decimal? QtyInStkUnit { get; set; }

    public string? StkUnit { get; set; }
    public string? CatCode { get; set; }
    public string? CatName { get; set; }


}
