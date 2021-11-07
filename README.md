# About This Image

1. Modernized fork of [jeyk/docker-icinga](https://github.com/jeyk/docker-icinga) (archived [here](https://github.com/viranch/docker-icinga-archived))
1. Based on ubuntu:bionic
1. No Postfix
1. No rsyslogd
1. No database. IDO is not configured.

# How To Use This Image

Start the Icinga container.

```
docker run -dt ghcr.io/viranch/icinga
```

# Volumes

This container exposes these volumes:

```
/etc/icinga       --> Icinga configuration files
/var/cache/icinga --> Icinga state retention and cache files
/var/log/icinga   --> Log files.
```

# Setting passwords

There are no users defined, so you have to set a password before you can log into Icinga's web interface:


```
htpasswd -c /path/to/volume/htpasswd.users icingaadmin
```


