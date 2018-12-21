# Purpose

This repository hosts the code needed to generate the collectd JMX docker image
used mainly at Camptocamp for the geOrchestra projects.

The docker image is hosted in a
[https://hub.docker.com/r/camptocamp/jmx-collectd](private repository) in the
docker hub camptocamp organisation.

Used in a rancher catalog entry, this allows to scan the whole containers of a
rancher environment to automatically provide a prometheus entry point to gather
datas from JMX endpoints.

# build

```bash
$ docker build -t camptocamp/jmx-collectd:vx.y .
```

# Usage

See the
[https://github.com/camptocamp/rancher-catalog-georchestra/tree/master/templates/jmx-collectd](jmx-collectd)
from the rancher-catalog-georchestra entry for the usage.

# changelog

## v2.5

Added `jetty_sessions` metrics.

## v2.6 (2017-07-03)

Somehow collectd seems to segfault in some environments (ppige, geopicardie).
This version removes useless configuration files, as advised by @mfournier. The
root docker image has also been fixed to camptocamp/collectd:v0.2.3.

## v2.7 (2018-12-21)

MBeans for getting metrics on Jetty have been renamed, so we need to add a new one,
to target the newly named bean, and also keeping backward compatibility:

```
org.eclipse.jetty.server.session:context=cas,id=0,type=defaultsessioncache

  %0   - evictionPolicy (int, r)
  %1   - removeUnloadableSessions (boolean, r)
  %2   - saveOnCreate (boolean, r)
  %3   - saveOnInactiveEviction (boolean, r)
  %4   - sessionsCurrent (long, r)
  %5   - sessionsMax (long, r)
  %6   - sessionsTotal (long, r)
  %7   - state (java.lang.String, r)
  %8   - stopTimeout (long, rw)
```
