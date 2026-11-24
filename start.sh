#!/usr/bin/env bash
cd "$(dirname "$0")"
echo "预览地址： http://localhost:8080"
command -v python3 >/dev/null && (open http://localhost:8080 2>/dev/null || xdg-open http://localhost:8080 2>/dev/null); python3 -m http.server 8080
