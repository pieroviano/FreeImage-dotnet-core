mklink /j Packages ..\WhenTheVersion\Packages
del ..\WhenTheVersion\Packages\FreeImage-dotnet-core.*
rmdir /s /q %userprofile%\.nuget\Packages\FreeImage-dotnet-core
nuget restore FreeImage-dotnet-core.sln
MSBuild.exe FreeImage-dotnet-core.sln /property:Configuration=Debug 
copy "FreeImage-dotnet-core\bin\Debug\FreeImage-dotnet-core.4.3.7.nupkg" ..\WhenTheVersion\Packages\
copy "FreeImage-dotnet-core\bin\Debug\FreeImage-dotnet-core.4.3.7.symbols.nupkg" ..\WhenTheVersion\Packages\
git add -A
git commit -a --allow-empty-message -m ''
git push
