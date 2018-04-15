#!/bin/sh

# Start unitd
/opt/unit/sbin/unitd --control unix:/var/run/control.unit.sock --modules /opt/unit/build

# Add config
curl -X PUT -d @/config.json --unix-socket /run/control.unit.sock http://localhost/

# Tail logs
tail -f /var/log/unitd.log
