using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MpOrderDt
{
    public int Id { get; set; }

    public int EntryId { get; set; }

    public string OrderNo { get; set; } = null!;

    public short? OrderFg { get; set; }

    public int VilledId { get; set; }

    public string CustId { get; set; } = null!;

    public string GuestId { get; set; } = null!;

    public string? HouseHost { get; set; }

    public string? EntryDesc { get; set; }

    public string? VechicleNo { get; set; }

    public DateTime CheckIn { get; set; }

    public DateTime ApproveOn { get; set; }

    public string? ApproveNote { get; set; }

    public short? ApprovedStatus { get; set; }

    public DateTime CheckOut { get; set; }

    public decimal? Times { get; set; }

    public decimal? ServicesPrice { get; set; }

    public decimal? DiscPc { get; set; }

    public decimal? DiscAmt { get; set; }

    public decimal? ChrgPc { get; set; }

    public decimal? ChrgAmt { get; set; }

    public decimal? ExPrice { get; set; }

    public string? PromoId { get; set; }

    public short? CouponType { get; set; }

    public string? CouponNo { get; set; }

    public string? EntryPoint { get; set; }

    public string? CheckOutPoint { get; set; }

    public string CreateBy { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public string UpdateBy { get; set; } = null!;

    public DateTime LastUpdate { get; set; }
}
