
using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class POFbyRcv
{
    public DateTime? DocDate { get; set; }
    public DateTime? TranDate { get; set; }
    public string? DocNo { get; set; }
    public string? SupplId { get; set; }
    public string? SkuCode { get; set; }
    public decimal? rcvPurQty { get; set; }

}
