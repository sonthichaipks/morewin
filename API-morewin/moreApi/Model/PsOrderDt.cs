using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class PsOrderDt
{
    public int Id { get; set; }

    public string OrderNo { get; set; } = null!;

    public short? LineItemNo { get; set; }

    public string? LineItemType { get; set; }

    public string? ItemDesc { get; set; }

    public short? RefLineItemNo { get; set; }

    public string? PluCode { get; set; }

    public decimal? Qty { get; set; }

    public string? SerialNo { get; set; }

    public decimal? UnitPrice { get; set; }

    public decimal? ExPrice { get; set; }

    public decimal? DiscPc { get; set; }

    public decimal? DiscAmt { get; set; }

    public string? DiscCouponType { get; set; }

    public string? DiscCouponNo { get; set; }

    public string? PromoId { get; set; }

    public decimal? ChrgPc { get; set; }

    public decimal? ChrgAmt { get; set; }

    public string? ItemVatType { get; set; }

    public string CreateBy { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public string UpdateBy { get; set; } = null!;

    public DateTime LastUpdate { get; set; }
}
