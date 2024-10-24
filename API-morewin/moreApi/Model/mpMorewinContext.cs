using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace moreApi.Model;

public partial class mpMorewinContext : DbContext
{
    public mpMorewinContext()
    {
    }

    public mpMorewinContext(DbContextOptions<mpMorewinContext> options)
        : base(options)
    {
    }

    public virtual DbSet<FgExpiredSum> FgExpiredSums { get; set; }

    public virtual DbSet<GetBranch> GetBranches { get; set; }

    public virtual DbSet<GetRemark> GetRemarks { get; set; }

    public virtual DbSet<MmPrdt> MmPrdts { get; set; }

    public virtual DbSet<MmProduct> MmProducts { get; set; }

    public virtual DbSet<MmSupplier> MmSuppliers { get; set; }

    public virtual DbSet<MomoPurOrder> MomoPurOrders { get; set; }

    public virtual DbSet<MomoPurOrderItem> MomoPurOrderItems { get; set; }

    public virtual DbSet<MpOrder> MpOrders { get; set; }

    public virtual DbSet<MpOrderDt> MpOrderDts { get; set; }

    public virtual DbSet<MpViledgeCustomer> MpViledgeCustomers { get; set; }

    public virtual DbSet<MpViledgeGuest> MpViledgeGuests { get; set; }

    public virtual DbSet<MpVilledge> MpVilledges { get; set; }

    public virtual DbSet<OutstBySupply> OutstBySupplies { get; set; }

    public virtual DbSet<OutstBySupplyPo> OutstBySupplyPos { get; set; }

    public virtual DbSet<OutstBySupplyRcv> OutstBySupplyRcvs { get; set; }

    public virtual DbSet<PrdtDn> PrdtDns { get; set; }

    public virtual DbSet<PrqryDtFormula> PrqryDtFormulas { get; set; }

    public virtual DbSet<PrqryDtFormula2> PrqryDtFormula2s { get; set; }

    public virtual DbSet<PsMember> PsMembers { get; set; }

    public virtual DbSet<PsOrder> PsOrders { get; set; }

    public virtual DbSet<PsOrderDt> PsOrderDts { get; set; }

    public virtual DbSet<PsShop> PsShops { get; set; }

    public virtual DbSet<Qrydash> Qrydashes { get; set; }

    public virtual DbSet<QrydataDetail> QrydataDetails { get; set; }

    public virtual DbSet<Qrydatum> Qrydata { get; set; }

    public virtual DbSet<SumSalesByQryId> SumSalesByQryIds { get; set; }

    public virtual DbSet<SumSalesByQryIdBySku> SumSalesByQryIdBySkus { get; set; }

    public virtual DbSet<SumStkNow> SumStkNows { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<VSumPosSalesByLastQryId> VSumPosSalesByLastQryIds { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=127.0.0.1;Database=morepos;User=sa;Password=more5599;MultipleActiveResultSets=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("Thai_100_CS_AI");

        modelBuilder.Entity<FgExpiredSum>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("FgExpiredSum");

            entity.Property(e => e.ExR).HasColumnName("exR");
            entity.Property(e => e.SumExCost)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("sumExCost");
            entity.Property(e => e.SumExQty)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("sumExQty");
        });

        modelBuilder.Entity<GetBranch>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("getBranch");

            entity.Property(e => e.ShopId)
                .HasMaxLength(5)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.ShopName)
                .HasMaxLength(40)
                .UseCollation("Thai_CS_AI");
        });

        modelBuilder.Entity<GetRemark>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("getRemark");

            entity.Property(e => e.DeliveNote)
                .HasMaxLength(200)
                .HasColumnName("deliveNote");
            entity.Property(e => e.PluCode).HasMaxLength(20);
            entity.Property(e => e.SkuCode).HasMaxLength(20);
        });

        modelBuilder.Entity<MmPrdt>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("mmPRdt");

            entity.Property(e => e.BranchCode)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.DeliveryNote).HasMaxLength(150);
            entity.Property(e => e.DeptCode)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.EstPrqty)
                .HasColumnType("decimal(8, 2)")
                .HasColumnName("EstPRQty");
            entity.Property(e => e.EstRatio).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.EstSellQty).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.FreeRemark).HasMaxLength(200);
            entity.Property(e => e.LastReceived).HasColumnType("datetime");
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.OrderDate).HasColumnType("datetime");
            entity.Property(e => e.OrderNo)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.ProjCode)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.Prqty)
                .HasColumnType("decimal(8, 2)")
                .HasColumnName("PRQty");
            entity.Property(e => e.PurUnitPrice).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.ReveivedQty).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.ShipDate).HasColumnType("datetime");
            entity.Property(e => e.SkuCode).HasMaxLength(20);
            entity.Property(e => e.SkuDesc)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.StkQty).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.TotalSellQty).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
            entity.Property(e => e.WhsCode)
                .HasMaxLength(3)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MmProduct>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("mmProduct");

            entity.Property(e => e.BarCode).HasMaxLength(50);
            entity.Property(e => e.BrandCode).HasMaxLength(15);
            entity.Property(e => e.CatCode).HasMaxLength(15);
            entity.Property(e => e.Color).HasMaxLength(200);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.DeliveryNote).HasMaxLength(150);
            entity.Property(e => e.ExpDayAvg).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastPurPrice).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.MatType).HasMaxLength(200);
            entity.Property(e => e.MaxStockQty).HasColumnType("decimal(7, 2)");
            entity.Property(e => e.MinStockQty).HasColumnType("decimal(7, 2)");
            entity.Property(e => e.PluCode).HasMaxLength(20);
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.PurLeadTime).HasColumnType("decimal(3, 0)");
            entity.Property(e => e.PurUnit).HasMaxLength(15);
            entity.Property(e => e.PurUnitPrice).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.PurUnitRatio).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.QtyOnhand).HasColumnType("decimal(9, 2)");
            entity.Property(e => e.SellUnit).HasMaxLength(15);
            entity.Property(e => e.SellUnitPrice).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.SellUnitRatio).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.Size).HasMaxLength(200);
            entity.Property(e => e.SkuCode).HasMaxLength(20);
            entity.Property(e => e.SkuDesc).HasMaxLength(150);
            entity.Property(e => e.SkuEnDesc).HasMaxLength(150);
            entity.Property(e => e.StkUnit).HasMaxLength(15);
            entity.Property(e => e.Style).HasMaxLength(200);
            entity.Property(e => e.SubCat1Code).HasMaxLength(15);
            entity.Property(e => e.SubCat2Code).HasMaxLength(15);
            entity.Property(e => e.SuppPluCode).HasMaxLength(100);
            entity.Property(e => e.Supplier).HasMaxLength(20);
            entity.Property(e => e.Taste).HasMaxLength(200);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<MmSupplier>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("mmSupplier");

            entity.Property(e => e.Bank).HasMaxLength(150);
            entity.Property(e => e.BookName).HasMaxLength(150);
            entity.Property(e => e.BookNo).HasMaxLength(150);
            entity.Property(e => e.ContactName).HasMaxLength(50);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.DeliveryNote).HasMaxLength(150);
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.Outstanding).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.OverStanding).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.Popending)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("POpending");
            entity.Property(e => e.Remark).HasMaxLength(150);
            entity.Property(e => e.SupEmail).HasMaxLength(40);
            entity.Property(e => e.SupTelNo).HasMaxLength(30);
            entity.Property(e => e.SupplAddress).HasMaxLength(150);
            entity.Property(e => e.SupplId).HasMaxLength(20);
            entity.Property(e => e.SupplName).HasMaxLength(80);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<MomoPurOrder>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("MomoPurOrder");

            entity.Property(e => e.BookBankName)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.BookBankNo)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.DueDate).HasColumnType("datetime");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.Mpodate)
                .HasColumnType("datetime")
                .HasColumnName("MPODate");
            entity.Property(e => e.Mpono)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("MPONo");
            entity.Property(e => e.OrderAmt).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.Remark)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.SupTaxId)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.SupplAddres1)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.SupplId)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.SupplName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.SupplRemark)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.SupplTel)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<MomoPurOrderItem>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("MomoPurOrderItem");

            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.ItemDesc).HasMaxLength(150);
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.Lrcvdate)
                .HasColumnType("datetime")
                .HasColumnName("LRCVDate");
            entity.Property(e => e.Lrcvno)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("LRCVNo");
            entity.Property(e => e.Mpoamount)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("MPOamount");
            entity.Property(e => e.Mpodate)
                .HasColumnType("datetime")
                .HasColumnName("MPODate");
            entity.Property(e => e.Mpono)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("MPONo");
            entity.Property(e => e.Mpoprice)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("MPOprice");
            entity.Property(e => e.Mpoqty)
                .HasColumnType("decimal(8, 2)")
                .HasColumnName("MPOqty");
            entity.Property(e => e.Mpostatus).HasColumnName("MPOstatus");
            entity.Property(e => e.PluCode).HasMaxLength(20);
            entity.Property(e => e.PurUnit).HasMaxLength(15);
            entity.Property(e => e.SkuCode).HasMaxLength(20);
            entity.Property(e => e.Srcvqty)
                .HasColumnType("decimal(8, 2)")
                .HasColumnName("SRCVqty");
            entity.Property(e => e.StkUnit).HasMaxLength(15);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<MpOrder>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("mpOrder");

            entity.Property(e => e.BillPoint).HasMaxLength(25);
            entity.Property(e => e.CashierId).HasMaxLength(5);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.CustId)
                .HasMaxLength(20)
                .HasColumnName("custId");
            entity.Property(e => e.GuestId)
                .HasMaxLength(5)
                .HasColumnName("guestId");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.OrderNo).HasMaxLength(16);
            entity.Property(e => e.Salesman).HasMaxLength(50);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<MpOrderDt>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("mpOrderDt");

            entity.Property(e => e.ApproveNote).HasMaxLength(50);
            entity.Property(e => e.ApproveOn).HasColumnType("datetime");
            entity.Property(e => e.CheckIn).HasColumnType("datetime");
            entity.Property(e => e.CheckOut).HasColumnType("datetime");
            entity.Property(e => e.CheckOutPoint).HasMaxLength(25);
            entity.Property(e => e.ChrgAmt).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.ChrgPc).HasColumnType("decimal(6, 2)");
            entity.Property(e => e.CouponNo).HasMaxLength(30);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.CustId)
                .HasMaxLength(20)
                .HasColumnName("custId");
            entity.Property(e => e.DiscAmt).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.DiscPc).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.EntryDesc).HasMaxLength(50);
            entity.Property(e => e.EntryPoint).HasMaxLength(25);
            entity.Property(e => e.ExPrice).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.GuestId)
                .HasMaxLength(5)
                .HasColumnName("guestId");
            entity.Property(e => e.HouseHost).HasMaxLength(30);
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.OrderNo).HasMaxLength(16);
            entity.Property(e => e.PromoId).HasMaxLength(50);
            entity.Property(e => e.ServicesPrice).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.Times).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
            entity.Property(e => e.VechicleNo).HasMaxLength(20);
        });

        modelBuilder.Entity<MpViledgeCustomer>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("mpViledgeCustomer");

            entity.Property(e => e.ApplyShopId).HasMaxLength(5);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.CustAccumPoint)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("custAccumPoint");
            entity.Property(e => e.CustAddress)
                .HasMaxLength(80)
                .HasColumnName("custAddress");
            entity.Property(e => e.CustAmphur)
                .HasMaxLength(40)
                .HasColumnName("custAmphur");
            entity.Property(e => e.CustApplyDate)
                .HasColumnType("datetime")
                .HasColumnName("custApplyDate");
            entity.Property(e => e.CustBirthDay)
                .HasColumnType("datetime")
                .HasColumnName("custBirthDay");
            entity.Property(e => e.CustCardStatus).HasColumnName("custCardStatus");
            entity.Property(e => e.CustCardType)
                .HasMaxLength(10)
                .HasColumnName("custCardType");
            entity.Property(e => e.CustEmail)
                .HasMaxLength(40)
                .HasColumnName("custEmail");
            entity.Property(e => e.CustExpireDate)
                .HasColumnType("datetime")
                .HasColumnName("custExpireDate");
            entity.Property(e => e.CustExpirePointDate)
                .HasColumnType("datetime")
                .HasColumnName("custExpirePointDate");
            entity.Property(e => e.CustGender)
                .HasMaxLength(1)
                .HasColumnName("custGender");
            entity.Property(e => e.CustId)
                .HasMaxLength(20)
                .HasColumnName("custId");
            entity.Property(e => e.CustLineAddr1)
                .HasMaxLength(50)
                .HasColumnName("custLineAddr1");
            entity.Property(e => e.CustLineAddr2)
                .HasMaxLength(80)
                .HasColumnName("custLineAddr2");
            entity.Property(e => e.CustLineAddr3)
                .HasMaxLength(40)
                .HasColumnName("custLineAddr3");
            entity.Property(e => e.CustMemo)
                .HasMaxLength(60)
                .HasColumnName("custMemo");
            entity.Property(e => e.CustNameE)
                .HasMaxLength(50)
                .HasColumnName("custNameE");
            entity.Property(e => e.CustNameT)
                .HasMaxLength(50)
                .HasColumnName("custNameT");
            entity.Property(e => e.CustNation)
                .HasMaxLength(30)
                .HasColumnName("custNation");
            entity.Property(e => e.CustNearlyExpirePoint)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("custNearlyExpirePoint");
            entity.Property(e => e.CustOccupation)
                .HasMaxLength(30)
                .HasColumnName("custOccupation");
            entity.Property(e => e.CustPhoto)
                .HasMaxLength(100)
                .HasColumnName("custPhoto");
            entity.Property(e => e.CustPid)
                .HasMaxLength(15)
                .HasColumnName("custPid");
            entity.Property(e => e.CustProvince)
                .HasMaxLength(40)
                .HasColumnName("custProvince");
            entity.Property(e => e.CustRace)
                .HasMaxLength(30)
                .HasColumnName("custRace");
            entity.Property(e => e.CustTelNo)
                .HasMaxLength(30)
                .HasColumnName("custTelNo");
            entity.Property(e => e.CustTucustol)
                .HasMaxLength(40)
                .HasColumnName("custTucustol");
            entity.Property(e => e.CustType)
                .HasMaxLength(5)
                .HasColumnName("custType");
            entity.Property(e => e.CustZipCode)
                .HasMaxLength(15)
                .HasColumnName("custZipCode");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.PrjName).HasMaxLength(80);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<MpViledgeGuest>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("mpViledgeGuest");

            entity.Property(e => e.BranchName).HasMaxLength(80);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.CustId)
                .HasMaxLength(20)
                .HasColumnName("custId");
            entity.Property(e => e.GuestAddress)
                .HasMaxLength(150)
                .HasColumnName("guestAddress");
            entity.Property(e => e.GuestGroupId)
                .HasMaxLength(4)
                .HasColumnName("guestGroupId");
            entity.Property(e => e.GuestId)
                .HasMaxLength(5)
                .HasColumnName("guestId");
            entity.Property(e => e.GuestName)
                .HasMaxLength(40)
                .HasColumnName("guestName");
            entity.Property(e => e.GuestRegAddressLine1)
                .HasMaxLength(100)
                .HasColumnName("guestRegAddressLine1");
            entity.Property(e => e.GuestRegAddressLine2)
                .HasMaxLength(100)
                .HasColumnName("guestRegAddressLine2");
            entity.Property(e => e.GuestRegAddressLine3)
                .HasMaxLength(100)
                .HasColumnName("guestRegAddressLine3");
            entity.Property(e => e.GuestRegId)
                .HasMaxLength(20)
                .HasColumnName("guestRegId");
            entity.Property(e => e.GuestRegName)
                .HasMaxLength(80)
                .HasColumnName("guestRegName");
            entity.Property(e => e.GuestRegType).HasColumnName("guestRegType");
            entity.Property(e => e.GuestTaxId)
                .HasMaxLength(20)
                .HasColumnName("guestTaxId");
            entity.Property(e => e.GuestTypeId)
                .HasMaxLength(4)
                .HasColumnName("guestTypeId");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.PrjName).HasMaxLength(80);
            entity.Property(e => e.PromptPayLink).HasMaxLength(50);
            entity.Property(e => e.QrcodeAccount)
                .HasMaxLength(50)
                .HasColumnName("QRCodeAccount");
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<MpVilledge>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("mpVilledge");

            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.PrjName).HasMaxLength(80);
            entity.Property(e => e.PrjProcessMode).HasMaxLength(1);
            entity.Property(e => e.PrjScreenType).HasMaxLength(2);
            entity.Property(e => e.PromptPayLink).HasMaxLength(50);
            entity.Property(e => e.PrrjAddress).HasMaxLength(150);
            entity.Property(e => e.PrrjRegAddressLine1).HasMaxLength(100);
            entity.Property(e => e.PrrjRegAddressLine2).HasMaxLength(100);
            entity.Property(e => e.PrrjRegAddressLine3).HasMaxLength(100);
            entity.Property(e => e.PrrjRegId).HasMaxLength(20);
            entity.Property(e => e.PrrjRegName).HasMaxLength(80);
            entity.Property(e => e.PrrjTaxId).HasMaxLength(20);
            entity.Property(e => e.QrcodeAccount)
                .HasMaxLength(50)
                .HasColumnName("QRCodeAccount");
            entity.Property(e => e.RecptFootMesg1).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg10).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg2).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg3).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg4).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg5).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg6).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg7).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg8).HasMaxLength(80);
            entity.Property(e => e.RecptFootMesg9).HasMaxLength(80);
            entity.Property(e => e.RecptHeadMesg1).HasMaxLength(80);
            entity.Property(e => e.RecptHeadMesg2).HasMaxLength(80);
            entity.Property(e => e.RecptHeadMesg3).HasMaxLength(80);
            entity.Property(e => e.RecptHeadMesg4).HasMaxLength(80);
            entity.Property(e => e.RecptHeadMesg5).HasMaxLength(80);
            entity.Property(e => e.RecptHeadMesg6).HasMaxLength(80);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
            entity.Property(e => e.VilledgeName).HasMaxLength(40);
        });

        modelBuilder.Entity<OutstBySupply>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("OutstBySupply");

            entity.Property(e => e.Mpoqty)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("MPOQty");
            entity.Property(e => e.PurUnit)
                .HasMaxLength(15)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.PurUnitRatio).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.RcvPurQty)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("rcvPurQty");
            entity.Property(e => e.SkuCode)
                .HasMaxLength(20)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.SkuDesc)
                .HasMaxLength(150)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.StkUnit)
                .HasMaxLength(15)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.SupplId)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<OutstBySupplyPo>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("OutstBySupply_po");

            entity.Property(e => e.Free)
                .HasMaxLength(20)
                .HasColumnName("free");
            entity.Property(e => e.Mpodate)
                .HasColumnType("datetime")
                .HasColumnName("MPODate");
            entity.Property(e => e.Mpono)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("MPONo");
            entity.Property(e => e.Mpoqty)
                .HasColumnType("decimal(8, 2)")
                .HasColumnName("MPOqty");
            entity.Property(e => e.Remark)
                .HasMaxLength(200)
                .HasColumnName("remark");
            entity.Property(e => e.SkuCode).HasMaxLength(20);
            entity.Property(e => e.SupplId)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<OutstBySupplyRcv>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("OutstBySupply_rcv");

            entity.Property(e => e.DocDate).HasColumnType("datetime");
            entity.Property(e => e.DocNo)
                .HasMaxLength(20)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.RcvPurQty)
                .HasColumnType("decimal(9, 2)")
                .HasColumnName("rcvPurQty");
            entity.Property(e => e.SkuCode)
                .HasMaxLength(20)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.SupplId)
                .HasMaxLength(60)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.TranDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<PrdtDn>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("PRDtDn");

            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.DnQty)
                .HasColumnType("decimal(7, 2)")
                .HasColumnName("DN_Qty");
            entity.Property(e => e.DnitemNo).HasColumnName("DNItemNo");
            entity.Property(e => e.DueDate).HasColumnType("datetime");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.OrderDate).HasColumnType("datetime");
            entity.Property(e => e.OrderNo)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.PritemNo).HasColumnName("PRItemNo");
            entity.Property(e => e.PurSelUnitRatio).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.PurUnit).HasMaxLength(15);
            entity.Property(e => e.ShopId).HasMaxLength(5);
            entity.Property(e => e.ShopName).HasMaxLength(40);
            entity.Property(e => e.SkuCode).HasMaxLength(20);
            entity.Property(e => e.SupplId)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<PrqryDtFormula>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("PRQryDtFormula");

            entity.Property(e => e.DeliveNote)
                .HasMaxLength(200)
                .HasColumnName("deliveNote");
            entity.Property(e => e.Goal)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("goal");
            entity.Property(e => e.LastPurPrice).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.Mpodate)
                .HasColumnType("datetime")
                .HasColumnName("MPODate");
            entity.Property(e => e.Mpono)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("MPONo");
            entity.Property(e => e.PlanQty)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("planQty");
            entity.Property(e => e.Plans)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("plans");
            entity.Property(e => e.PluCode).HasMaxLength(20);
            entity.Property(e => e.PurSelUnitRatio).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.QryId).ValueGeneratedOnAdd();
            entity.Property(e => e.ReqQty)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("reqQty");
            entity.Property(e => e.Salesamount)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("salesamount");
            entity.Property(e => e.SkuCode).HasMaxLength(20);
        });

        modelBuilder.Entity<PrqryDtFormula2>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("PRQryDtFormula2");

            entity.Property(e => e.DeliveNote)
                .HasMaxLength(200)
                .HasColumnName("deliveNote");
            entity.Property(e => e.Goal)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("goal");
            entity.Property(e => e.LastPurPrice).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.Mpodate)
                .HasColumnType("datetime")
                .HasColumnName("MPODate");
            entity.Property(e => e.Mpono)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("MPONo");
            entity.Property(e => e.PlanQty)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("planQty");
            entity.Property(e => e.Plans)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("plans");
            entity.Property(e => e.PluCode).HasMaxLength(20);
            entity.Property(e => e.PurSelUnitRatio).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.ReqQty)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("reqQty");
            entity.Property(e => e.Salesamount)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("salesamount");
            entity.Property(e => e.SkuCode).HasMaxLength(20);
        });

        modelBuilder.Entity<PsMember>(entity =>
        {
            entity.HasKey(e => new { e.Id, e.MbId });

            entity.ToTable("psMember");

            entity.HasIndex(e => e.MbId, "uniqMbId").IsUnique();

            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.MbId).HasMaxLength(20);
            entity.Property(e => e.ApplyShopId).HasMaxLength(5);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.MbAccumPoint).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.MbAddress).HasMaxLength(80);
            entity.Property(e => e.MbAmphur).HasMaxLength(40);
            entity.Property(e => e.MbApplyDate).HasColumnType("datetime");
            entity.Property(e => e.MbBirthDay).HasColumnType("datetime");
            entity.Property(e => e.MbCardType).HasMaxLength(10);
            entity.Property(e => e.MbEmail).HasMaxLength(40);
            entity.Property(e => e.MbExpireDate).HasColumnType("datetime");
            entity.Property(e => e.MbExpirePointDate).HasColumnType("datetime");
            entity.Property(e => e.MbGender).HasMaxLength(1);
            entity.Property(e => e.MbLineAddr1).HasMaxLength(50);
            entity.Property(e => e.MbLineAddr2).HasMaxLength(80);
            entity.Property(e => e.MbLineAddr3).HasMaxLength(40);
            entity.Property(e => e.MbMemo).HasMaxLength(60);
            entity.Property(e => e.MbNameE).HasMaxLength(50);
            entity.Property(e => e.MbNameT).HasMaxLength(50);
            entity.Property(e => e.MbNation).HasMaxLength(30);
            entity.Property(e => e.MbNearlyExpirePoint).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.MbOccupation).HasMaxLength(30);
            entity.Property(e => e.MbPhoto).HasMaxLength(100);
            entity.Property(e => e.MbPid).HasMaxLength(15);
            entity.Property(e => e.MbProvince).HasMaxLength(40);
            entity.Property(e => e.MbRace).HasMaxLength(30);
            entity.Property(e => e.MbTelNo).HasMaxLength(30);
            entity.Property(e => e.MbTumbol).HasMaxLength(40);
            entity.Property(e => e.MbType).HasMaxLength(5);
            entity.Property(e => e.MbZipCode).HasMaxLength(15);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<PsOrder>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("psOrder");

            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateCashierId).HasMaxLength(5);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.CreatePosId).HasMaxLength(5);
            entity.Property(e => e.CreateShopId).HasMaxLength(5);
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.MbId).HasMaxLength(20);
            entity.Property(e => e.OrderNo).HasMaxLength(30);
            entity.Property(e => e.SaleBy).HasMaxLength(100);
            entity.Property(e => e.SaleCashierId).HasMaxLength(5);
            entity.Property(e => e.SaleDate).HasColumnType("datetime");
            entity.Property(e => e.SalePosId).HasMaxLength(5);
            entity.Property(e => e.SaleShopId).HasMaxLength(5);
            entity.Property(e => e.SalesmanId).HasMaxLength(5);
            entity.Property(e => e.ShopId).HasMaxLength(5);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
            entity.Property(e => e.UpdateCashierId).HasMaxLength(5);
            entity.Property(e => e.UpdatePosId).HasMaxLength(5);
            entity.Property(e => e.UpdateShopId).HasMaxLength(5);
        });

        modelBuilder.Entity<PsOrderDt>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("psOrderDt");

            entity.Property(e => e.ChrgAmt).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.ChrgPc).HasColumnType("decimal(6, 2)");
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.DiscAmt).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.DiscCouponNo).HasMaxLength(30);
            entity.Property(e => e.DiscCouponType).HasMaxLength(10);
            entity.Property(e => e.DiscPc).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.ExPrice).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.ItemDesc).HasMaxLength(50);
            entity.Property(e => e.ItemVatType).HasMaxLength(1);
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.LineItemType).HasMaxLength(2);
            entity.Property(e => e.OrderNo).HasMaxLength(30);
            entity.Property(e => e.PluCode).HasMaxLength(20);
            entity.Property(e => e.PromoId).HasMaxLength(50);
            entity.Property(e => e.Qty).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.SerialNo).HasMaxLength(30);
            entity.Property(e => e.UnitPrice).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<PsShop>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("psShop");

            entity.Property(e => e.BranchName).HasMaxLength(80);
            entity.Property(e => e.BranchTaxCode).HasMaxLength(5);
            entity.Property(e => e.CreateBy).HasMaxLength(100);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.ErpChannel)
                .HasMaxLength(2)
                .HasColumnName("ERP_Channel");
            entity.Property(e => e.ErpStore)
                .HasMaxLength(5)
                .HasColumnName("ERP_Store");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.PromptPayLink).HasMaxLength(20);
            entity.Property(e => e.QrcodeAccount)
                .HasMaxLength(20)
                .HasColumnName("QRCodeAccount");
            entity.Property(e => e.ShopAddress).HasMaxLength(150);
            entity.Property(e => e.ShopGroupId).HasMaxLength(4);
            entity.Property(e => e.ShopId).HasMaxLength(5);
            entity.Property(e => e.ShopName).HasMaxLength(40);
            entity.Property(e => e.ShopRegAddressLine1).HasMaxLength(100);
            entity.Property(e => e.ShopRegAddressLine2).HasMaxLength(100);
            entity.Property(e => e.ShopRegAddressLine3).HasMaxLength(100);
            entity.Property(e => e.ShopRegId).HasMaxLength(20);
            entity.Property(e => e.ShopRegName).HasMaxLength(80);
            entity.Property(e => e.ShopTaxId).HasMaxLength(20);
            entity.Property(e => e.ShopTypeId).HasMaxLength(4);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<Qrydash>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("QRYdash");

            entity.Property(e => e.DashTitle).HasMaxLength(100);
            entity.Property(e => e.DateStart).HasColumnType("datetime");
            entity.Property(e => e.DateToday).HasColumnType("datetime");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.OfYyyymm)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ofYYYYMM");
            entity.Property(e => e.PoOsvalues)
                .HasColumnType("decimal(15, 2)")
                .HasColumnName("PoOSValues");
            entity.Property(e => e.PoOsvolumn)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("PoOSVolumn");
            entity.Property(e => e.SalesValues).HasColumnType("decimal(15, 2)");
            entity.Property(e => e.SalesVolumn).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.StkX180values)
                .HasColumnType("decimal(15, 2)")
                .HasColumnName("StkX180Values");
            entity.Property(e => e.StkX180volumn)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("StkX180Volumn");
            entity.Property(e => e.StkX30values)
                .HasColumnType("decimal(15, 2)")
                .HasColumnName("StkX30Values");
            entity.Property(e => e.StkX30volumn)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("StkX30Volumn");
            entity.Property(e => e.StkX7values)
                .HasColumnType("decimal(15, 2)")
                .HasColumnName("StkX7Values");
            entity.Property(e => e.StkX7volumn)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("StkX7Volumn");
            entity.Property(e => e.StkXvalues)
                .HasColumnType("decimal(15, 2)")
                .HasColumnName("StkXValues");
            entity.Property(e => e.StkXvolumn)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("StkXVolumn");
            entity.Property(e => e.StockValues).HasColumnType("decimal(15, 2)");
            entity.Property(e => e.StockVolumn).HasColumnType("decimal(11, 2)");
        });

        modelBuilder.Entity<QrydataDetail>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("QRYdataDetail");

            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.Selected).HasColumnName("selected");
            entity.Property(e => e.SumQty).HasColumnType("decimal(9, 2)");
        });

        modelBuilder.Entity<Qrydatum>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("QRYdata");

            entity.Property(e => e.DateBegin).HasColumnType("datetime");
            entity.Property(e => e.DateEnd).HasColumnType("datetime");
            entity.Property(e => e.Goal).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.Menu).HasMaxLength(20);
            entity.Property(e => e.Plan).HasColumnType("decimal(5, 2)");
        });

        modelBuilder.Entity<SumSalesByQryId>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("SumSalesByQryId");

            entity.Property(e => e.Branch).HasColumnName("branch");
            entity.Property(e => e.SalValues).HasColumnType("decimal(38, 2)");
            entity.Property(e => e.SalVolumn).HasColumnType("decimal(38, 2)");
        });

        modelBuilder.Entity<SumSalesByQryIdBySku>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("SumSalesByQryIdBySku");

            entity.Property(e => e.SalValues).HasColumnType("decimal(38, 2)");
            entity.Property(e => e.SalVolumn).HasColumnType("decimal(38, 2)");
            entity.Property(e => e.SkuCode).HasMaxLength(25);
        });

        modelBuilder.Entity<SumStkNow>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("SumStkNow");

            entity.Property(e => e.SumStkValues)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("sumStkValues");
            entity.Property(e => e.SumStkVolum)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("sumStkVolum");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.DisplayName).HasMaxLength(100);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.InsertDate).HasColumnType("datetime");
            entity.Property(e => e.LastDirectoryUpdate).HasColumnType("datetime");
            entity.Property(e => e.MobilePhoneNumber).HasMaxLength(20);
            entity.Property(e => e.PasswordHash).HasMaxLength(86);
            entity.Property(e => e.PasswordSalt).HasMaxLength(10);
            entity.Property(e => e.ShopId).HasMaxLength(5);
            entity.Property(e => e.Source).HasMaxLength(4);
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
            entity.Property(e => e.UserId).ValueGeneratedOnAdd();
            entity.Property(e => e.UserImage).HasMaxLength(100);
            entity.Property(e => e.Username).HasMaxLength(100);
        });

        modelBuilder.Entity<VSumPosSalesByLastQryId>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("V_SumPosSalesByLastQryId");

            entity.Property(e => e.LastPurPrice).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.PurUnit)
                .HasMaxLength(15)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.PurUnitRatio).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.QtyOnhandInPur).HasColumnType("decimal(23, 11)");
            entity.Property(e => e.ReqQtyInPur)
                .HasColumnType("decimal(38, 13)")
                .HasColumnName("reqQtyInPur");
            entity.Property(e => e.ReqQtyInSku)
                .HasColumnType("decimal(38, 4)")
                .HasColumnName("reqQtyInSKU");
            entity.Property(e => e.Salesamount)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("salesamount");
            entity.Property(e => e.SkuCode)
                .HasMaxLength(20)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.SkuDesc)
                .HasMaxLength(150)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.StkUnit)
                .HasMaxLength(15)
                .UseCollation("Thai_CS_AI");
            entity.Property(e => e.StockCostValue).HasColumnType("decimal(14, 2)");
            entity.Property(e => e.SumPrice)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("sumPrice");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
