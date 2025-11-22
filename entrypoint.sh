#!/usr/bin/env bash
set -e

: "${NETFLOW_COLLECTOR:?Need NETFLOW_COLLECTOR like 10.0.0.5:2055}"
: "${NETFLOW_IFACE:=eth0}"
: "${NETFLOW_VERSION:=9}"

echo "Starting softflowd..."
echo "  Collector: ${NETFLOW_COLLECTOR}"
echo "  Interface: ${NETFLOW_IFACE}"
echo "  NetFlow v: ${NETFLOW_VERSION}"
echo "  Extra opts: ${NETFLOW_OPTIONS}"

exec softflowd \
  -i "${NETFLOW_IFACE}" \
  -n "${NETFLOW_COLLECTOR}" \
  -v "${NETFLOW_VERSION}" \
  ${NETFLOW_OPTIONS}
