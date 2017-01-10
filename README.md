# dockerfile-logstash-with-consul-template
============================

A Consul Template powered Logstash docker container.

## Supported Tags:
`0.16.0` - with consul template version 0.16.0
`0.18.0-rc1`, `latest` - with consul template version 0.18.0-rc1


`docker run stakater/logstash-with-consul-template:latest`

This image is intended to be run together with Consul and Consul-Template

The daemon consul-template queries a Consul instance and updates any number of specified templates on the file system. As an added bonus, consul-template can optionally run arbitrary commands when the update process completes.

```
 consul-template -consul=$CONSUL_URL -template="/templates/logstash.ctmpl:/config-dir/logstash.conf:logstash -f /config-dir/logstash.conf -r"
```
