# Docker ESGI

First clone the repo, then copy paste .env.example files into .env files :
```bash
cp ./app1/.env.example ./app1/.env
cp ./app2/.env.example ./app2/.env
```

Once this is setup, you can launch the containers :
```bash
docker compose up --build -d
```

The apps will be launched but they will not work directly, you first have to make all the setup (install dependencies, generate keys...), this can me made automatically with:

### Make
```
make install
```

### Bash script
```bash
chmod 777 ./setup.sh
./setup.sh
```

Once everything is setup, you can now access the apps in `http://127.0.0.1/` and `http://127.0.0.1:81`

In addition to that, you can also have access to a web interface for mysql (PhpMyAdmin) in `http://127.0.0.1:8080` and also a web interface to monitor all the containers (Portainer) in `https://127.0.0.1:9443`
