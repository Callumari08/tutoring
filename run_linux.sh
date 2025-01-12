set -e
git pull
docker-compose -f docker-compose.yml up --build
echo "Running Image!"
docker run -it -p 25565:25565 -v "$(pwd)/home:/home/james" tutoring-tutoring
