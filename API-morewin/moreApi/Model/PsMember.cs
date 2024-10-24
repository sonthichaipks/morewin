using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class PsMember
{
    public int Id { get; set; }

    public string MbId { get; set; } = null!;

    public string? MbType { get; set; }

    public string MbNameT { get; set; } = null!;

    public string? MbNameE { get; set; }

    public string? MbAddress { get; set; }

    public string? MbProvince { get; set; }

    public string? MbAmphur { get; set; }

    public string? MbTumbol { get; set; }

    public string? MbZipCode { get; set; }

    public string? MbLineAddr1 { get; set; }

    public string? MbLineAddr2 { get; set; }

    public string? MbLineAddr3 { get; set; }

    public string? MbPid { get; set; }

    public string? MbTelNo { get; set; }

    public string? MbEmail { get; set; }

    public string? MbGender { get; set; }

    public string? MbNation { get; set; }

    public string? MbRace { get; set; }

    public string? MbOccupation { get; set; }

    public DateTime? MbBirthDay { get; set; }

    public string? MbCardType { get; set; }

    public DateTime? MbApplyDate { get; set; }

    public DateTime? MbExpireDate { get; set; }

    public short? MbCardStatus { get; set; }

    public string? MbPhoto { get; set; }

    public decimal? MbAccumPoint { get; set; }

    public decimal? MbNearlyExpirePoint { get; set; }

    public DateTime? MbExpirePointDate { get; set; }

    public string? MbMemo { get; set; }

    public string CreateBy { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public string UpdateBy { get; set; } = null!;

    public DateTime LastUpdate { get; set; }

    public string? ApplyShopId { get; set; }
}
