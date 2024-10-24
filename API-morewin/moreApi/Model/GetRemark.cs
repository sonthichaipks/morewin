using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class GetRemark
{
    public string SkuCode { get; set; } = null!;

    public string PluCode { get; set; } = null!;

    public string? DeliveNote { get; set; }
}
