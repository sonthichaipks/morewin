using System;
using System.Collections.Generic;

namespace moreApi.Model;

public partial class User
{
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string ShopId { get; set; } = null!;

    public string DisplayName { get; set; } = null!;

    public string? Email { get; set; }

    public string Source { get; set; } = null!;

    public string PasswordHash { get; set; } = null!;

    public string PasswordSalt { get; set; } = null!;

    public DateTime? LastDirectoryUpdate { get; set; }

    public string? UserImage { get; set; }

    public string? MobilePhoneNumber { get; set; }

    public bool MobilePhoneVerified { get; set; }

    public int? TwoFactorAuth { get; set; }

    public DateTime InsertDate { get; set; }

    public int InsertUserId { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? UpdateUserId { get; set; }

    public short IsActive { get; set; }
}
