# TLS Archiver

## Build and run

    make
    docker-compose up

## DevOps

Do not go into the `devops` folder, it's such a mess...

## Peformance TODOs

* PostgreSQL has a default of **200 concurrent connections**
* Do we actually need to make 200 connections? Maybe we can group the results into one batch?
* The host system may limit the **number of open files**: edit the `/etc/security/limits.conf` file (cf https://easyengine.io/tutorials/linux/increase-open-files-limit/) => allows to go up to ~10000 workers, but the DB doesn't support it...
* The **TCP timeout** if huge! Reduce it with a custom Dialer!
* Can we reduce the time a connection stays as TIME_WAIT? Maybe this saturates something...
