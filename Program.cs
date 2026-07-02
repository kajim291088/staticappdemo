var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Tell ASP.NET Core to look for index.html by default
app.UseDefaultFiles();   // enables default file mapping (index.html, default.html, etc.)
app.UseStaticFiles();    // serves files from wwwroot

app.Run();
