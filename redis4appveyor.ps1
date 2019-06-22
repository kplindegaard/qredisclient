Add-Type -assembly "system.io.compression.filesystem"
$source="https://github.com/MicrosoftArchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.zip"
$destination="$pwd/redisarchive.zip"
$installdir="$pwd/redis-3.2.100"
Invoke-WebRequest $source -OutFile $destination
[IO.Compression.ZipFile]::ExtractToDirectory($destination, $installdir)

echo $pwd
dir

cd $installdir
.\redis-server.exe --service-install
.\redis-server.exe --service-start
cd ..
