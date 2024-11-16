using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using Landsight.Model.Context;
namespace Landsight.Model.Extensions
{
    public static class ServiceExtension
    {
        public static IServiceCollection AddModelServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<LandsightContext>(conf =>
            {
                conf.UseSqlServer(configuration.GetConnectionString("LandsightContext"));
            });
            //TODO: add repositories.
            return services;
        }
    }
}
