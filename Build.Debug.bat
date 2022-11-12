mklink /j Packages ..\WhenTheVersion\Packages
del ..\WhenTheVersion\Packages\PdfCompressorLibrary.*
rmdir /s /q %userprofile%\.nuget\Packages\PdfCompressorLibrary
nuget restore PdfCompressorLibrary.sln
MSBuild.exe PdfCompressorLibrary.sln /property:Configuration=Debug 
copy "PdfCompressorLibrary\bin\Debug\PdfCompressorLibrary.1.0.0.nupkg" ..\WhenTheVersion\Packages\
copy "PdfCompressorLibrary\bin\Debug\PdfCompressorLibrary.1.0.0.symbols.nupkg" ..\WhenTheVersion\Packages\
git add -A
git commit -a --allow-empty-message -m ''
git push
