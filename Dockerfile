FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine

ARG PROJECT
ARG UID
ARG GID

RUN set -ex; \
	# dpkg --add-architecture i386; \
	apk update; \
	apk add \ 
	p7zip \
	curl \
	freetype \
	ncurses \
	wine

RUN set -eux; \
	# mkdir /home/wine; \
	addgroup -g ${GID} wine; \
	adduser --gecos "" --disabled-password -u ${UID} -G wine -s /bin/sh wine

ENV DISPLAY=:0
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

USER wine
WORKDIR /home/wine

RUN set -eux; \
	dotnet tool install --global dotnet-mgfxc --version 3.8.0.1641

RUN set -eux; \
	# mgcb-editor --register; \
	wget -qO- https://raw.githubusercontent.com/MonoGame/MonoGame/develop/Tools/MonoGame.Effect.Compiler/mgfxc_wine_setup.sh | sh

ENV DOTNET_ROOT /usr/share/dotnet
ENV MSBuildSDKsPath '$DOTNET_ROOT/sdk/$(/usr/bin/dotnet --version)/Sdks'
ENV PATH ${PATH}:${DOTNET_ROOT}:/home/wine/.dotnet/tools
ENV MGFXC_WINE_PATH /home/wine/.winemonogame
ENV PROJECT ${PROJECT:-Game}

COPY --chown=wine:wine ./ /home/wine
VOLUME /home/wine/${PROJECT}/Content/Effects

WORKDIR /home/wine/${PROJECT}

CMD ["/bin/sh", "/home/wine/start.sh"]