using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MmSupplier
{
    public int Id { get; set; }

    public string SupplId { get; set; } = null!;

    public string? SupplName { get; set; }

    public string? ContactName { get; set; }

    public string? SupTelNo { get; set; }

    public string? SupEmail { get; set; }

    public string? SupplAddress { get; set; }

    public string? Remark { get; set; }

    public string? BookNo { get; set; }

    public string? BookName { get; set; }

    public string? Bank { get; set; }

    public int? DeliveryDay { get; set; }

    public string? DeliveryNote { get; set; }

    public int? CreditTerm { get; set; }

    public decimal? Popending { get; set; }

    public decimal? Outstanding { get; set; }

    public decimal? OverStanding { get; set; }

    public string CreateBy { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? LastUpdate { get; set; }
}
