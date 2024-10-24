using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MpViledgeGuest
{
    public int Id { get; set; }

    public int VilledId { get; set; }

    public string? PrjName { get; set; }

    public string CustId { get; set; } = null!;

    public string GuestId { get; set; } = null!;

    public string? GuestTypeId { get; set; }

    public string? GuestGroupId { get; set; }

    public string? GuestName { get; set; }

    public string? BranchName { get; set; }

    public string? GuestAddress { get; set; }

    public string? GuestRegName { get; set; }

    public string? GuestRegAddressLine1 { get; set; }

    public string? GuestRegAddressLine2 { get; set; }

    public string? GuestRegAddressLine3 { get; set; }

    public short? GuestRegType { get; set; }

    public string? GuestRegId { get; set; }

    public string? GuestTaxId { get; set; }

    public string? PromptPayLink { get; set; }

    public string? QrcodeAccount { get; set; }

    public string CreateBy { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? LastUpdate { get; set; }
}
