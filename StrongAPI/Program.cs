using MySqlConnector;
using Microsoft.AspNetCore.Mvc;
using StrongAPI.Models;
using StrongAPI.Repositories;

var builder = WebApplication.CreateBuilder(args);
var apiKey = builder.Configuration["StrongConnectionInfo:ApiKey"];

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddMySqlDataSource(builder.Configuration["StrongConnectionInfo:ConnectionString"]!);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

/* Http mapping for Users */
app.MapPost($"/api/{apiKey}/user/", async ([FromServices] MySqlDataSource db, [FromBody] User body) =>
{
    var repository = new UserRepository(db);
    await repository.InsertUser(body);
    return Results.Ok(body);
});

/* Http mapping for Routines */
app.MapPost($"/api/{apiKey}/routine/", async ([FromServices] MySqlDataSource db, [FromBody] Routine body) =>
{
    var repository = new RoutineRepository(db);
    await repository.InsertRoutine(body);
    return Results.Ok(body);
});

app.Run();
