using FluentValidation;
using FluentValidation.AspNetCore;
using Landsight.Application.Abstractions.Services;
using Landsight.Application.Services;
using Microsoft.Extensions.DependencyInjection;

namespace Landsight.Application.Extensions
{
    public static class ServiceExtension
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services)
        {
            services.AddFluentValidationAutoValidation();
            services.AddValidatorsFromAssembly(
                typeof(ServiceExtension).Assembly);
            services.AddScoped<IPoiService, PoiService>();
            services.AddScoped<IMediaFileService, MediaFileService>();
            return services;
        }
    }
}
