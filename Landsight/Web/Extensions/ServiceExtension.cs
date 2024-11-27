using Landsight.Web.Results;
using Microsoft.OpenApi.Models;

namespace Landsight.Web.Extensions
{
    public static class ServiceExtension
    {
        public static IServiceCollection AddWebServices(this IServiceCollection services)
        {
            services.AddControllers()
                .ConfigureApiBehaviorOptions(options =>
                {
                    options.InvalidModelStateResponseFactory = context =>
                    {
                        return new BadRequestResultFactory(context);
                    };
                });
            services.AddEndpointsApiExplorer();
            return services;
        }

        public static IServiceCollection AddSwaggerServices(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo()
                {
                    Title = "Landsight API",
                    Version = "v1",
                    Description = "API for Landsight"
                });
            });
            return services;
        }
    }
}
