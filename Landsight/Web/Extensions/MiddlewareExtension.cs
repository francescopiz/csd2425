using Landsight.Application.Factories;
using Microsoft.AspNetCore.Diagnostics;
using System.Net;

namespace Landsight.Web.Extensions
{
    public static class MiddlewareExtension
    {
        public static WebApplication? AddWebMiddleware(this WebApplication? app)
        {
            app.UseSwagger();
            app.UseSwaggerUI();
            app.UseHttpsRedirection();
            app.UseExceptionHandler(appError =>
            {
                appError.Run(async context =>
                {
                    context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    context.Response.ContentType = "application/json";
                    var contextFeature = context.Features.Get<IExceptionHandlerFeature>();
                    if (contextFeature != null)
                    {
                        var res = ResponseFactory.WithError(contextFeature.Error);
                        await context.Response.WriteAsJsonAsync(res);
                    }
                });
            });
            app.MapControllers();
            return app;
        }
    }
}
