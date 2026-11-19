#!/usr/bin/env bash
set -euo pipefail

# 版本号唯一来源为 pubspec.yaml 的 version 字段（如 2026.11.19+15）
version_line=$(grep -E '^version:' pubspec.yaml | head -1)
version_name=$(echo "$version_line" | sed -E 's/^version:[[:space:]]*//; s/[[:space:]]+$//')
build_number=${version_name##*+}
version_name=${version_name%%+*}
if [[ "$build_number" == "$version_name" ]]; then
  build_number=1
fi

echo "VERSION=$version_name"
echo "BUILD_NUMBER=$build_number"
echo "IOS_VERSION=$version_name"
