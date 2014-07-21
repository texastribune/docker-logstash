#!/bin/bash
set -o nounset
set -o errexit
set -o pipefail

/opt/logstash/bin/logstash -f /logstash.conf
