using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class QrydataDetail
{
    public int Id { get; set; }

    public int QryId { get; set; }

    public int QryNumber { get; set; }

    public string? SalShop { get; set; }

    public string? Code { get; set; }

    public int? QryCount { get; set; }

    public decimal? SumQty { get; set; }

    public short Selected { get; set; }
}
