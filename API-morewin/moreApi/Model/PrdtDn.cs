using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class PrdtDn
{
    public int Id { get; set; }

    public string OrderNo { get; set; } = null!;

    public DateTime OrderDate { get; set; }

    public int QryId { get; set; }

    public string? SupplId { get; set; }

    public DateTime DueDate { get; set; }

    public int PritemNo { get; set; }

    public string SkuCode { get; set; } = null!;

    public int DnitemNo { get; set; }

    public string ShopId { get; set; } = null!;

    public string? ShopName { get; set; }

    public decimal? DnQty { get; set; }

    public string? PurUnit { get; set; }

    public decimal? PurSelUnitRatio { get; set; }

    public string? CreateBy { get; set; }

    public DateTime? CreateDate { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? LastUpdate { get; set; }
}
