using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MomoPurOrderItem
{
    public int Id { get; set; }

    public string Mpono { get; set; } = null!;

    public DateTime Mpodate { get; set; }

    public string SkuCode { get; set; } = null!;

    public string PluCode { get; set; } = null!;

    public string? ItemDesc { get; set; }

    public string? StkUnit { get; set; }

    public string? PurUnit { get; set; }

    public decimal? Mpoqty { get; set; }

    public decimal? Mpoprice { get; set; }

    public decimal? Mpoamount { get; set; }

    public string Lrcvno { get; set; } = null!;

    public DateTime Lrcvdate { get; set; }

    public decimal? Srcvqty { get; set; }

    public short? Mpostatus { get; set; }

    public string? CreateBy { get; set; }

    public DateTime? CreateDate { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? LastUpdate { get; set; }
}
