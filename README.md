# README

This is a basic API to conntect to a Database via REST API

If you want to combine the split DOCKER IMAGE files to generate the single file, you can do it as,
```
cat file.gz.part* > file.gz
```
To set up Docker Conatiner you can use

```
sudo docker run -d -it \
    --name tv_api \
    --volume=/VOLUME/ON/YOUR/MACHINE:/srv/tv_api \
    -p 3000:3000 \
    ju/tv_api_ubuntu
```

Pull the repo with

```
git pull https://github.com/uhraya/tv_api.git

```

To call the Api, start the rails server.

The APi responds via
```
<URL>:<PORT>/api/programms
```
This returns all Programms. You can filter by Channel, Show Type, Date, Start Time and End Time
```
?channel=
?showtype=
?date=
?time_from=
?time_to=
```
You can use any number of these to filter your Programm
