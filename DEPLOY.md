# How to deploy

0. Install Docker
0. Install docker-compose with `pip install docker-compose`
0. Raise the ulimit of open files
0. `docker-compose up`
0. Copy the top-hosts-alexa file on the instance (?)
0. Load the DB with the top Alexa (maybe prepare a special request?) from the file
0. Launch the worker
