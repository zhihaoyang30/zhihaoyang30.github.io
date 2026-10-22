#!/usr/bin/env bash
# Stop the local homepage preview started by run.sh.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
PIDFILE="$ROOT/.server.pid"

if [ ! -f "$PIDFILE" ]; then
  echo "Homepage preview is not running."
  exit 0
fi

PID="$(cat "$PIDFILE")"
if ! kill -0 "$PID" 2>/dev/null; then
  rm -f "$PIDFILE"
  echo "Removed stale pid file."
  exit 0
fi

CMD="$(ps -p "$PID" -o args= 2>/dev/null || true)"
if [[ "$CMD" != *"http.server"* ]]; then
  echo "Refusing to stop pid $PID: it is not the homepage preview server."
  exit 1
fi

kill "$PID"
for _ in 1 2 3 4 5 6 7 8 9 10; do
  if ! kill -0 "$PID" 2>/dev/null; then
    rm -f "$PIDFILE"
    echo "Stopped homepage preview (pid=$PID)."
    exit 0
  fi
  sleep 0.2
done

kill -9 "$PID" 2>/dev/null || true
rm -f "$PIDFILE"
echo "Force-stopped homepage preview (pid=$PID)."
