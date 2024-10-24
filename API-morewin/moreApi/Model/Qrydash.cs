using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class Qrydash
{
    public int Id { get; set; }

    public string DashTitle { get; set; } = null!;

    public DateTime? DateStart { get; set; }

    public DateTime? DateToday { get; set; }

    public string? OfYyyymm { get; set; }

    public decimal? SalesVolumn { get; set; }

    public decimal? SalesValues { get; set; }

    public decimal? StockVolumn { get; set; }

    public decimal? StockValues { get; set; }

    public decimal? PoOsvolumn { get; set; }

    public decimal? PoOsvalues { get; set; }

    public int? StkCodeCount { get; set; }

    public int? PluCodeCount { get; set; }

    public decimal? StkXvolumn { get; set; }

    public decimal? StkXvalues { get; set; }

    public decimal? StkX7volumn { get; set; }

    public decimal? StkX7values { get; set; }

    public decimal? StkX30volumn { get; set; }

    public decimal? StkX30values { get; set; }

    public decimal? StkX180volumn { get; set; }

    public decimal? StkX180values { get; set; }
}
