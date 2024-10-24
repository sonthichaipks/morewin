using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MpVilledge
{
    public int Id { get; set; }

    public string VilledgeName { get; set; } = null!;

    public string? PrjName { get; set; }

    public string? PrrjAddress { get; set; }

    public string? PrrjRegName { get; set; }

    public string? PrrjRegAddressLine1 { get; set; }

    public string? PrrjRegAddressLine2 { get; set; }

    public string? PrrjRegAddressLine3 { get; set; }

    public string? PrrjRegId { get; set; }

    public string? PrrjTaxId { get; set; }

    public string? PrjProcessMode { get; set; }

    public string? PrjScreenType { get; set; }

    public short? DiscRoundMethod { get; set; }

    public short? CashPayRoundMethod { get; set; }

    public string? PromptPayLink { get; set; }

    public string? QrcodeAccount { get; set; }

    public string? RecptHeadMesg1 { get; set; }

    public string? RecptHeadMesg2 { get; set; }

    public string? RecptHeadMesg3 { get; set; }

    public string? RecptHeadMesg4 { get; set; }

    public string? RecptHeadMesg5 { get; set; }

    public string? RecptHeadMesg6 { get; set; }

    public string? RecptFootMesg1 { get; set; }

    public string? RecptFootMesg2 { get; set; }

    public string? RecptFootMesg3 { get; set; }

    public string? RecptFootMesg4 { get; set; }

    public string? RecptFootMesg5 { get; set; }

    public string? RecptFootMesg6 { get; set; }

    public string? RecptFootMesg7 { get; set; }

    public string? RecptFootMesg8 { get; set; }

    public string? RecptFootMesg9 { get; set; }

    public string? RecptFootMesg10 { get; set; }

    public string CreateBy { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? LastUpdate { get; set; }
}
