using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MmProduct
{
    public int Id { get; set; }

    public string SkuCode { get; set; } = null!;

    public string PluCode { get; set; } = null!;

    public string BarCode { get; set; } = null!;

    public string? CatCode { get; set; }

    public string? SubCat1Code { get; set; }

    public string? SubCat2Code { get; set; }

    public string? BrandCode { get; set; }

    public string? Style { get; set; }

    public string? Color { get; set; }

    public string? Size { get; set; }

    public string? Taste { get; set; }

    public string? MatType { get; set; }

    public string? SkuEnDesc { get; set; }

    public string? SkuDesc { get; set; }

    public string? DeliveryNote { get; set; }

    public string? Supplier { get; set; }

    public string? SuppPluCode { get; set; }

    public decimal? ExpDayAvg { get; set; }

    public string? StkUnit { get; set; }

    public string? PurUnit { get; set; }

    public decimal? PurUnitRatio { get; set; }

    public decimal? PurUnitPrice { get; set; }

    public string? SellUnit { get; set; }

    public decimal SellUnitRatio { get; set; }

    public decimal SellUnitPrice { get; set; }

    public decimal? MinStockQty { get; set; }

    public decimal? MaxStockQty { get; set; }

    public decimal? PurLeadTime { get; set; }

    public decimal QtyOnhand { get; set; }

    public decimal? LastPurPrice { get; set; }

    public string? CreateBy { get; set; }

    public DateTime? CreateDate { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? LastUpdate { get; set; }

    public long? ProductId { get; set; }

    public int? ApiFlg { get; set; }
}
