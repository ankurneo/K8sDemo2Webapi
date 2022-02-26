#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM microsoft/aspnetcore:2.0 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0 AS build
WORKDIR /src
COPY ["CoreApiAdoDemo/CoreApiAdoDemo.csproj", "CoreApiAdoDemo/"]
RUN dotnet restore "CoreApiAdoDemo/CoreApiAdoDemo.csproj"
COPY . .
WORKDIR "/src/CoreApiAdoDemo"
RUN dotnet build "CoreApiAdoDemo.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CoreApiAdoDemo.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CoreApiAdoDemo.dll"]