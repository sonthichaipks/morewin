
using System;
using System.Collections.Generic;

namespace moreApi.Model;
public class AdvProPriceA { 

    public string? PmId { get; set; }
    public DateTime? StartPromoDate { get; set; }
    public DateTime? EndPromoDate { get; set; }
    public string? PmDesc { get; set; }
    public int Id { get; set; }
    public string? SkuCode { get; set; }
    public string PluCode { get; set; }
    //public string PluDesc { get; set; }
    public string? PluShortDesc { get; set; }
    public string? StyleId { get; set; }
    public string? ColorId { get; set; }
    public string? SizeId { get; set; }
    public string? TasteId { get; set; }
    public string? MatTypeId { get; set; }
    public string? SupplCode { get; set; }
    public string? CatCode { get; set; }
    public string? SubCat1Code { get; set; }
    public string? SubCat2Code { get; set; }
    public string? BrandCode { get; set; }
    public string? SellUnit { get; set; }
    public decimal? SellUnitPrice1 { get; set; }
    public decimal? SellUnitPrice2 { get; set; }
    public decimal? SellUnitPrice3 { get; set; }
    public decimal? SellUnitPrice4 { get; set; }
    public decimal? SellUnitPrice5 { get; set; }
    public decimal? SellUnitPrice6 { get; set; }
    public string? VatCode { get; set; }
    public decimal? VatRate { get; set; }
    public decimal? QtyOnHand { get; set; }
    public short? StockFg { get; set; }
    public int? ConsignFg { get; set; }
    public int? ActiveSellFg { get; set; }
    public string? AllowSaleOverStock { get; set; }
    public string? PromoId { get; set; }
    public string? PromoName { get; set; }
    public decimal? BasePrice { get; set; }
    public decimal? Price { get; set; }
    public string? ProCondition { get; set; }
    public short? MemberFg { get; set; }
    public string? MemberType { get; set; }
    public short? PromoType { get; set; }
    public decimal? PromoDiscPc { get; set; }


}

