#!/bin/bash

../letsencrypt.sh/letsencrypt.sh -c -t dns-01 -k ../letsencrypt.sh-hooks/hooks/route53.rb
../copy-certs.sh ../letsencrypt.sh/domains.txt