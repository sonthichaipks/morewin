using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class PsOrder
{
    public int Id { get; set; }

    public string OrderNo { get; set; } = null!;

    public DateOnly? OrderDate { get; set; }

    public short? OrderFg { get; set; }

    public string? ShopId { get; set; }

    public DateOnly? OrderShipDate { get; set; }

    public string? MbId { get; set; }

    public string? SalesmanId { get; set; }

    public string CreateBy { get; set; } = null!;

    public string? CreateShopId { get; set; }

    public string? CreatePosId { get; set; }

    public string? CreateCashierId { get; set; }

    public DateTime CreateDate { get; set; }

    public string? SaleBy { get; set; }

    public string? SaleShopId { get; set; }

    public string? SalePosId { get; set; }

    public string? SaleCashierId { get; set; }

    public DateTime? SaleDate { get; set; }

    public string? UpdateBy { get; set; }

    public string? UpdateShopId { get; set; }

    public string? UpdatePosId { get; set; }

    public string? UpdateCashierId { get; set; }

    public DateTime? LastUpdate { get; set; }
}
