using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MmPrdt
{
    public string? OrderNo { get; set; }

    public DateTime? OrderDate { get; set; }

    public DateTime? ShipDate { get; set; }

    public string? WhsCode { get; set; }

    public string? DeptCode { get; set; }

    public string? ProjCode { get; set; }

    public string? BranchCode { get; set; }

    public string SkuCode { get; set; } = null!;

    public string? SkuDesc { get; set; }

    public decimal TotalSellQty { get; set; }

    public decimal StkQty { get; set; }

    public decimal EstRatio { get; set; }

    public decimal EstSellQty { get; set; }

    public decimal EstPrqty { get; set; }

    public decimal Prqty { get; set; }

    public string? FreeRemark { get; set; }

    public decimal? PurUnitPrice { get; set; }

    public double? ExPrice { get; set; }

    public string? DeliveryNote { get; set; }

    public decimal? ReveivedQty { get; set; }

    public DateTime? LastReceived { get; set; }

    public string? CreateBy { get; set; }

    public DateTime? CreateDate { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? LastUpdate { get; set; }
}
