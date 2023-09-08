FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS build
WORKDIR /
COPY ["/MytraModel/MytraModel.csproj", "/MytraModel/"]
COPY ["/MytraRepository/MytraRepository.csproj", "/MytraRepository/"]
COPY ["/MytraApp/MytraApp.csproj", "/MytraApp/"]
RUN dotnet restore "/MytraApp/MytraApp.csproj"
COPY . .
WORKDIR "/MytraApp"

FROM build AS publish

RUN dotnet publish "MytraApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MytraApp.dll"]