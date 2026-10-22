#!/usr/bin/env bash
# Start a local static preview of the homepage.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
PORT="${PORT:-8765}"
PIDFILE="$ROOT/.server.pid"
LOGFILE="$ROOT/.server.log"
HOST="${HOST:-127.0.0.1}"

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required to preview this static site."
  exit 1
fi

if [ -f "$PIDFILE" ]; then
  OLD_PID="$(cat "$PIDFILE")"
  if kill -0 "$OLD_PID" 2>/dev/null; then
    echo "Homepage preview is already running (pid=$OLD_PID)."
    echo "Open http://${HOST}:${PORT}/"
    echo "Log: $LOGFILE"
    exit 0
  fi
  rm -f "$PIDFILE"
fi

if command -v lsof >/dev/null 2>&1 && lsof -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
  echo "Port $PORT is already in use by another process. Set PORT=xxxx and retry."
  exit 1
fi

cd "$ROOT"
# nohup keeps the preview alive after the launching shell exits.
nohup python3 -m http.server "$PORT" --bind "$HOST" >"$LOGFILE" 2>&1 &
SERVER_PID=$!
echo "$SERVER_PID" > "$PIDFILE"
disown "$SERVER_PID" 2>/dev/null || true

echo "Started homepage preview (pid=$(cat "$PIDFILE"))."
echo "Open http://${HOST}:${PORT}/"
echo "Log: $LOGFILE"
echo "Stop with: ./stop.sh"
