using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class Qrydatum
{
    public int Id { get; set; }

    public string Menu { get; set; } = null!;

    public decimal? Goal { get; set; }

    public decimal? Plan { get; set; }

    public DateTime? DateBegin { get; set; }

    public DateTime? DateEnd { get; set; }
}
