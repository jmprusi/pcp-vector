#!/bin/sh

/usr/libexec/pcp/bin/pmcd -A
/usr/libexec/pcp/bin/pmwebd -S -M 5 -4 -p "${PCP_PORT}" & 

cd /opt/vector
exec python -m SimpleHTTPServer "${VECTOR_PORT}"
