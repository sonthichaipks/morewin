using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace moreApi.Model;

public partial class MomoMng2Context : DbContext
{
    public MomoMng2Context(IConfiguration configuration)
    {
        Configuration = configuration;
    }
    public IConfiguration Configuration { get; }

    public MomoMng2Context(DbContextOptions<MomoMng2Context> options)
        : base(options)
    {
        IServiceCollection services;
    }

    public MomoMng2Context()
    {
    }


    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            String cons = Configuration.GetConnectionString("MomoMngConnection");

            optionsBuilder.UseSqlServer(cons);
        }
    }

    public virtual DbSet<MmPrdt> MmPrdts { get; set; }

    public virtual DbSet<MmProduct> MmProducts { get; set; }

    public virtual DbSet<MmSupplier> MmSuppliers { get; set; }

    public virtual DbSet<MomoPurOrder> MomoPurOrders { get; set; }

    public virtual DbSet<MomoPurOrderItem> MomoPurOrderItems { get; set; }

    public virtual DbSet<PrdtDn> PrdtDns { get; set; }

    public virtual DbSet<PrqryDtFormula> PrqryDtFormulas { get; set; }

    public virtual DbSet<QrydataDetail> QrydataDetails { get; set; }

    public virtual DbSet<Qrydatum> Qrydata { get; set; }

//    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//        => optionsBuilder.UseSqlServer("Server=127.0.0.1;Database=MomoMng;User=sa;Password=more5599;MultipleActiveResultSets=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("Thai_100_CS_AI");

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
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.BookBankNo)
                .HasMaxLength(20)
                .IsUnicode(false);
            //entity.Property(e => e.CreateBy).HasMaxLength(100);
            //entity.Property(e => e.CreateDate).HasColumnType("datetime");
           // entity.Property(e => e.DueDate).HasColumnType("datetime");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            //entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            entity.Property(e => e.Mpodate)
              //  .HasColumnType("datetime")
                .HasColumnName("MPODate");
            entity.Property(e => e.Mpono)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("MPONo");
            entity.Property(e => e.OrderStatus);
             //   .HasMaxLength(1)
              //  .IsUnicode(false);
            entity.Property(e => e.Remark)
                .HasMaxLength(80)
                .IsUnicode(false);
            //entity.Property(e => e.SupTaxId)
            //    .HasMaxLength(20)
            //    .IsUnicode(false);
            //entity.Property(e => e.SupplAddres1)
            //    .HasMaxLength(100)
            //    .IsUnicode(false);
            entity.Property(e => e.SupplId)
                .HasMaxLength(30)
                .IsUnicode(false);
            //entity.Property(e => e.SupplName)
            //    .HasMaxLength(100)
            //    .IsUnicode(false);
            //entity.Property(e => e.SupplRemark)
            //    .HasMaxLength(100)
            //    .IsUnicode(false);
            //entity.Property(e => e.SupplTel)
            //    .HasMaxLength(100)
            //    .IsUnicode(false);
            //entity.Property(e => e.UpdateBy).HasMaxLength(100);
        });

        modelBuilder.Entity<MomoPurOrderItem>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("MomoPurOrderItem");

            //entity.Property(e => e.CreateBy).HasMaxLength(100);
            //entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.ItemDesc).HasMaxLength(150);
            //entity.Property(e => e.LastUpdate).HasColumnType("datetime");
            //entity.Property(e => e.Lrcvdate)
            //    .HasColumnType("datetime")
            //    .HasColumnName("LRCVDate");
            //entity.Property(e => e.Lrcvno)
            //    .HasMaxLength(30)
            //    .IsUnicode(false)
            //    .HasColumnName("LRCVNo");
            entity.Property(e => e.Mpoamount)
                .HasColumnType("decimal(11, 2)")
                .HasColumnName("MPOamount");
            //entity.Property(e => e.Mpodate)
            //    .HasColumnType("datetime")
            //    .HasColumnName("MPODate");
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
            //entity.Property(e => e.Srcvqty)
            //    .HasColumnType("decimal(8, 2)")
            //    .HasColumnName("SRCVqty");
            entity.Property(e => e.StkUnit).HasMaxLength(15);
            //entity.Property(e => e.UpdateBy).HasMaxLength(100);
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
            //entity.Property(e => e.Mpodate)
            //    .HasColumnType("datetime")
            //    .HasColumnName("MPODate");
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

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
