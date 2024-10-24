using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class Lup_mpo
{
    public string? MPONo { get; set; }
    public DateTime? MPODate { get; set; }
  
    public string? SupplId { get; set; }
    public string SupplName { get; set; }
    public decimal? OrderAmt { get; set; }

    public Int16? OrderStatus { get; set; }

}
