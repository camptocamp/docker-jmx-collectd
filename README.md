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
$ docker build -t camptocamp/jmx-collectd:vx.y
```

# Usage

See the
[https://github.com/camptocamp/rancher-catalog-georchestra/tree/master/templates/jmx-collectd](jmx-collectd)
from the rancher-catalog-georchestra entry for the usage.

# changelog

## v2.5

Added `jetty_sessions` metrics.

