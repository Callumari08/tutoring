@echo off
REM Enable error handling
setlocal EnableDelayedExpansion

git pull

docker-compose -f docker-compose.yml up --build
IF ERRORLEVEL 1 (
    echo "Error occurred during docker-compose up"
    exit /b 1
)

echo "Running Image!"

docker run -it -p 25565:25565 -v "%cd%\home:/home/james" tutoring-tutoring
IF ERRORLEVEL 1 (
    echo "Error occurred during docker run"
    exit /b 1
)

