#!/bin/sh

echo "Listening on ${PROJECT}/Content/Effects"
MSBuildSDKsPath=$DOTNET_ROOT/sdk/$(/usr/bin/dotnet --version)/Sdks DOTNET_ROOT=/usr/share/dotnet PATH=${PATH}:${DOTNET_ROOT}:/home/wine/.dotnet/tools inotifyd /home/wine/watch.sh /home/wine/$PROJECT/Content/Effects:w