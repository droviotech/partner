import sys
import tempfile
from pathlib import Path

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools" / "openapi"))
import filter_spec  # noqa: E402


def test_only_partner_paths_kept():
    spec = {
        "openapi": "3.0.0",
        "paths": {
            "/partner/auth/login": {
                "post": {
                    "requestBody": {
                        "content": {
                            "application/json": {
                                "schema": {"$ref": "#/components/schemas/Token"}
                            }
                        }
                    },
                    "responses": {"200": {"$ref": "#/components/responses/R"}},
                }
            },
            "/admin/auth/login": {"post": {}},
        },
        "components": {
            "schemas": {"Token": {"type": "string"}, "Unused": {"type": "string"}},
            "responses": {"R": {"description": "ok"}},
        },
    }
    with tempfile.TemporaryDirectory() as tmp:
        inp = Path(tmp) / "in.yaml"
        out = Path(tmp) / "out.yaml"
        inp.write_text(yaml.safe_dump(spec), encoding="utf-8")
        filter_spec.main([str(inp), str(out)])
        result = yaml.safe_load(out.read_text(encoding="utf-8"))
    assert list(result["paths"]) == ["/partner/auth/login"]
    assert "Token" in result["components"]["schemas"]
    assert "Unused" not in result["components"]["schemas"]


def test_no_matching_path_keeps_all_schemas_as_transition():
    spec = {
        "openapi": "3.0.0",
        "paths": {"/admin/auth/login": {"post": {}}},
        "components": {"schemas": {"Token": {"type": "string"}}},
    }
    with tempfile.TemporaryDirectory() as tmp:
        inp = Path(tmp) / "in.yaml"
        out = Path(tmp) / "out.yaml"
        inp.write_text(yaml.safe_dump(spec), encoding="utf-8")
        filter_spec.main([str(inp), str(out)])
        result = yaml.safe_load(out.read_text(encoding="utf-8"))
    assert result["paths"] == {}
    assert "Token" in result["components"]["schemas"]


if __name__ == "__main__":
    import pytest

    raise SystemExit(pytest.main([__file__, "-v"]))
