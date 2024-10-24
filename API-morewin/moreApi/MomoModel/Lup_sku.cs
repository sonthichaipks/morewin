
using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class Lup_sku
{
    
  
    public string? SkuCode { get; set; }
    public string? SkuDesc { get; set; }

    public string? CatCode { get; set; }
    public string? CatName { get; set; }
    public string? SupplId { get; set; }
    public string? SupplName { get; set; }

}



public partial class Lookup
{


    public string? Code { get; set; }
    public int? Mode { get; set; }


}
