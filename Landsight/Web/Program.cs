using Landsight.Application.Extensions;
using Landsight.Web.Extensions;
using Landsight.Model.Extensions;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services
    .AddWebServices()
    .AddSwaggerServices()
    .AddModelServices(builder.Configuration)
    .AddApplicationServices();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.AddWebMiddleware();
app.Run();
