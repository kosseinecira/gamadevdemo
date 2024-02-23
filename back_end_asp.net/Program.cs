using Microsoft.EntityFrameworkCore;
using back_end_ASP.Controllers;
using MySql.EntityFrameworkCore.Extensions;
using back_end_ASP.Data;
using System.Text.Json.Serialization;
using back_end_ASP.DAO.MessageDAO;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddDbContext<ClickMeContext>(options => 
options.UseMySQL("server=localhost;database=clickme;user=root;password=root"));
builder.Services.AddScoped<IMessageDAO, MessageDAOImpl>();
//builder.Services.AddScoped<ITranslationDAO, TranslationImpl>();

//builder.Services.AddDbContext<ClickMeContext>(options => options.UseInMemoryDatabase("clickme"));
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddMvc()
                .AddJsonOptions(x => x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);
var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}



app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();