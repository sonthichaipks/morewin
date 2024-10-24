using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class MpViledgeCustomer
{
    public int Id { get; set; }

    public int VilledId { get; set; }

    public string? PrjName { get; set; }

    public string CustId { get; set; } = null!;

    public string? CustType { get; set; }

    public string CustNameT { get; set; } = null!;

    public string? CustNameE { get; set; }

    public string? CustAddress { get; set; }

    public string? CustProvince { get; set; }

    public string? CustAmphur { get; set; }

    public string? CustTucustol { get; set; }

    public string? CustZipCode { get; set; }

    public string? CustLineAddr1 { get; set; }

    public string? CustLineAddr2 { get; set; }

    public string? CustLineAddr3 { get; set; }

    public string? CustPid { get; set; }

    public string? CustTelNo { get; set; }

    public string? CustEmail { get; set; }

    public string? CustGender { get; set; }

    public string? CustNation { get; set; }

    public string? CustRace { get; set; }

    public string? CustOccupation { get; set; }

    public DateTime? CustBirthDay { get; set; }

    public string? CustCardType { get; set; }

    public DateTime? CustApplyDate { get; set; }

    public DateTime? CustExpireDate { get; set; }

    public short? CustCardStatus { get; set; }

    public string? CustPhoto { get; set; }

    public decimal? CustAccumPoint { get; set; }

    public decimal? CustNearlyExpirePoint { get; set; }

    public DateTime? CustExpirePointDate { get; set; }

    public string? CustMemo { get; set; }

    public string CreateBy { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public string UpdateBy { get; set; } = null!;

    public DateTime LastUpdate { get; set; }

    public string? ApplyShopId { get; set; }
}
