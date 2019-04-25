REM Packing build into archive

SET OpenShotFilesPath=%ProgramFiles(x86)%
IF NOT DEFINED ProgramFiles(x86) SET OpenShotFilesPath=%ProgramFiles%

echo %OpenShotFilesPath%
REM Went to installation folder
cd "%OpenShotFilesPath%\libopenshot-audio"
REM Pack all but ".gitignore"
7z a -t7z libopenshot-audio-win-%PLATFORM%.7z * -xr!.gitignore

dir
