#!/bin/bash

# We just start the logstash service and then leave consul-template running on the foreground.
# Here we use the CONSUL_URL environment variable that we defined before. Consul template
# expects to find a logstash.ctmpl file in /templates. This is the template that we would
# mount as a volume from our host. The result is then placed in /etc/logstash/conf.d/logstash.conf
# where logstash will be able to read from.
# Logstash is run with `-r` flag which reloads logstash if config is changed, consul only updates
# the configuration file and Logstash itself reads it.
# Note: & added so that logstash runs in a separate process and consul-template runs in this process
logstash -f /etc/logstash/conf.d/logstash.conf -r &
consul-template -consul=$CONSUL_URL -template="/templates/logstash.ctmpl:/etc/logstash/conf.d/logstash.conf"