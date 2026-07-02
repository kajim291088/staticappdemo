# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project files
COPY . .

# Restore and publish the app
RUN dotnet restore
RUN dotnet publish -c Release -o /app

# Use the smaller runtime image for final container
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app .

# Expose port 80
EXPOSE 80

# Run the app
ENTRYPOINT ["dotnet", "StaticAppDemo.dll"]
