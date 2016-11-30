#!/bin/bash

# We just start the logstash service and then leave consul-template running on the foreground.
# Here we use the CONSUL_URL environment variable that we defined before. Consul template
# expects to find a logstash.ctmpl file in /templates. This is the template that we would
# mount as a volume from our host. The result is then placed in /config-dir/logstash.conf
# where logstash will be able to read from.
# Note -r (automatic reload) command argument is given so there's no need to reload logstash
logstash -f /config-dir -r
consul-template -consul=$CONSUL_URL -template="/templates/logstash.ctmpl:/config-dir/logstash.conf"