#!/bin/bash
set -o nounset
set -o errexit
set -o pipefail
# could also use the fact that it's in /etc/hosts?
sed -e "s/ES_HOST/${ES_PORT_9300_TCP_ADDR}/g" -i /logstash.conf
/opt/logstash/bin/logstash -f /logstash.conf
