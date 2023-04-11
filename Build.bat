mklink /j Packages ..\WhenTheVersion\Packages
IF NOT DEFINED Configuration SET Configuration=Release
MSBuild.exe FreeImage-dotnet-core.sln -t:clean
MSBuild.exe FreeImage-dotnet-core.sln -t:restore -p:RestorePackagesConfig=true
MSBuild.exe FreeImage-dotnet-core.sln -m /property:Configuration=%Configuration%
git add -A
git commit -a --allow-empty-message -m ''
git push
