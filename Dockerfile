
#FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
#FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ./BlazorApp5AddDocker.sln ./
COPY ./BlazorApp5AddDocker/BlazorApp5AddDocker.csproj ./BlazorApp5AddDocker/
COPY ./Testing/Testing.csproj ./Testing/
RUN dotnet restore
COPY . .
RUN dotnet test ./Testing/Testing.csproj
RUN dotnet publish ./BlazorApp5AddDocker/BlazorApp5AddDocker.csproj -c Release -o /app/

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final
WORKDIR /app
COPY --from=build /app .
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "BlazorApp5AddDocker.dll"]


#docker build -t webapp:1.0.2 .