# README

## Docker Build Instructions
```
sudo docker build -t meetup .
sudo docker network create meetup
sudo docker run -d --name meetup_postgres --network=meetup --network-alias=db -e POSTGRES_PASSWORD=guest postgres
sudo docker run -it --name meetup_rails -p 3000:3000 -v $(pwd):/meetup --network=meetup meetup
cd /meetup
bundle
rails db:setup
rails t
rails s
```
