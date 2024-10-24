using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class PurchaseOrder
{
    public int Id { get; set; }

    public int? ReferQryId { get; set; }

    public string Mpono { get; set; } = null!;

    public DateTime? Mpodate { get; set; }

    public string? SupplId { get; set; }

    public string? SupplName { get; set; }

    public string? SupplAddres1 { get; set; }

    public string? SupplRemark { get; set; }

    public string? SupplTel { get; set; }

    public string? SupTaxId { get; set; }

    public DateTime DueDate { get; set; }

    public int? CreditTerm { get; set; }

    public string? BookBankNo { get; set; }

    public string? BookBankName { get; set; }

    public decimal? OrderAmt { get; set; }

    public Int16? OrderStatus { get; set; }

    public string? Remark { get; set; }

    ////public string? CreateBy { get; set; }

    ////public DateTime? CreateDate { get; set; }

    ////public string? UpdateBy { get; set; }

    ////public DateTime? LastUpdate { get; set; }
}

public partial class UpPurchaseOrder
{
   
    public string Mpono { get; set; } = null!;

    public string? BookBankNo { get; set; }

    public string? BookBankName { get; set; }

    public decimal? OrderAmt { get; set; }

    public Int16? OrderStatus { get; set; }

    public string? Remark { get; set; }

}
