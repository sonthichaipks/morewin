using Microsoft.Extensions.FileProviders;
using Microsoft.OpenApi.Models;
using System.Reflection;

namespace moreApi
{
    public class Program
    {
        private static bool IsOriginAllowed(string origin)
        {
            var uri = new Uri(origin);
            var env = System.Environment.GetEnvironmentVariable("AdminSafeList") ?? "n/a";

            var isAllowed = uri.Host.Equals("127.0.0.1", StringComparison.OrdinalIgnoreCase)
                            //|| uri.Host.Equals("localhost", StringComparison.OrdinalIgnoreCase)
                            || uri.Host.StartsWith("192.168.1.", StringComparison.OrdinalIgnoreCase)
                            || uri.Host.StartsWith("202.44.229.", StringComparison.OrdinalIgnoreCase)
                            || uri.Host.StartsWith("10.1.1.", StringComparison.OrdinalIgnoreCase);
            if (!isAllowed && env.Contains("DEV", StringComparison.OrdinalIgnoreCase))
                isAllowed = uri.Host.Equals("localhost", StringComparison.OrdinalIgnoreCase);

            return isAllowed;
        }
        public static void Main(string[] args)
        {
            var MoreApiPolicy = "morePolicy";
            var builder = WebApplication.CreateBuilder(args);

            builder.Services.AddCors(options =>
            {
                options.AddPolicy(name: MoreApiPolicy,
                                  policy =>
                                  {
                                      policy.SetIsOriginAllowed(IsOriginAllowed)
                                     
                                        .AllowAnyHeader()
                                        .AllowAnyMethod();
                                  });
            });

        //    public static void Main(string[] args)
        //{
        //    var builder = WebApplication.CreateBuilder(args);

          

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();


            builder.Services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "momoWS", Version = "GPVW001" });
            });
            builder.Services.AddControllers();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {

                app.UseStaticFiles(new StaticFileOptions()
                {
                    FileProvider = new PhysicalFileProvider(
                    Path.Combine(Directory.GetCurrentDirectory(), "Content")),
                    RequestPath = "/Content"
                });
                app.UseSwaggerUI(setupAction =>
                {
                    setupAction.InjectStylesheet("/Content/swagger-mycustom.css");

                });
                app.UseSwagger();
                app.UseSwaggerUI();
                app.UseHttpsRedirection();
                app.UseAuthorization();
                app.MapControllers();

                app.Run();
            }
            else
            {
                //            app.UseStaticFiles(new StaticFileOptions()
                //            {
                //                FileProvider = new PhysicalFileProvider(
                //               Path.Combine(Directory.GetCurrentDirectory(), "Content")),
                //                RequestPath = "/Content"
                //            });
                //            app.UseSwaggerUI(setupAction =>
                //{
                //	setupAction.InjectStylesheet("/Content/swagger-mycustom.css");

                //});
                //app.UseSwagger();
                //// Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
                //// specifying the Swagger JSON endpoint.
                //app.UseSwaggerUI(c =>
                //{
                //	c.SwaggerEndpoint("/swagger/v1/swagger.json", "UTF-16");
                //});

                //app.UseSwagger();
                //app.UseSwaggerUI();


                app.UseHttpsRedirection();
                app.UseStaticFiles();

                app.UseRouting();
                app.UseCors(e => e.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod());
                app.UseEndpoints(endpoints =>
                {
                    endpoints.MapControllers();
                });

                app.UseAuthentication();
                app.UseAuthorization();




                //app.UseSwaggerUI(c => {
                //                c.InjectStylesheet("/Content/swagger-mycustom.css");
                //                c.SwaggerEndpoint("/swagger/v1/swagger.json", "GeniuzPOS Front API");
                //            });

                app.MapControllers();

                app.Run();

            }



        }
    }
}