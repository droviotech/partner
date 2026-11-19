#!/usr/bin/env bash
set -euo pipefail

OPENAPI_URL="${OPENAPI_URL:-https://dev.drovio.ai/api/docs/openapi.yaml}"
PREFIX="${PREFIX:-h}"
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SNAPSHOT="$ROOT/tools/openapi/openapi.yaml"
FILTERED="$ROOT/lib/contracts/swagger/openapi.yaml"
PYTHON="${PYTHON:-}"
if [ -z "$PYTHON" ] && [ -x "$ROOT/tools/openapi/.venv/bin/python" ]; then
  PYTHON="$ROOT/tools/openapi/.venv/bin/python"
else
  PYTHON="${PYTHON:-python3}"
fi

echo "下载 $OPENAPI_URL"
curl -fsSL "$OPENAPI_URL" -o "$SNAPSHOT"

echo "按前缀 /$PREFIX/ 过滤（保留引用到的共享 Schema）"
mkdir -p "$(dirname "$FILTERED")"
"$PYTHON" "$ROOT/tools/openapi/filter_spec.py" "$SNAPSHOT" "$FILTERED" --prefix "/$PREFIX/"

echo "生成 Dart 代码（swagger_dart_code_generator）"
cd "$ROOT"
dart run tools/openapi/generate.dart

echo "完成：$FILTERED -> lib/contracts/generated"
