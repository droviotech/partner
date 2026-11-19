#!/usr/bin/env python3
"""按项目前缀过滤 OpenAPI，并传递保留被引用到的共享 Schema。"""

import argparse
import sys

import yaml


def find_refs(node):
    if isinstance(node, dict):
        if "$ref" in node:
            yield node["$ref"]
        for value in node.values():
            yield from find_refs(value)
    elif isinstance(node, list):
        for item in node:
            yield from find_refs(item)


def collect_schemas(schema_map, refs):
    resolved = set()
    stack = list(refs)
    while stack:
        ref = stack.pop()
        name = ref.split("/")[-1]
        if name in resolved or name not in schema_map:
            continue
        resolved.add(name)
        stack.extend(find_refs(schema_map[name]))
    return resolved


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("input")
    parser.add_argument("output")
    parser.add_argument("--prefix", default="/partner/", help="保留的路径前缀，如 /partner/")
    args = parser.parse_args(argv)

    with open(args.input, encoding="utf-8") as f:
        spec = yaml.safe_load(f)

    paths = {
        path: item
        for path, item in (spec.get("paths") or {}).items()
        if path.startswith(args.prefix)
    }

    refs = set()
    for path_item in paths.values():
        for operation in path_item.values():
            if not isinstance(operation, dict):
                continue
            refs.update(find_refs(operation))
            for response in (operation.get("responses") or {}).values():
                refs.update(find_refs(response))

    schemas = spec.get("components", {}).get("schemas", {}) or {}
    if not paths:
        # 过渡策略：当前快照没有 /partner/ 路径时保留全部 Schema，
        # 保证生成器输出可用；后端补充 /partner/ 后自动切换为引用过滤。
        keep = set(schemas.keys())
        print("WARNING: no paths match prefix, keeping all schemas", file=sys.stderr)
    else:
        keep = collect_schemas(schemas, refs)

    filtered = dict(spec)
    filtered["paths"] = paths
    if "components" in spec:
        filtered["components"] = dict(spec["components"])
        filtered["components"]["schemas"] = {
            name: schema for name, schema in schemas.items() if name in keep
        }
        if not filtered["components"]["schemas"]:
            del filtered["components"]["schemas"]
        if not filtered["components"]:
            del filtered["components"]

    with open(args.output, "w", encoding="utf-8") as f:
        yaml.safe_dump(filtered, f, allow_unicode=True, sort_keys=False)

    print(f"paths={len(paths)} schemas={len(keep)} -> {args.output}")


if __name__ == "__main__":
    main()
