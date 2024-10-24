using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class FgExpRcvExpInfoBy
{
    public int exR { get; set; }

    public DateTime? AsOfDate { get; set; }
    public string? SkuCode { get; set; }
    public DateTime? ExpDate { get; set; }

    public decimal? ExQty { get; set; }

    public decimal? ExCost { get; set; }

    public string? SkuDesc { get; set; }
    public string? StkUnit { get; set; }
    public string? ProductID { get; set; }
    public decimal? PurLeadTime { get; set; }
    public string? supplier { get; set; }
    public string? category { get; set; }
   
    


}
