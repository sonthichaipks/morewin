using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class GetBranch
{
    public string ShopId { get; set; } = null!;

    public string? ShopName { get; set; }
}
