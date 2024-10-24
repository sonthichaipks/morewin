using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MpOrder
{
    public int Id { get; set; }

    public string OrderNo { get; set; } = null!;

    public DateOnly? OrderDate { get; set; }

    public int VilledId { get; set; }

    public string CustId { get; set; } = null!;

    public string GuestId { get; set; } = null!;

    public short? OrderFg { get; set; }

    public DateOnly? BillDate { get; set; }

    public string? BillPoint { get; set; }

    public string? CashierId { get; set; }

    public string? Salesman { get; set; }

    public string CreateBy { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? LastUpdate { get; set; }
}
public partial class EndMonthProcessData
{

    public string Menu { get; set; } = null!;

    public DateTime datebegin { get; set; }
    public DateTime dateend { get; set; }
}