# -bookshelf
Hobby project 

## Prototype Under development

### Using Windows 10 and Visual Studio 2019

1. Using the IDE =  Visual Studio 2019
2. Using C#.NET for the prototype - Form-Based.
3. Projekt = Bookshelf.csproj

### github-account
https://github.com/Inkimar/Bookshelf (private-repository for now, ask to join!)

## MySQL Database 8

- Localhost; using user 'root' ; psw = <>
- database=bookshelf -> 'Dump Structure and Data'
- database-dump is stored in https://github.com/Inkimar/Bookshelf

### MySQL Workbench 8.0.21 

1. Main-menu 'Server' 
2. menu 'Data Export

#### export
https://dev.mysql.com/doc/workbench/en/wb-admin-export-import-management.html 

#### MySQL Utilities Console)

### App.config (Config-file, Connection String)

```
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
	<configSections>
	</configSections>
	<connectionStrings>
  <add	name="Bookshelf.Properties.Settings.Setting" 
		connectionString="server=localhost;user id=root;password=<localpassword>;persistsecurityinfo=True;database=bookshelf"
		providerName="MySql.Data.MySqlClient" />
 </connectionStrings>
    <startup> 
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.8" />
    </startup>
</configuration>
```

