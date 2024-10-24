using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace moreApi.Model;

public partial class MomoMngContext : DbContext
{
    public MomoMngContext(IConfiguration configuration)
    {
        Configuration = configuration;
    }
    public IConfiguration Configuration { get; }

    public MomoMngContext(DbContextOptions<MomoMngContext> options)
        : base(options)
    {
        IServiceCollection services;
    }

    public MomoMngContext()
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


    public virtual DbSet<GpSalesSumByPluFormula> GpSalesSumByPluFormulas { get; set; }
    public virtual DbSet<FgExpRcvExpInfoBy> FgExpRcvExpInfoBys { get; set; }
    public virtual DbSet<MomoRPoItem> MomoRPoItems { get; set; }
    
    public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; }
    public virtual DbSet<MPOfollwup> MPOfollwups { get; set; }

    public virtual DbSet<ReceiveBySupList> ReceiveBySupLists { get; set; }
    public virtual DbSet<SumReceiveBySup> SumReceiveBySups { get; set; }
    public virtual DbSet<DashBoardInfo> DashBoardInfos { get; set; }
    public virtual DbSet<POFbyPo> POFbyPos { get; set; }
    public virtual DbSet<POFbyRcv> POFbyRcvs { get; set; }
    public virtual DbSet<POFbySup> POFbySups { get; set; }

    public virtual DbSet<Lup_sku> Lup_skus { get; set; }
    public virtual DbSet<Lup_supp> Lup_supps { get; set; }
    public virtual DbSet<Lup_mpo> Lup_mpos { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("Thai_100_CS_AI");
        //--POF
        modelBuilder.Entity<Lup_sku>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        modelBuilder.Entity<Lup_supp>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        modelBuilder.Entity<Lup_mpo>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });

        modelBuilder.Entity<POFbySup>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        modelBuilder.Entity<POFbyRcv>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        modelBuilder.Entity<POFbyPo>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        //---

        modelBuilder.Entity<DashBoardInfo>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        modelBuilder.Entity<ReceiveBySupList>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        modelBuilder.Entity<SumReceiveBySup>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });

        modelBuilder.Entity<MPOfollwup>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        modelBuilder.Entity<PurchaseOrder>(entity =>
        {
            entity
                .HasNoKey();
            //.ToTable("MomoRPoItem");
        });
        modelBuilder.Entity<MomoRPoItem>(entity =>
        {
            entity
                .HasNoKey();
                //.ToTable("MomoRPoItem");
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
            entity.Property(e => e.SkuCode)
                .IsRequired()
                .HasMaxLength(20);
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

            entity.Property(e => e.BarCode)
                .IsRequired()
                .HasMaxLength(50);
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
            entity.Property(e => e.PluCode)
                .IsRequired()
                .HasMaxLength(20);
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
            entity.Property(e => e.SkuCode)
                .IsRequired()
                .HasMaxLength(20);
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
            entity.Property(e => e.CreateBy)
                .IsRequired()
                .HasMaxLength(100);
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
            entity.Property(e => e.SupplId)
                .IsRequired()
                .HasMaxLength(20);
            entity.Property(e => e.SupplName).HasMaxLength(80);
            entity.Property(e => e.UpdateBy).HasMaxLength(100);
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
          
            entity.Property(e => e.Menu)
                .IsRequired()
                .HasMaxLength(20);
            entity.Property(e => e.Plan).HasColumnType("decimal(5, 2)");
           
        });
        modelBuilder.Entity<GpSalesSumByPluFormula>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("GpSalesSumByPluFormula");


        });
     
        modelBuilder.Entity<FgExpRcvExpInfoBy>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("FgExpRcvExpInfoBy");


        });
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
