# Pre-Sales and Sales Pipeline Dashboard

## Requirements:  

> To install and run this application you will need

* Python 3.5+
* git (only to clone this repository)

## Installing

> The commands below set everything up to run the application

```
    python3 -m venv venv
    . venv/bin/activate
    (venv) pip install -r requirements.txt
```

> To run the application go to the src folder and  simply run

```
    (venv) python audiodash.py
```

## Deployment  using Docker Container 
 
> To get running docker file with details

```
sudo docker ps
```
> To replace container_id with running container_id
```
sudo docker rm -f container_id
```
> To build application
```
sudo docker build -t dash demo .
```
> To run docker builded file to port 8060 and 8060
```
sudo docker run -d --restart unless-stopped -p 8060:8060 --name dash dashdemo
```

