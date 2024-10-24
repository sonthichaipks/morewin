using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class POFbyPo
{
    public string? SupplId { get; set; }
    public DateTime? MPODate { get; set; }
    public string? MPONo { get; set; }
    public string? SkuCode { get; set; }
    public decimal? MPOQty { get; set; }

    public string? remark { get; set; }
    public string? free { get; set; }
    
}
