# Logstash with Consul Template
============================

A Consul Template powered Logstash docker container.

## Supported Tags:
* `5.2-0.18.0`, `latest` - logstash v5.2 with consul template version 0.18.0 ([5.2-0.18.0/Dockerfile](https://github.com/stakater/dockerfile-logstash-with-consul-template/blob/master/5.2/Dockerfile))
* `2.3-0.18.0` - logstash v2.3 with consul template version 0.18.0 ([2.3-0.18.0/Dockerfile](https://github.com/stakater/dockerfile-logstash-with-consul-template/blob/master/2.3/Dockerfile))

`docker run stakater/logstash-with-consul-template:latest`

To specify templates:
`docker run -d -v $(PWD)/templates:/templates stakater/logstash-with-consul-template:latest`

This image is intended to be run together with Consul and Consul-Template

The daemon consul-template queries a Consul instance and updates any number of specified templates on the file system. As an added bonus, consul-template can optionally run arbitrary commands when the update process completes.

```
consul-template -consul=$CONSUL_URL -template="/templates/logstash.ctmpl:/etc/logstash/conf.d/logstash.conf"
```
## Sample Template 
We have provided a sample template (in the `templates` directory).

To be able to use that template, you must make sure the following preconditions are met: 

### Preconditions

#### Consul Key-Value entries:
* Port for receiving "beats" should be defined by the key `/logstash/beatsPort`
* Grok pattern for logs of type `syslog` should be defined in the key `/logstash/syslogPattern`.
* Default Grok pattern for applications without specific grok pattern should be defined by the key `/logstash/defaultPattern`.
* Grok pattern (if any) for a specific application should be defined by the key `/logstash/apps/<app_name>/grokPattern`.
* Multiline pattern (if any) for a specific application should be defined by the key `/logstash/apps/<app_name>/multilinePattern`.

#### Grok Pattern:
* Time in the logs should be parsed and assigned to the key `timestamp`.
* If using specific grok/multiline patterns for applications, logs must contain application name. The application name should be parsed and assigned to the key `app_name`.