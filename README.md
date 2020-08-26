# TGC.MCompiler

Effecs compiler for MonoGame

## Getting Started

These project is a self cotained instance of dotnet, mgfxc and wine, you'll only need to setup a few variables to allow docker-compose to build and run the project. If you already have a functional instalation of docker jump to [Building](#Building) and [Running](#Running).

### Prerequisites

You only need docker and docker-compose to run this project. [Get Docker](https://www.docker.com/get-started) [Get Docker Compose](https://docs.docker.com/compose/install/)

### Building

Building with compose is easy just run the command above and the container will start listing on your project to auto compile shaders on modifications.
Since this container will be compiling and writing to disk your shaders you need to pass your user/group ID so the program can run propperly.
The easiest way is to run the command id as the example above.

```
UID=$(id -u) GID=$(id -g) docker-compose up -d --build
```

Configuration variables can be setted by adding them to the command (as shown previousy with UID) or by creating a .env file in the project location

```
# Name of the folder containing the project
# it must containa Content/Effects folder where you put your .fx files
PROJECT=Game
# Tag name used to version your container
TAG=latest
# Since these runs a wine instance you need to bind a Display to your X
DISPLAY=:0
```

End with an example of getting some data out of the system or using it for a little demo

## Running

Your project will keep running until stoped or system rebooted. To restart your project run.

From project folder

```
docker-compose start
```

From any other folder

```
docker start tgc.compiler
```

## Built With

- [Docker](http://www.docker.com) - Conteiner solution
- [Alpine](https://alpinelinux.org/) - Lightweight Linux distribution
- [Dotnet](https://dotnet.microsoft.com/) - A developer platform
- [Wine](https://winehq.org/) - Compatibility layer capable of running Windows applications

## Authors

- [**DNAngeluS**](https://github.com/dnangelus)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
