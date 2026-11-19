# Flutter 基础架构 Implementation Plan（warehouse 仓管端）

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在 warehouse 仓库搭建一套完整的 Flutter 基础架构（app/core/contracts/features + 请求层 + 会话 + 路由 + 数据库 + 多语言 + 扫码推送 + OpenAPI 生成 + 构建发布），使 `core` 可以原样复制到运维端与合作方端。

**Architecture:** 单仓库单 App，不建模板仓库、不做内部包。`core` 提供可复制通用能力且不依赖 `contracts`/`features`；`contracts` 放项目接口与 DTO；`features` 放业务模块；`app` 组合启动、路由与 Shell。先在仓管端完成并验证，再复制 `core` 到 `/y/`、`/h/`。

**Tech Stack:** Flutter 3.38（本机 3.38.10）、Bloc、go_router、get_it + injectable、Drift、Dio、swagger_dart_code_generator、freezed + json_serializable、Flutter gen_l10n、firebase_messaging、mobile_scanner。

**Spec:** [docs/architecture.md](../../architecture.md)（唯一设计文档，本计划所有任务从该文档推导）

## Global Constraints

复制自架构文档，每个任务隐式包含以下约束：

- 项目前缀：仓管 `/cg/`、运维 `/y/`、合作端 `/h/`（暂定；调整只改 `ApiConfig`）。
- 依赖方向：`app → features → contracts → core/api`；`core` 不依赖 `contracts`/`features`，`contracts` 不依赖 `features`。
- 认证：Bearer token、无过期无刷新；401 视为会话失效；仓管/运维/Web 共用员工账号（本计划只做仓管）。
- 错误模型：`errs.Error {code, message, details}`，客户端统一转 `ApiException`。
- 分页：`page` 从 1 开始，`page_size` 默认 20、最大 200；响应 `{items, total}`。
- 多语言：仅 `th`、`zh-Hans`；默认跟随系统，无匹配回退 `th`；请求头固定 `Accept-Language`。
- 时间 RFC3339 转 UTC 保存、按业务时区展示；金额萨当 `cents`、水量 `ml`，均为整数 `int`。
- 版本号 `YYYY.MM.DD-<7位短哈希>`（Asia/Shanghai），构建号=提交数；签名材料不入库；环境配置用 `--dart-define-from-file` 本地文件。
- 测试是辅助：不设覆盖率门槛，测试不阻塞构建/发布/合并（CI 中 `flutter test` 使用 `continue-on-error: true`）。
- 每个功能有对应测试文件，与实现同目录（`xxx.dart` → `xxx_test.dart`）。
- Android + iOS 同时支持；无 PDA，扫码仅手机摄像头。
- 生成代码（freezed/injectable/drift/openapi）不单独写测试，由使用者测试覆盖；生成文件必须提交入库。

## File Structure（最终形态）

```text
warehouse/
  .env.local.example              # 环境覆盖文件示例（.env.local 不入库）
  build.yaml                      # injectable / swagger 生成配置
  l10n.yaml                       # gen_l10n 配置
  .github/workflows/ci.yml
  .github/workflows/release.yml
  android/keystore.properties.example
  lib/
    main.dart
    l10n/                         # app_th.arb / app_zh.arb
    app/
      bootstrap.dart
      warehouse_app.dart
      config/app_env.dart
      config/app_config.dart
      di/get_it.dart
      di/injection.dart           # 生成 injection.config.dart
      router/app_router.dart
      router/app_shell.dart
    core/
      api/
        api_config.dart
        api_client.dart
        api_exception.dart
        api_response.dart
        pagination.dart
        api_module.dart
        dio_factory.dart
        interceptors/auth_interceptor.dart
        interceptors/language_interceptor.dart
        interceptors/trace_interceptor.dart
        interceptors/error_interceptor.dart
        events/event_stream_client.dart
        upload/upload_client.dart
      auth/
        auth_token_provider.dart
        token_provider.dart
        session_events.dart
        session_store.dart
      database/
        app_database.dart
        tables.dart
        command_queue_dao.dart
        preferences_store.dart
        database_module.dart
      i18n/
        locale_provider.dart
        app_locale_provider.dart
      design/
        app_colors.dart
        app_text_styles.dart
        app_theme.dart
        widgets/primary_button.dart
      native/
        scan_gateway.dart
        push_gateway.dart
        firebase_push_gateway.dart
      observability/log.dart
      utils/device_id.dart
    contracts/
      auth/auth_api.dart
      auth/auth_repository.dart
      auth/http_auth_repository.dart
      auth/auth_models.dart
      common/notification_contracts.dart
      generated/                 # swagger_dart_code_generator 输出
    features/
      auth/presentation/login_page.dart
      auth/application/auth_cubit.dart
      auth/application/auth_state.dart
      home/presentation/home_page.dart
      scan/presentation/scan_page.dart
      messages/presentation/messages_page.dart
      messages/presentation/message_detail_page.dart
      settings/presentation/settings_page.dart
      inbound|outbound|inventory|stocktake|scrap/   # 业务目录，仅 .gitkeep
  test/
    unit/
    widget/
    integration/
  tools/
    openapi/refresh.sh
    openapi/filter_spec.py
    openapi/generate.dart
    openapi/openapi.yaml         # 契约快照（首次拉取）
    openapi/spec/openapi.yaml    # 过滤后的生成输入（swagger builder 只扫描此目录）
    version.sh
  docs/
    architecture.md
    build.md
```

空白业务目录只放 `.gitkeep`，业务任务后续填充；本计划只做基础架构。

## 任务总览

| Task | 内容 | 关键交付 |
|---|---|---|
| 1 | 工程骨架、Git、CI | flutter create、目录、ci.yml、首提交 |
| 2 | 环境与启动、DI 基础设施 | AppEnv/AppConfig、bootstrap、injection.config |
| 3 | 请求层 | ApiClient、ApiException、ApiResponse、PageRequest/PageResult |
| 4 | 拦截器与 401 | Auth/Language/Trace/Error 拦截器、SessionEvents、dio_factory |
| 5 | SSE 与上传 | EventStreamClient、UploadClient（multipart + 分片） |
| 6 | 会话与认证 | SessionStore、TokenProvider、AuthRepository、AuthCubit |
| 7 | 路由与 Shell | go_router、守卫、深链接、占位页（含 MessageDetailPage） |
| 8 | 本地数据库 | Drift 表、迁移、CommandQueueDao、PreferencesStore |
| 9 | 多语言 | gen_l10n th/zh-Hans、回退、手动切换 |
| 10 | 设计系统 | 主题、颜色、字体、PrimaryButton |
| 11 | 原生能力 | ScanGateway、PushGateway（FCM/APNs） |
| 12 | OpenAPI 生成 | refresh.sh、filter_spec.py、按 /cg/ 前缀过滤生成 |
| 13 | 构建发布 | version.sh、签名、三端配置、release CI、构建手册 |

---

### Task 1: 工程骨架、Git 与 CI

**Files:**
- Create: `pubspec.yaml`（`flutter create` 生成后保持 name=warehouse）
- Create: `lib/main.dart`（最小占位 App）
- Create: `test/widget/app_smoke_test.dart`
- Create: `.github/workflows/ci.yml`
- Create: 目录骨架（app/core/contracts/features/test/tools）
- Modify: `.gitignore`（补充本地敏感文件）

**Interfaces:**
- Consumes: 无（首个任务）
- Produces: `WarehouseApp`（StatelessWidget，MaterialApp，home 显示 "Warehouse"）；Task 2 起逐步替换。

- [ ] **Step 1: 初始化 Git 与 Flutter 工程**

```bash
cd /Users/mac/work/warehouse
git init
flutter create . --org com.drovio --project-name warehouse --platforms android,ios
```

说明：`flutter create .` 不会覆盖已有 `docs/`；生成 `pubspec.yaml` 中 `name: warehouse`。

- [ ] **Step 2: 建立目录骨架**

```bash
mkdir -p lib/app/config lib/app/di lib/app/router \
  lib/core/api/interceptors lib/core/api/events lib/core/api/upload \
  lib/core/auth lib/core/database lib/core/i18n lib/core/design/widgets \
  lib/core/native lib/core/observability lib/core/utils \
  lib/contracts/auth lib/contracts/common lib/contracts/generated \
  lib/features/auth/presentation lib/features/auth/application \
  lib/features/home/presentation lib/features/scan/presentation \
  lib/features/messages/presentation lib/features/settings/presentation \
  lib/features/inbound lib/features/outbound lib/features/inventory \
  lib/features/stocktake lib/features/scrap \
  test/unit test/widget test/integration tools/openapi
```

- [ ] **Step 3: 先写冒烟测试（应失败）**

`test/widget/app_smoke_test.dart`：

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/main.dart';

void main() {
  testWidgets('app 冒烟：渲染 Warehouse 占位页', (tester) async {
    await tester.pumpWidget(const WarehouseApp());
    expect(find.text('Warehouse'), findsOneWidget);
  });
}
```

- [ ] **Step 4: 运行测试确认失败**

```bash
flutter test test/widget/app_smoke_test.dart
```

Expected: FAIL（默认 counter 页面没有 "Warehouse"）。

- [ ] **Step 5: 实现最小 App**

`lib/main.dart`：

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const WarehouseApp());
}

class WarehouseApp extends StatelessWidget {
  const WarehouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warehouse',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(child: Text('Warehouse')),
      ),
    );
  }
}
```

- [ ] **Step 6: 测试通过并清理默认测试**

```bash
flutter test test/widget/app_smoke_test.dart
rm -f test/widget_test.dart
flutter test
```

Expected: 全部 PASS。

- [ ] **Step 7: 配置 CI**

`.github/workflows/ci.yml`：

```yaml
name: CI

on:
  push:
    branches: [master]
  pull_request:
    branches: [master]
  workflow_dispatch:

permissions:
  contents: read

concurrency:
  group: ci-${{ github.ref }}
  cancel-in-progress: false

jobs:
  checks:
    # 开发服务器 self-hosted runner；Android SDK 常驻，缺失组件由 Flutter 自动下载
    runs-on: [self-hosted, Linux, dev-drovio]
    timeout-minutes: 30
    steps:
      - uses: actions/checkout@v7.0.1
        with:
          fetch-depth: 0   # 构建号取提交数，需要完整历史
      - name: Install dependencies
        run: flutter pub get
      - name: Format check
        run: dart format --set-exit-if-changed lib test
      - name: Analyze
        run: flutter analyze --no-fatal-infos
      - name: Unit and widget tests
        run: flutter test
        continue-on-error: true   # 测试是辅助手段，不阻塞构建/发布/合并
      - name: Debug APK build
        run: flutter build apk --debug
```

- [ ] **Step 8: 本地验证 CI 关键步骤**

```bash
dart format --set-exit-if-changed lib test
flutter analyze --no-fatal-infos
flutter test
flutter build apk --debug
```

Expected: 全部通过（首次 build 会下载依赖，可能耗时数分钟）。

- [ ] **Step 9: .gitignore 补充**

在 `flutter create` 生成的 `.gitignore` 末尾追加：

```gitignore
.env.local
*.jks
*.keystore
*.p12
*.mobileprovision
google-services.json
GoogleService-Info.plist
```

- [ ] **Step 10: 提交**

```bash
git add .
git commit -m "chore: init flutter warehouse skeleton with CI"
```

---

### Task 2: 环境配置、启动流程与 DI 基础设施

**Files:**
- Create: `lib/app/config/app_env.dart`
- Create: `lib/app/config/app_config.dart`
- Create: `lib/core/api/api_config.dart`
- Create: `lib/app/di/get_it.dart`
- Create: `lib/app/di/injection.dart`（生成 `injection.config.dart`）
- Create: `lib/app/bootstrap.dart`
- Create: `build.yaml`
- Create: `.env.local.example`
- Modify: `lib/main.dart`
- Test: `test/unit/app_env_test.dart`

**Interfaces:**
- Consumes: `WarehouseApp`（Task 1）
- Produces:
  - `AppEnv.dev/staging/prod`、`AppEnv.fromName(String?)`
  - `ApiConfig(baseUrl, projectPrefix, connectTimeout, receiveTimeout)` + `resolve(path)`
  - `AppConfig(env, apiConfig)` + `fromDartDefines()`
  - `getIt`、`configureDependencies()`（后续任务继续注册服务）

- [ ] **Step 1: 添加依赖**

```bash
flutter pub add get_it injectable dio flutter_bloc
flutter pub add dev:injectable_generator dev:build_runner
```

- [ ] **Step 2: 先写 AppEnv 测试（应失败）**

`test/unit/app_env_test.dart`：

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/app/config/app_env.dart';

void main() {
  group('AppEnv', () {
    test('fromName 已知值', () {
      expect(AppEnv.fromName('dev'), AppEnv.dev);
      expect(AppEnv.fromName('staging'), AppEnv.staging);
      expect(AppEnv.fromName('prod'), AppEnv.prod);
    });

    test('fromName 未知值/空值回退 dev', () {
      expect(AppEnv.fromName('unknown'), AppEnv.dev);
      expect(AppEnv.fromName(null), AppEnv.dev);
    });

    test('默认 baseUrl', () {
      expect(AppEnv.dev.baseUrl, 'https://dev.drovio.ai/api');
    });
  });
}
```

- [ ] **Step 3: 实现 AppEnv / ApiConfig / AppConfig**

`lib/app/config/app_env.dart`：

```dart
enum AppEnv {
  dev('https://dev.drovio.ai/api'),
  staging('https://staging.drovio.ai/api'),
  prod('https://drovio.ai/api');

  const AppEnv(this.baseUrl);

  final String baseUrl;

  static AppEnv fromName(String? name) {
    return AppEnv.values.firstWhere(
      (env) => env.name == name,
      orElse: () => AppEnv.dev,
    );
  }
}
```

注意：staging/prod URL 为占位假设，正式值待后端确认；只影响本地配置，不影响架构。

`lib/core/api/api_config.dart`：

```dart
class ApiConfig {
  const ApiConfig({
    required this.baseUrl,
    this.projectPrefix = '/cg/', // 仓管端前缀（暂定）；复制到运维/合作方时改 /y/、/h/
    this.connectTimeout = const Duration(seconds: 15),
    this.receiveTimeout = const Duration(seconds: 30),
  });

  final String baseUrl;
  final String projectPrefix;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  String resolve(String path) {
    final prefix = projectPrefix.endsWith('/') ? projectPrefix : '$projectPrefix/';
    final p = path.startsWith('/') ? path.substring(1) : path;
    return '$baseUrl$prefix$p';
  }
}
```

`lib/app/config/app_config.dart`：

```dart
import 'package:warehouse/core/api/api_config.dart';
import 'app_env.dart';

class AppConfig {
  const AppConfig({required this.env, required this.apiConfig});

  final AppEnv env;
  final ApiConfig apiConfig;

  factory AppConfig.fromDartDefines() {
    const envName = String.fromEnvironment('APP_ENV');
    const baseUrl = String.fromEnvironment('API_BASE_URL');
    final env = AppEnv.fromName(envName.isEmpty ? null : envName);
    return AppConfig(
      env: env,
      apiConfig: ApiConfig(baseUrl: baseUrl.isEmpty ? env.baseUrl : baseUrl),
    );
  }
}
```

- [ ] **Step 4: DI 基础设施**

`build.yaml`：

```yaml
targets:
  $default:
    builders:
      injectable_generator:injectable:
        options:
          auto_register: true
          class_name_pattern: 'Repository|Service|Bloc|Cubit|Gateway|Client|Controller|Store|Provider|Api|Dao|Theme'
```

`lib/app/di/get_it.dart`：

```dart
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
```

`lib/app/di/injection.dart`：

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_it.dart';
import 'injection.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
```

- [ ] **Step 5: 生成并提交生成文件**

```bash
dart run build_runner build --delete-conflicting-outputs
```

生成 `lib/app/di/injection.config.dart`，必须提交入库。

- [ ] **Step 6: 启动流程**

`lib/app/bootstrap.dart`：

```dart
import 'package:flutter/widgets.dart';
import 'package:warehouse/core/api/api_config.dart';
import 'package:warehouse/app/config/app_config.dart';
import 'di/get_it.dart';
import 'di/injection.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig.fromDartDefines();
  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<ApiConfig>(appConfig.apiConfig);
  configureDependencies();
}
```

修改 `lib/main.dart`：

```dart
import 'package:flutter/material.dart';
import 'app/bootstrap.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const WarehouseApp());
}
```

（`WarehouseApp` 保持 Task 1 的占位实现，Task 7 换成 `MaterialApp.router`。）

- [ ] **Step 7: 环境文件示例**

`.env.local.example`：

```dotenv
# 复制为 .env.local 后使用（不入库）
# 用法：flutter run --dart-define-from-file=.env.local
APP_ENV=dev
# API_BASE_URL=https://dev.drovio.ai/api
```

- [ ] **Step 8: 验证**

```bash
flutter test test/unit/app_env_test.dart
dart run build_runner build --delete-conflicting-outputs
flutter analyze --no-fatal-infos
flutter test
```

Expected: 全部 PASS。

- [ ] **Step 9: 提交**

```bash
git add .
git commit -m "feat: app env, startup bootstrap and DI infrastructure"
```

---

### Task 3: 请求层（ApiClient、异常、响应、分页）

**Files:**
- Create: `lib/core/api/api_exception.dart`
- Create: `lib/core/api/api_response.dart`
- Create: `lib/core/api/pagination.dart`
- Create: `lib/core/api/api_client.dart`
- Create: `lib/core/api/api_module.dart`
- Test: `test/unit/api/pagination_test.dart`
- Test: `test/unit/api/api_client_test.dart`

**Interfaces:**
- Consumes: `ApiConfig`（Task 2）
- Produces:
  - `enum ApiErrorType { network, timeout, business, unauthorized, forbidden, server, unknown }`
  - `ApiException`（含 `isSessionExpired`、`statusCode`、`code`、`message`、`details`）
  - `typedef JsonDecoder<T> = T Function(dynamic json)`
  - `ApiResponse.decode<T>(json, decoder)`
  - `PageRequest(page, pageSize)`、`PageResult<T>(items, total)`
  - `ApiClient`（get/post/put/patch/delete，路径不含前缀，由 `ApiConfig.resolve` 拼接）

- [ ] **Step 1: 添加测试依赖**

```bash
flutter pub add dev:http_mock_adapter
```

- [ ] **Step 2: 先写分页测试（应失败）**

`test/unit/api/pagination_test.dart`：

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/core/api/pagination.dart';

void main() {
  test('PageRequest 默认值与查询参数', () {
    const request = PageRequest();
    expect(request.page, 1);
    expect(request.pageSize, 20);
    expect(request.toQueryParameters(), {'page': 1, 'page_size': 20});
  });

  test('PageRequest 翻页', () {
    const request = PageRequest(page: 2, pageSize: 50);
    expect(request.next().page, 3);
    expect(request.next().pageSize, 50);
  });

  test('PageRequest 非法参数断言', () {
    expect(() => PageRequest(page: 0), throwsAssertionError);
    expect(() => PageRequest(pageSize: 201), throwsAssertionError);
  });

  test('PageResult 解析与 hasMore', () {
    final result = PageResult.fromJson(
      {'items': [{'id': 1}, {'id': 2}], 'total': 35},
      (json) => (json as Map<String, dynamic>)['id'] as int,
    );
    expect(result.items, [1, 2]);
    expect(result.total, 35);
    expect(result.hasMore, isTrue);
  });
}
```

- [ ] **Step 3: 实现分页**

`lib/core/api/pagination.dart`：

```dart
class PageRequest {
  const PageRequest({this.page = 1, this.pageSize = 20})
      : assert(page >= 1, 'page must be >= 1'),
        assert(pageSize >= 1 && pageSize <= 200, 'pageSize must be 1..200');

  final int page;
  final int pageSize;

  Map<String, dynamic> toQueryParameters() => {'page': page, 'page_size': pageSize};

  PageRequest next() => PageRequest(page: page + 1, pageSize: pageSize);
}

class PageResult<T> {
  const PageResult({required this.items, required this.total});

  final List<T> items;
  final int total;

  factory PageResult.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) itemDecoder,
  ) {
    final items = (json['items'] as List<dynamic>? ?? const [])
        .map(itemDecoder)
        .toList(growable: false);
    return PageResult<T>(
      items: items,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );
  }

  bool get hasMore => items.length < total;
}
```

- [ ] **Step 4: 先写 ApiClient 测试（应失败）**

`test/unit/api/api_client_test.dart`：

```dart
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:warehouse/core/api/api_client.dart';
import 'package:warehouse/core/api/api_config.dart';
import 'package:warehouse/core/api/pagination.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late ApiClient client;

  setUp(() {
    dio = Dio(BaseOptions());
    adapter = DioAdapter(dio: dio);
    client = ApiClient(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/cg/',
      ),
      dio: dio,
    );
  });

  test('GET 拼接前缀并解析 Map', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/cg/health',
      (server) => server.reply(200, {'ok': true}),
    );
    final result = await client.get<Map<String, dynamic>>('health');
    expect(result, {'ok': true});
  });

  test('POST 携带 JSON body', () async {
    adapter.onPost(
      'https://dev.drovio.ai/api/cg/auth/login',
      (server) => server.reply(200, {'token': 't1'}),
      data: {'username': 'u', 'password': 'p'},
    );
    final result = await client.post<Map<String, dynamic>>(
      'auth/login',
      body: {'username': 'u', 'password': 'p'},
    );
    expect(result['token'], 't1');
  });

  test('分页查询参数与 PageResult 解码', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/cg/inventory?page=2&page_size=20',
      (server) => server.reply(200, {
        'items': [
          {'id': 1},
        ],
        'total': 35,
      }),
    );
    final result = await client.get<PageResult<Map<String, dynamic>>>(
      'inventory',
      query: const PageRequest(page: 2).toQueryParameters(),
      decode: (json) => PageResult.fromJson(
        json as Map<String, dynamic>,
        (item) => item as Map<String, dynamic>,
      ),
    );
    expect(result.total, 35);
    expect(result.items, hasLength(1));
  });
}
```

- [ ] **Step 5: 实现异常、响应解析、ApiClient**

`lib/core/api/api_exception.dart`：

```dart
enum ApiErrorType { network, timeout, business, unauthorized, forbidden, server, unknown }

class ApiException implements Exception {
  const ApiException({
    required this.type,
    this.statusCode,
    this.code,
    this.message,
    this.details,
  });

  final ApiErrorType type;
  final int? statusCode;
  final String? code;
  final String? message;
  final Map<String, dynamic>? details;

  bool get isSessionExpired => type == ApiErrorType.unauthorized;

  @override
  String toString() =>
      'ApiException($type, status=$statusCode, code=$code, message=$message)';
}
```

`lib/core/api/api_response.dart`：

```dart
import 'api_exception.dart';

typedef JsonDecoder<T> = T Function(dynamic json);

class ApiResponse<T> {
  const ApiResponse({required this.data});

  final T data;

  static T decode<T>(dynamic json, JsonDecoder<T>? decoder) {
    if (decoder != null) return decoder(json);
    if (json == null) return null as T; // 供 dynamic 无响应体场景使用
    if (T == String) return json as T;
    if (T == Map<String, dynamic>) return json as T;
    if (T == List<dynamic>) return json as T;
    throw ApiException(
      type: ApiErrorType.server,
      message: 'No decoder registered for $T',
    );
  }
}
```

`lib/core/api/api_client.dart`：

```dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_config.dart';
import 'api_response.dart';

@singleton
class ApiClient {
  ApiClient({required ApiConfig config, required Dio dio})
      : _config = config,
        _dio = dio;

  final ApiConfig _config;
  final Dio _dio;

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) =>
      _request<T>('GET', path, query: query, decode: decode);

  Future<T> post<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) =>
      _request<T>('POST', path, body: body, query: query, decode: decode);

  Future<T> put<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) =>
      _request<T>('PUT', path, body: body, query: query, decode: decode);

  Future<T> patch<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) =>
      _request<T>('PATCH', path, body: body, query: query, decode: decode);

  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) =>
      _request<T>('DELETE', path, query: query, decode: decode);

  Future<T> _request<T>(
    String method,
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) async {
    final uri = Uri.parse(_config.resolve(path)).replace(queryParameters: query);
    final Response<dynamic> response;
    switch (method) {
      case 'GET':
        response = await _dio.getUri<dynamic>(uri);
        break;
      case 'POST':
        response = await _dio.postUri<dynamic>(uri, data: body);
        break;
      case 'PUT':
        response = await _dio.putUri<dynamic>(uri, data: body);
        break;
      case 'PATCH':
        response = await _dio.patchUri<dynamic>(uri, data: body);
        break;
      case 'DELETE':
        response = await _dio.deleteUri<dynamic>(uri);
        break;
      default:
        throw UnsupportedError('Unsupported method: $method');
    }
    return ApiResponse.decode<T>(response.data, decode);
  }
}
```

`lib/core/api/api_module.dart`：

```dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_config.dart';

@module
abstract class ApiModule {
  @Named('rawDio')
  Dio provideRawDio(ApiConfig config) => Dio(
        BaseOptions(
          baseUrl: '',
          connectTimeout: config.connectTimeout,
          receiveTimeout: config.receiveTimeout,
          headers: const {'Accept': 'application/json'},
        ),
      );
}
```

注意：Task 4 会把 `rawDio` 换成 `dio_factory.dart` 组装拦截器的 Dio。

- [ ] **Step 6: 重新生成 DI 并验证**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/unit/api/pagination_test.dart test/unit/api/api_client_test.dart
flutter analyze --no-fatal-infos
```

Expected: 全部 PASS，analyze 无错误。

- [ ] **Step 7: 提交**

```bash
git add .
git commit -m "feat: core api client, exceptions, response and pagination"
```

---

### Task 4: 拦截器与 401 会话失效

**Files:**
- Create: `lib/core/auth/auth_token_provider.dart`
- Create: `lib/core/auth/session_events.dart`
- Create: `lib/core/i18n/locale_provider.dart`
- Create: `lib/core/observability/log.dart`
- Create: `lib/core/api/interceptors/auth_interceptor.dart`
- Create: `lib/core/api/interceptors/language_interceptor.dart`
- Create: `lib/core/api/interceptors/trace_interceptor.dart`
- Create: `lib/core/api/interceptors/error_interceptor.dart`
- Create: `lib/core/api/dio_factory.dart`
- Modify: `lib/core/api/api_module.dart`（改用 dio_factory）
- Test: `test/unit/api/interceptors_test.dart`

**Interfaces:**
- Consumes: `ApiConfig`、`ApiClient`（Task 3）
- Produces:
  - `AuthTokenProvider`（抽象：`accessToken()`、`clear()`）
  - `SessionEvents`（`expired` 流 + `fireSessionExpired()`）
  - `LocaleProvider`（抽象：`currentLocale`）+ `FixedLocaleProvider`
  - `createDio(config, tokenProvider, sessionEvents, localeProvider)` → 已装拦截器的 Dio

- [ ] **Step 1: 先写拦截器测试（应失败）**

`test/unit/api/interceptors_test.dart`：

```dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:warehouse/core/api/api_client.dart';
import 'package:warehouse/core/api/api_config.dart';
import 'package:warehouse/core/api/api_exception.dart';
import 'package:warehouse/core/api/dio_factory.dart';
import 'package:warehouse/core/auth/auth_token_provider.dart';
import 'package:warehouse/core/auth/session_events.dart';
import 'package:warehouse/core/i18n/locale_provider.dart';

class FakeTokenProvider implements AuthTokenProvider {
  FakeTokenProvider([this.token]);
  String? token;

  @override
  Future<String?> accessToken() async => token;

  @override
  Future<void> clear() async => token = null;
}

class FakeLocaleProvider extends FixedLocaleProvider {
  FakeLocaleProvider() : super(const Locale('th'));
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late SessionEvents sessionEvents;
  late ApiClient client;
  late FakeTokenProvider tokenProvider;

  setUp(() {
    sessionEvents = SessionEvents();
    tokenProvider = FakeTokenProvider('tok-123');
    dio = createDio(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/cg/',
      ),
      tokenProvider: tokenProvider,
      sessionEvents: sessionEvents,
      localeProvider: FakeLocaleProvider(),
    );
    adapter = DioAdapter(dio: dio);
    client = ApiClient(config: const ApiConfig(baseUrl: 'https://dev.drovio.ai/api', projectPrefix: '/cg/'), dio: dio);
  });

  test('请求携带 Bearer token 与 Accept-Language', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/cg/health',
      (server) {
        expect(server.request.headers['Authorization'], 'Bearer tok-123');
        expect(server.request.headers['Accept-Language'], 'th');
        server.reply(200, {'ok': true});
      },
    );
    await client.get<Map<String, dynamic>>('health');
  });

  test('请求携带 X-Request-ID', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/cg/health',
      (server) {
        final requestId = server.request.headers['X-Request-ID'];
        expect(requestId, isNotNull);
        expect(requestId, isNotEmpty);
        server.reply(200, {'ok': true});
      },
    );
    await client.get<Map<String, dynamic>>('health');
  });

  test('401 触发会话失效事件', () async {
    var expired = false;
    sessionEvents.expired.listen((_) => expired = true);

    adapter.onGet(
      'https://dev.drovio.ai/api/cg/health',
      (server) => server.reply(401, {'code': 'UNAUTHORIZED', 'message': '未登录'}),
    );

    await expectLater(
      client.get<Map<String, dynamic>>('health'),
      throwsA(isA<ApiException>().having(
        (e) => e.type,
        'type',
        ApiErrorType.unauthorized,
      )),
    );
    expect(expired, isTrue);
  });

  test('业务错误体映射 code/message/details', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/cg/health',
      (server) => server.reply(422, {
        'code': 'VALIDATION_ERROR',
        'message': '参数错误',
        'details': {'field': 'page_size'},
      }),
    );

    await expectLater(
      client.get<Map<String, dynamic>>('health'),
      throwsA(isA<ApiException>()
          .having((e) => e.code, 'code', 'VALIDATION_ERROR')
          .having((e) => e.details, 'details', {'field': 'page_size'})),
    );
  });

  test('网络错误映射 network', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/cg/health',
      (server) => server.throws(404, DioExceptionType.connectionError),
    );

    await expectLater(
      client.get<Map<String, dynamic>>('health'),
      throwsA(isA<ApiException>().having((e) => e.type, 'type', ApiErrorType.network)),
    );
  });
}
```

（`server.throws` 为 http_mock_adapter 提供的断网模拟；若当前版本无此方法，改用 `SocketException` 的 fake adapter，见 Step 5 说明。）

- [ ] **Step 2: 实现基础抽象**

`lib/core/auth/auth_token_provider.dart`：

```dart
abstract class AuthTokenProvider {
  Future<String?> accessToken();
  Future<void> clear();
}
```

`lib/core/auth/session_events.dart`：

```dart
import 'dart:async';
import 'package:injectable/injectable.dart';

@singleton
class SessionEvents {
  final _expiredController = StreamController<void>.broadcast();

  Stream<void> get expired => _expiredController.stream;

  void fireSessionExpired() => _expiredController.add(null);

  void dispose() => _expiredController.close();
}
```

`lib/core/i18n/locale_provider.dart`：

```dart
import 'package:flutter/widgets.dart';

abstract class LocaleProvider {
  Locale get currentLocale;
}

class FixedLocaleProvider implements LocaleProvider {
  FixedLocaleProvider(this.currentLocale);

  @override
  final Locale currentLocale;
}
```

`lib/core/observability/log.dart`：

```dart
import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

void logDebug(String message) => _log(LogLevel.debug, message);
void logInfo(String message) => _log(LogLevel.info, message);
void logWarning(String message) => _log(LogLevel.warning, message);
void logError(String message, [Object? error, StackTrace? stackTrace]) =>
    _log(LogLevel.error, message, error: error, stackTrace: stackTrace);

void _log(LogLevel level, String message,
    {Object? error, StackTrace? stackTrace}) {
  if (kReleaseMode) return;
  debugPrint('[${level.name.toUpperCase()}] $message'
      '${error == null ? '' : '\n$error'}');
  if (stackTrace != null) debugPrint(stackTrace.toString());
}
```

- [ ] **Step 3: 实现拦截器**

`lib/core/api/interceptors/auth_interceptor.dart`：

```dart
import 'package:dio/dio.dart';
import '../../auth/auth_token_provider.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor({required AuthTokenProvider tokenProvider})
      : _tokenProvider = tokenProvider,
        super();

  final AuthTokenProvider _tokenProvider;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenProvider.accessToken();
    if (token != null &&
        token.isNotEmpty &&
        !options.headers.containsKey('Authorization')) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
```

`lib/core/api/interceptors/language_interceptor.dart`：

```dart
import 'package:dio/dio.dart';
import '../../i18n/locale_provider.dart';

class LanguageInterceptor extends InterceptorsWrapper {
  LanguageInterceptor({required LocaleProvider localeProvider})
      : _localeProvider = localeProvider,
        super();

  final LocaleProvider _localeProvider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final language =
        _localeProvider.currentLocale.languageCode == 'th' ? 'th' : 'zh-Hans';
    options.headers['Accept-Language'] = language;
    handler.next(options);
  }
}
```

`lib/core/api/interceptors/trace_interceptor.dart`：

```dart
import 'dart:math';
import 'package:dio/dio.dart';
import '../../observability/log.dart';

class TraceInterceptor extends InterceptorsWrapper {
  TraceInterceptor({Random? random}) : _random = random ?? Random(), super();

  final Random _random;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Request-ID'] = _generateRequestId();
    logDebug('--> ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logDebug('<-- ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    logWarning('<-- ERROR ${error.response?.statusCode} ${error.requestOptions.uri}');
    handler.next(error);
  }

  String _generateRequestId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toRadixString(36);
    final randomPart =
        _random.nextInt(0xFFFFFF).toRadixString(16).padLeft(6, '0');
    return '$timestamp-$randomPart';
  }
}
```

`lib/core/api/interceptors/error_interceptor.dart`：

```dart
import 'package:dio/dio.dart';
import '../../auth/session_events.dart';
import '../api_exception.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  ErrorInterceptor({required SessionEvents sessionEvents})
      : _sessionEvents = sessionEvents,
        super();

  final SessionEvents _sessionEvents;

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    handler.next(_toApiException(error));
  }

  ApiException _toApiException(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;

    if (statusCode == 401) {
      _sessionEvents.fireSessionExpired();
      return ApiException(
        type: ApiErrorType.unauthorized,
        statusCode: 401,
        code: 'UNAUTHORIZED',
        message: 'session expired',
      );
    }

    if (statusCode == 403) {
      return ApiException(
        type: ApiErrorType.forbidden,
        statusCode: 403,
        code: 'FORBIDDEN',
      );
    }

    if (response != null) {
      final body = response.data;
      if (body is Map<String, dynamic>) {
        return ApiException(
          type: statusCode >= 500 ? ApiErrorType.server : ApiErrorType.business,
          statusCode: statusCode,
          code: body['code'] as String?,
          message: body['message'] as String?,
          details: body['details'] is Map<String, dynamic>
              ? body['details'] as Map<String, dynamic>
              : null,
        );
      }
      return ApiException(
        type: statusCode >= 500 ? ApiErrorType.server : ApiErrorType.business,
        statusCode: statusCode,
      );
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(type: ApiErrorType.timeout);
      case DioExceptionType.connectionError:
        return ApiException(type: ApiErrorType.network);
      default:
        return ApiException(type: ApiErrorType.unknown, message: error.message);
    }
  }
}
```

- [ ] **Step 4: 组装 Dio**

`lib/core/api/dio_factory.dart`：

```dart
import 'package:dio/dio.dart';
import '../auth/auth_token_provider.dart';
import '../auth/session_events.dart';
import '../i18n/locale_provider.dart';
import 'api_config.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/language_interceptor.dart';
import 'interceptors/trace_interceptor.dart';

Dio createDio({
  required ApiConfig config,
  required AuthTokenProvider tokenProvider,
  required SessionEvents sessionEvents,
  required LocaleProvider localeProvider,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: '',
      connectTimeout: config.connectTimeout,
      receiveTimeout: config.receiveTimeout,
      headers: const {'Accept': 'application/json'},
    ),
  );
  dio.interceptors.addAll([
    TraceInterceptor(),
    AuthInterceptor(tokenProvider: tokenProvider),
    LanguageInterceptor(localeProvider: localeProvider),
    ErrorInterceptor(sessionEvents: sessionEvents),
  ]);
  return dio;
}
```

修改 `lib/core/api/api_module.dart`：

```dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../auth/auth_token_provider.dart';
import '../auth/session_events.dart';
import '../i18n/locale_provider.dart';
import 'api_config.dart';
import 'dio_factory.dart';

@module
abstract class ApiModule {
  @Named('rawDio')
  Dio provideDio(
    ApiConfig config,
    AuthTokenProvider tokenProvider,
    SessionEvents sessionEvents,
    LocaleProvider localeProvider,
  ) =>
      createDio(
        config: config,
        tokenProvider: tokenProvider,
        sessionEvents: sessionEvents,
        localeProvider: localeProvider,
      );
}
```

（`AuthTokenProvider`/`LocaleProvider` 的具体绑定在 Task 6/9 提供；在此之前不要运行完整 `bootstrap`。）

- [ ] **Step 5: 验证**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/unit/api/interceptors_test.dart
flutter analyze --no-fatal-infos
```

Expected: 全部 PASS。若 `server.throws` 不存在，改用 `http_mock_adapter` 的 `server.reply(500)` 或对 `dio.httpClientAdapter` 注入自定义 fake 来模拟 `connectionError`，并把测试断言调整为对 `ApiErrorType.network/timeout` 的实际行为。

- [ ] **Step 6: 提交**

```bash
git add .
git commit -m "feat: api interceptors, 401 session events and dio factory"
```

---

### Task 5: SSE 事件流客户端与上传客户端

**Files:**
- Create: `lib/core/api/events/event_stream_client.dart`
- Create: `lib/core/api/upload/upload_client.dart`
- Test: `test/unit/api/event_stream_client_test.dart`
- Test: `test/unit/api/upload_client_test.dart`

**Interfaces:**
- Consumes: `Dio`（Task 4）
- Produces:
  - `SseEvent(id?, event, data)`
  - `EventStreamClient.connect(url, {headers, lastEventId, onError})` → `Stream<SseEvent>`，自动重连并携带 `Last-Event-ID`
  - `UploadClient.uploadMultipart(...)`、`UploadClient.uploadChunked(...)`（`Content-Range` + `X-Content-SHA256`，支持续传）

- [ ] **Step 1: 先写 SSE 测试（应失败）**

`test/unit/api/event_stream_client_test.dart`：

```dart
import 'dart:async';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/core/api/events/event_stream_client.dart';

void main() {
  test('SSE 解析 id/event/data 并忽略 ping', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));

    server.listen((request) {
      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType('text', 'event-stream')
        ..write('id: 1\nevent: order\n data: {"id":1}\n\n'
            ': ping\n\n'
            'id: 2\nevent: order\n data: {"id":2}\n\n');
      request.response.close();
    });

    final client = EventStreamClient();
    final events = <SseEvent>[];
    final subscription = client
        .connect('http://${server.address.address}:${server.port}/events')
        .listen(events.add);
    await Future<void>.delayed(const Duration(milliseconds: 300));
    await subscription.cancel();

    expect(events, hasLength(2));
    expect(events[0].id, '1');
    expect(events[0].event, 'order');
    expect(events[0].data, '{"id":1}');
    expect(events[1].id, '2');
  });

  test('断线重连携带 Last-Event-ID', () async {
    var firstRequest = true;
    String? lastEventId;
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));

    server.listen((request) async {
      if (firstRequest) {
        firstRequest = false;
        await request.response.close(); // 立即断开
        return;
      }
      lastEventId = request.headers.value('last-event-id');
      request.response
        ..statusCode = 200
        ..write('id: 5\nevent: order\n data: {}\n\n');
      await request.response.close();
    });

    final client = EventStreamClient();
    final events = <SseEvent>[];
    final subscription = client
        .connect(
          'http://${server.address.address}:${server.port}/events',
          lastEventId: '3',
        )
        .listen(events.add);
    await Future<void>.delayed(const Duration(milliseconds: 500));
    await subscription.cancel();

    expect(lastEventId, '3');
    expect(events, hasLength(1));
    expect(events.single.id, '5');
  });
}
```

- [ ] **Step 2: 实现 EventStreamClient**

`lib/core/api/events/event_stream_client.dart`：

```dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../../observability/log.dart';

class SseEvent {
  const SseEvent({required this.id, required this.event, required this.data});

  final String? id;
  final String event;
  final String data;
}

class EventStreamClient {
  EventStreamClient({HttpClient? httpClient})
      : _httpClient = httpClient ?? HttpClient();

  final HttpClient _httpClient;

  /// 连接 SSE 端点；断线按指数退避自动重连并携带 Last-Event-ID。
  /// 服务端每 15 秒 `: ping` 保活，客户端跳过注释行即可维持连接。
  Stream<SseEvent> connect(
    String url, {
    Map<String, String>? headers,
    String? lastEventId,
    void Function(Object error, StackTrace stackTrace)? onError,
  }) async* {
    var cursor = lastEventId;
    var retryDelay = const Duration(seconds: 1);

    while (true) {
      try {
        final request = await _httpClient.getUrl(Uri.parse(url));
        headers?.forEach((key, value) => request.headers.set(key, value));
        if (cursor != null && cursor.isNotEmpty) {
          request.headers.set('Last-Event-ID', cursor);
        }
        final response = await request.close();
        if (response.statusCode != 200) {
          throw HttpException('SSE status ${response.statusCode}');
        }
        retryDelay = const Duration(seconds: 1);

        final lines = response
            .transform(utf8.decoder)
            .transform(const LineSplitter());
        String? id;
        String? event = 'message';
        final buffer = <String>[];

        await for (final line in lines) {
          if (line.startsWith(':')) continue; // 注释行 / ping
          if (line.isEmpty) {
            if (buffer.isNotEmpty) {
              yield SseEvent(id: id, event: event ?? 'message', data: buffer.join('\n'));
              cursor = id ?? cursor;
              buffer.clear();
              id = null;
              event = 'message';
            }
            continue;
          }
          if (line.startsWith('id:')) {
            id = line.substring(3).trim();
          } else if (line.startsWith('event:')) {
            event = line.substring(6).trim();
          } else if (line.startsWith('data:')) {
            buffer.add(line.substring(5).trimLeft());
          }
        }
      } catch (e, s) {
        logWarning('SSE 断开，准备重连: $e');
        onError?.call(e, s);
        await Future<void>.delayed(retryDelay);
        if (retryDelay < const Duration(seconds: 30)) {
          retryDelay = retryDelay * 2;
        }
      }
    }
  }
}
```

- [ ] **Step 3: 先写上传测试（应失败）**

`test/unit/api/upload_client_test.dart`：

```dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:warehouse/core/api/upload/upload_client.dart';

void main() {
  test('分片上传发送 Content-Range 与 X-Content-SHA256', () async {
    final dir = Directory.systemTemp.createTempSync('upload_test');
    addTearDown(() => dir.deleteSync(recursive: true));
    final file = File('${dir.path}/data.bin')
      ..writeAsBytesSync(List<int>.generate(5120, (i) => i % 256));

    final dio = Dio(BaseOptions());
    final adapter = DioAdapter(dio: dio);
    adapter.onPut(
      'https://dev.drovio.ai/api/cg/files',
      (server) {
        expect(server.request.headers['Content-Range'], startsWith('bytes '));
        expect(server.request.headers['X-Content-SHA256'], 'sha256-abc');
        server.reply(200, {'done': true});
      },
    );

    final client = UploadClient(dio: dio);
    final task = await client.uploadChunked(
      url: 'https://dev.drovio.ai/api/cg/files',
      filePath: file.path,
      chunkSizeBytes: 2048,
      sha256: 'sha256-abc',
    );

    expect(task.totalBytes, 5120);
    expect(task.uploadedBytes, 5120);
    expect(task.progress, 1.0);
  });

  test('multipart 上传进度回调', () async {
    final dir = Directory.systemTemp.createTempSync('upload_test');
    addTearDown(() => dir.deleteSync(recursive: true));
    final file = File('${dir.path}/photo.jpg')..writeAsBytesSync(List.filled(1024, 7));

    final dio = Dio(BaseOptions());
    final adapter = DioAdapter(dio: dio);
    adapter.onPost(
      'https://dev.drovio.ai/api/cg/files/photo',
      (server) => server.reply(200, {'ok': true}),
    );

    final client = UploadClient(dio: dio);
    var lastProgress = -1.0;
    await client.uploadMultipart(
      url: 'https://dev.drovio.ai/api/cg/files/photo',
      filePath: file.path,
      fieldName: 'file',
      onProgress: (p) => lastProgress = p,
    );
    expect(lastProgress, 1.0);
  });
}
```

- [ ] **Step 4: 实现 UploadClient**

`lib/core/api/upload/upload_client.dart`：

```dart
import 'dart:io';
import 'package:dio/dio.dart';

enum UploadMode { multipart, chunked }

class UploadTask {
  UploadTask({
    required this.id,
    required this.mode,
    required this.chunkSizeBytes,
    required this.totalBytes,
  });

  final String id;
  final UploadMode mode;
  final int chunkSizeBytes;
  final int totalBytes;

  int uploadedBytes = 0;

  double get progress => totalBytes == 0 ? 1 : uploadedBytes / totalBytes;
}

class UploadClient {
  UploadClient({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<UploadTask> uploadMultipart({
    required String url,
    required String filePath,
    required String fieldName,
    Map<String, dynamic>? extraFields,
    void Function(double progress)? onProgress,
  }) async {
    final file = File(filePath);
    final task = UploadTask(
      id: 'mp-${DateTime.now().millisecondsSinceEpoch}',
      mode: UploadMode.multipart,
      chunkSizeBytes: 0,
      totalBytes: await file.length(),
    );
    final form = FormData.fromMap({
      ...?extraFields,
      fieldName: await MultipartFile.fromFile(filePath),
    });
    await _dio.post<dynamic>(
      url,
      data: form,
      onSendProgress: (sent, total) {
        task.uploadedBytes = sent;
        onProgress?.call(total == 0 ? 0 : sent / total);
      },
    );
    task.uploadedBytes = task.totalBytes;
    onProgress?.call(1);
    return task;
  }

  /// 分片上传：逐片 PUT，携带 Content-Range 与 X-Content-SHA256。
  /// [offsetBytes] 用于断点续传（跳过已上传部分）。
  Future<UploadTask> uploadChunked({
    required String url,
    required String filePath,
    required int chunkSizeBytes,
    required String sha256,
    int offsetBytes = 0,
    void Function(double progress)? onProgress,
    void Function(int chunkIndex)? onChunkCompleted,
  }) async {
    final file = File(filePath);
    final totalBytes = await file.length();
    final task = UploadTask(
      id: 'ck-${DateTime.now().millisecondsSinceEpoch}',
      mode: UploadMode.chunked,
      chunkSizeBytes: chunkSizeBytes,
      totalBytes: totalBytes,
    );
    final raf = file.openSync();
    try {
      var offset = offsetBytes;
      var index = offset ~/ chunkSizeBytes;
      while (offset < totalBytes) {
        final length =
            (totalBytes - offset) < chunkSizeBytes ? totalBytes - offset : chunkSizeBytes;
        final bytes = raf.readSync(length);
        await _dio.put<dynamic>(
          url,
          data: Stream.fromIterable([bytes]),
          options: Options(
            headers: {
              'Content-Range': 'bytes $offset-${offset + length - 1}/$totalBytes',
              'X-Content-SHA256': sha256,
            },
          ),
        );
        offset += length;
        task.uploadedBytes = offset;
        onChunkCompleted?.call(index);
        onProgress?.call(task.progress);
        index += 1;
      }
    } finally {
      raf.closeSync();
    }
    return task;
  }
}
```

- [ ] **Step 5: 验证**

```bash
flutter test test/unit/api/event_stream_client_test.dart test/unit/api/upload_client_test.dart
flutter analyze --no-fatal-infos
```

Expected: 全部 PASS（SSE 测试使用本机 loopback，无需网络）。

- [ ] **Step 6: 提交**

```bash
git add .
git commit -m "feat: sse event stream client and chunked upload client"
```

---

### Task 6: 会话与认证

**Files:**
- Create: `lib/core/auth/session_store.dart`
- Create: `lib/core/auth/token_provider.dart`
- Create: `lib/contracts/auth/auth_models.dart`
- Create: `lib/contracts/auth/auth_api.dart`
- Create: `lib/contracts/auth/auth_repository.dart`
- Create: `lib/contracts/auth/http_auth_repository.dart`
- Create: `lib/features/auth/application/auth_state.dart`
- Create: `lib/features/auth/application/auth_cubit.dart`
- Modify: `lib/app/bootstrap.dart`（注册默认 LocaleProvider，保证 DI 可解析）
- Test: `test/unit/auth/session_store_test.dart`
- Test: `test/unit/auth/auth_repository_test.dart`
- Test: `test/unit/auth/auth_cubit_test.dart`

**Interfaces:**
- Consumes: `ApiClient`（Task 3）、`SessionEvents`/`AuthTokenProvider`（Task 4）
- Produces:
  - `SessionStore`（抽象）+ `SecureSessionStore`
  - `SecureTokenProvider`（`@LazySingleton(as: AuthTokenProvider)`）
  - `AuthSessionDto(token, operatorId)`、`OperatorProfileDto(...)`
  - `AuthApi`（`login`/`me`/`logout`，路径 `auth/login`、`auth/me`、`auth/logout`，前缀由 ApiConfig 拼 `/cg/`）
  - `AuthRepository`（抽象接口）+ `HttpAuthRepository`（`@LazySingleton(as: AuthRepository)`）
  - `AuthStatus { unknown, unauthenticated, authenticated }`、`AuthState(status, profile, error)`
  - `AuthCubit(tokenProvider, repository, sessionEvents)`：`bootstrap()`、`login()`、`logout()`

- [ ] **Step 1: 添加依赖**

```bash
flutter pub add flutter_secure_storage
flutter pub add dev:bloc_test
```

- [ ] **Step 2: 先写 SessionStore 测试（应失败）**

`test/unit/auth/session_store_test.dart`：

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/core/auth/session_store.dart';

void main() {
  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  test('读写与清理 token/operator', () async {
    final store = SecureSessionStore(storage: const FlutterSecureStorage());
    expect(await store.readToken(), isNull);

    await store.writeToken('tok-1');
    await store.writeOperatorId('op-7');
    expect(await store.readToken(), 'tok-1');
    expect(await store.readOperatorId(), 'op-7');

    await store.clear();
    expect(await store.readToken(), isNull);
    expect(await store.readOperatorId(), isNull);
  });
}
```

- [ ] **Step 3: 实现 SessionStore 与 TokenProvider**

`lib/core/auth/session_store.dart`：

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class SessionStore {
  Future<String?> readToken();
  Future<void> writeToken(String token);
  Future<String?> readOperatorId();
  Future<void> writeOperatorId(String operatorId);
  Future<void> clear();
}

@singleton
class SecureSessionStore implements SessionStore {
  SecureSessionStore({FlutterSecureStorage? storage})
      : _storage = storage ?? FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _tokenKey = 'auth_token';
  static const _operatorKey = 'auth_operator_id';

  @override
  Future<String?> readToken() => _storage.read(key: _tokenKey);

  @override
  Future<void> writeToken(String token) =>
      _storage.write(key: _tokenKey, value: token);

  @override
  Future<String?> readOperatorId() => _storage.read(key: _operatorKey);

  @override
  Future<void> writeOperatorId(String operatorId) =>
      _storage.write(key: _operatorKey, value: operatorId);

  @override
  Future<void> clear() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _operatorKey);
  }
}
```

`lib/core/auth/token_provider.dart`：

```dart
import 'package:injectable/injectable.dart';
import 'auth_token_provider.dart';
import 'session_store.dart';

@LazySingleton(as: AuthTokenProvider)
class SecureTokenProvider implements AuthTokenProvider {
  SecureTokenProvider(this._store);

  final SessionStore _store;

  @override
  Future<String?> accessToken() => _store.readToken();

  @override
  Future<void> clear() => _store.clear();
}
```

- [ ] **Step 4: 先写 AuthRepository 测试（应失败）**

`test/unit/auth/auth_repository_test.dart`：

```dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:warehouse/core/api/api_client.dart';
import 'package:warehouse/core/api/api_config.dart';
import 'package:warehouse/core/auth/session_store.dart';
import 'package:warehouse/contracts/auth/auth_api.dart';
import 'package:warehouse/contracts/auth/http_auth_repository.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late HttpAuthRepository repository;

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
    dio = Dio(BaseOptions());
    adapter = DioAdapter(dio: dio);
    final client = ApiClient(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/cg/',
      ),
      dio: dio,
    );
    repository = HttpAuthRepository(
      authApi: AuthApi(client: client),
      sessionStore: SecureSessionStore(storage: const FlutterSecureStorage()),
    );
  });

  test('登录成功保存 token 并返回 profile', () async {
    adapter.onPost(
      'https://dev.drovio.ai/api/cg/auth/login',
      (server) => server.reply(200, {'token': 't1', 'operator_id': 'op-1'}),
    );
    adapter.onGet(
      'https://dev.drovio.ai/api/cg/auth/me',
      (server) => server.reply(200, {'id': 'op-1', 'name': '张三', 'roles': ['warehouse']}),
    );

    final profile = await repository.login(username: 'u', password: 'p');

    expect(profile.name, '张三');
    expect(await repository.accessToken(), 't1');
  });
}
```

- [ ] **Step 5: 实现 contracts/auth**

`lib/contracts/auth/auth_models.dart`：

```dart
class AuthSessionDto {
  const AuthSessionDto({required this.token, required this.operatorId});

  final String token;
  final String operatorId;

  factory AuthSessionDto.fromJson(Map<String, dynamic> json) => AuthSessionDto(
        token: json['token'] as String,
        operatorId: json['operator_id'] as String,
      );
}

class OperatorProfileDto {
  const OperatorProfileDto({
    required this.id,
    required this.name,
    required this.roles,
  });

  final String id;
  final String name;
  final List<String> roles;

  factory OperatorProfileDto.fromJson(Map<String, dynamic> json) =>
      OperatorProfileDto(
        id: json['id'] as String,
        name: json['name'] as String? ?? '',
        roles: (json['roles'] as List<dynamic>? ?? const [])
            .map((e) => e as String)
            .toList(growable: false),
      );
}
```

说明：`/cg/auth/*` 的字段名以 Task 12 拉取的 OpenAPI 为准；当前按 Web 管理后台 `/admin/auth/*` 结构假设，生成后如有差异调整 DTO 字段。

`lib/contracts/auth/auth_api.dart`：

```dart
import 'package:injectable/injectable.dart';
import 'package:warehouse/core/api/api_client.dart';
import 'auth_models.dart';

@singleton
class AuthApi {
  AuthApi({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<AuthSessionDto> login({
    required String username,
    required String password,
  }) =>
      _client.post<AuthSessionDto>(
        'auth/login',
        body: {'username': username, 'password': password},
        decode: AuthSessionDto.fromJson,
      );

  Future<OperatorProfileDto> me() => _client.get<OperatorProfileDto>(
        'auth/me',
        decode: OperatorProfileDto.fromJson,
      );

  Future<dynamic> logout() => _client.post<dynamic>('auth/logout');
}
```

`lib/contracts/auth/auth_repository.dart`：

```dart
import 'auth_models.dart';

abstract class AuthRepository {
  Future<String?> accessToken();
  Future<OperatorProfileDto> login({
    required String username,
    required String password,
  });
  Future<OperatorProfileDto> loadProfile();
  Future<void> logout();
}
```

`lib/contracts/auth/http_auth_repository.dart`：

```dart
import 'package:injectable/injectable.dart';
import 'package:warehouse/core/auth/session_store.dart';
import 'auth_api.dart';
import 'auth_models.dart';
import 'auth_repository.dart';

@LazySingleton(as: AuthRepository)
class HttpAuthRepository implements AuthRepository {
  HttpAuthRepository({required AuthApi authApi, required SessionStore sessionStore})
      : _authApi = authApi,
        _sessionStore = sessionStore;

  final AuthApi _authApi;
  final SessionStore _sessionStore;

  @override
  Future<String?> accessToken() => _sessionStore.readToken();

  @override
  Future<OperatorProfileDto> login({
    required String username,
    required String password,
  }) async {
    final session = await _authApi.login(username: username, password: password);
    await _sessionStore.writeToken(session.token);
    await _sessionStore.writeOperatorId(session.operatorId);
    return _authApi.me();
  }

  @override
  Future<OperatorProfileDto> loadProfile() => _authApi.me();

  @override
  Future<void> logout() async {
    try {
      await _authApi.logout();
    } finally {
      await _sessionStore.clear();
    }
  }
}
```

- [ ] **Step 6: 先写 AuthCubit 测试（应失败）**

`test/unit/auth/auth_cubit_test.dart`：

```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/contracts/auth/auth_models.dart';
import 'package:warehouse/contracts/auth/auth_repository.dart';
import 'package:warehouse/core/auth/auth_token_provider.dart';
import 'package:warehouse/core/auth/session_events.dart';
import 'package:warehouse/features/auth/application/auth_cubit.dart';

class FakeTokenProvider implements AuthTokenProvider {
  FakeTokenProvider([this.token]);
  String? token;
  @override
  Future<String?> accessToken() async => token;
  @override
  Future<void> clear() async => token = null;
}

class FakeAuthRepository implements AuthRepository {
  String? token;
  @override
  Future<String?> accessToken() async => token;
  @override
  Future<OperatorProfileDto> login({
    required String username,
    required String password,
  }) async {
    token = 't1';
    return OperatorProfileDto(id: 'op-1', name: '张三', roles: const ['warehouse']);
  }
  @override
  Future<OperatorProfileDto> loadProfile() async =>
      OperatorProfileDto(id: 'op-1', name: '张三', roles: const ['warehouse']);
  @override
  Future<void> logout() async => token = null;
}

void main() {
  late SessionEvents sessionEvents;
  late FakeTokenProvider tokenProvider;
  late FakeAuthRepository repository;

  setUp(() {
    sessionEvents = SessionEvents();
    tokenProvider = FakeTokenProvider();
    repository = FakeAuthRepository();
  });

  blocTest<AuthCubit, AuthState>(
    '无 token 启动为未登录',
    build: () => AuthCubit(
      tokenProvider: tokenProvider,
      repository: repository,
      sessionEvents: sessionEvents,
    ),
    act: (cubit) => cubit.bootstrap(),
    expect: [
      const AuthState(status: AuthStatus.unauthenticated),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    '登录成功进入已认证',
    build: () => AuthCubit(
      tokenProvider: tokenProvider,
      repository: repository,
      sessionEvents: sessionEvents,
    ),
    act: (cubit) => cubit.login(username: 'u', password: 'p'),
    expect: [
      AuthState(
        status: AuthStatus.authenticated,
        profile: OperatorProfileDto(id: 'op-1', name: '张三', roles: const ['warehouse']),
      ),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    '会话失效事件触发未登录',
    build: () => AuthCubit(
      tokenProvider: tokenProvider,
      repository: repository,
      sessionEvents: sessionEvents,
    ),
    act: (cubit) => sessionEvents.fireSessionExpired(),
    expect: [
      const AuthState(status: AuthStatus.unauthenticated, error: 'session_expired'),
    ],
  );
}
```

- [ ] **Step 7: 实现 AuthState / AuthCubit**

`lib/features/auth/application/auth_state.dart`：

```dart
import 'package:warehouse/contracts/auth/auth_models.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }

class AuthState {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.profile,
    this.error,
  });

  final AuthStatus status;
  final OperatorProfileDto? profile;
  final String? error;

  AuthState copyWith({AuthStatus? status, OperatorProfileDto? profile, String? error}) {
    return AuthState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is AuthState &&
      other.status == status &&
      other.profile?.id == profile?.id &&
      other.error == error;

  @override
  int get hashCode => Object.hash(status, profile?.id, error);
}
```

`lib/features/auth/application/auth_cubit.dart`：

```dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:warehouse/contracts/auth/auth_repository.dart';
import 'package:warehouse/core/api/api_exception.dart';
import 'package:warehouse/core/auth/auth_token_provider.dart';
import 'package:warehouse/core/auth/session_events.dart';
import 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthTokenProvider tokenProvider,
    required AuthRepository repository,
    required SessionEvents sessionEvents,
  })  : _tokenProvider = tokenProvider,
        _repository = repository,
        super(const AuthState()) {
    _sessionSubscription = sessionEvents.expired.listen((_) {
      emit(const AuthState(status: AuthStatus.unauthenticated, error: 'session_expired'));
    });
  }

  final AuthTokenProvider _tokenProvider;
  final AuthRepository _repository;
  late final StreamSubscription<void> _sessionSubscription;

  Future<void> bootstrap() async {
    final token = await _tokenProvider.accessToken();
    if (token == null || token.isEmpty) {
      emit(const AuthState(status: AuthStatus.unauthenticated));
      return;
    }
    try {
      final profile = await _repository.loadProfile();
      emit(AuthState(status: AuthStatus.authenticated, profile: profile));
    } on ApiException catch (e) {
      if (e.isSessionExpired) {
        await _tokenProvider.clear();
        emit(const AuthState(status: AuthStatus.unauthenticated));
      } else {
        emit(AuthState(status: AuthStatus.unauthenticated, error: e.message));
      }
    }
  }

  Future<void> login({required String username, required String password}) async {
    try {
      final profile = await _repository.login(username: username, password: password);
      emit(AuthState(status: AuthStatus.authenticated, profile: profile));
    } on ApiException catch (e) {
      emit(AuthState(status: AuthStatus.unauthenticated, error: e.message));
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    await _tokenProvider.clear();
    emit(const AuthState(status: AuthStatus.unauthenticated));
  }

  @override
  Future<void> close() async {
    await _sessionSubscription.cancel();
    await super.close();
  }
}
```

- [ ] **Step 8: bootstrap 注册默认 LocaleProvider（Task 9 前保证 DI 可解析）**

修改 `lib/app/bootstrap.dart`：

```dart
import 'package:flutter/widgets.dart';
import 'package:warehouse/core/api/api_config.dart';
import 'package:warehouse/core/i18n/locale_provider.dart';
import 'package:warehouse/app/config/app_config.dart';
import 'di/get_it.dart';
import 'di/injection.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig.fromDartDefines();
  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<ApiConfig>(appConfig.apiConfig);
  getIt.registerSingleton<LocaleProvider>(FixedLocaleProvider(const Locale('th')));
  configureDependencies();
}
```

- [ ] **Step 9: 重新生成 DI 并验证**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/unit/auth
flutter analyze --no-fatal-infos
```

Expected: 全部 PASS。

- [ ] **Step 10: 提交**

```bash
git add .
git commit -m "feat: session store, auth repository and auth cubit"
```

---

### Task 7: 路由与 App Shell

**Files:**
- Create: `lib/app/router/app_router.dart`
- Create: `lib/app/router/app_shell.dart`
- Create: `lib/app/router/route_guards.dart`（重定向逻辑）
- Create: `lib/app/warehouse_app.dart`
- Create: `lib/features/auth/presentation/login_page.dart`
- Create: `lib/features/home/presentation/home_page.dart`
- Create: `lib/features/scan/presentation/scan_page.dart`（占位，Task 11 完善）
- Create: `lib/features/messages/presentation/messages_page.dart`
- Create: `lib/features/messages/presentation/message_detail_page.dart`
- Create: `lib/features/settings/presentation/settings_page.dart`
- Modify: `lib/main.dart`（使用 WarehouseApp）
- Test: `test/widget/app_router_test.dart`

**Interfaces:**
- Consumes: `AuthCubit`/`AuthState`（Task 6）
- Produces:
  - `AppRouter(authCubit)`，暴露 `router`（GoRouter）
  - 路由表：`/login`；Shell 内 `/`、`/scan`、`/messages`、`/messages/:id`、`/settings`
  - `/messages/:id` → `MessageDetailPage(messageId)`（独立占位页，不是登录页）
  - `WarehouseApp`（MaterialApp.router）

- [ ] **Step 1: 添加依赖**

```bash
flutter pub add go_router
```

- [ ] **Step 2: 先写路由测试（应失败）**

`test/widget/app_router_test.dart`：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/app/router/app_router.dart';
import 'package:warehouse/contracts/auth/auth_models.dart';
import 'package:warehouse/contracts/auth/auth_repository.dart';
import 'package:warehouse/core/auth/auth_token_provider.dart';
import 'package:warehouse/core/auth/session_events.dart';
import 'package:warehouse/features/auth/application/auth_cubit.dart';
import 'package:warehouse/features/auth/presentation/login_page.dart';
import 'package:warehouse/features/home/presentation/home_page.dart';
import 'package:warehouse/features/messages/presentation/message_detail_page.dart';

class FakeTokenProvider implements AuthTokenProvider {
  FakeTokenProvider([this.token]);
  String? token;
  @override
  Future<String?> accessToken() async => token;
  @override
  Future<void> clear() async => token = null;
}

class FakeAuthRepository implements AuthRepository {
  @override
  Future<String?> accessToken() async => 't1';
  @override
  Future<OperatorProfileDto> login({
    required String username,
    required String password,
  }) async =>
      OperatorProfileDto(id: 'op-1', name: '张三', roles: const ['warehouse']);
  @override
  Future<OperatorProfileDto> loadProfile() async =>
      OperatorProfileDto(id: 'op-1', name: '张三', roles: const ['warehouse']);
  @override
  Future<void> logout() async {}
}

void main() {
  testWidgets('未登录访问 / 重定向到 /login', (tester) async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider(),
      repository: FakeAuthRepository(),
      sessionEvents: SessionEvents(),
    );
    await cubit.bootstrap();

    final router = AppRouter(authCubit: cubit).router;
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('已登录可访问 / 首页', (tester) async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider('t1'),
      repository: FakeAuthRepository(),
      sessionEvents: SessionEvents(),
    );
    await cubit.bootstrap();

    final router = AppRouter(authCubit: cubit).router;
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('深链接 /messages/42 打开消息占位详情', (tester) async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider('t1'),
      repository: FakeAuthRepository(),
      sessionEvents: SessionEvents(),
    );
    await cubit.bootstrap();

    final router = AppRouter(authCubit: cubit).router;
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    router.go('/messages/42');
    await tester.pumpAndSettle();

    expect(find.byType(MessageDetailPage), findsOneWidget);
    expect(find.textContaining('42'), findsOneWidget);
  });
}
```

- [ ] **Step 3: 实现占位页面**

`lib/features/home/presentation/home_page.dart`：

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text('首页')), body: const Center(child: Text('HomePlaceholder')));
}
```

`lib/features/scan/presentation/scan_page.dart`（Task 11 替换为真实扫码页）：

```dart
import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text('扫码')), body: const Center(child: Text('ScanPlaceholder')));
}
```

`lib/features/messages/presentation/messages_page.dart`：

```dart
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text('消息')), body: const Center(child: Text('MessagesPlaceholder')));
}
```

`lib/features/messages/presentation/message_detail_page.dart`：

```dart
import 'package:flutter/material.dart';

class MessageDetailPage extends StatelessWidget {
  const MessageDetailPage({super.key, required this.messageId});

  final String messageId;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('消息详情')),
        body: Center(child: Text('MessagePlaceholder $messageId')),
      );
}
```

`lib/features/settings/presentation/settings_page.dart`：

```dart
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text('设置')), body: const Center(child: Text('SettingsPlaceholder')));
}
```

`lib/features/auth/presentation/login_page.dart`：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/features/auth/application/auth_cubit.dart';
import 'package:warehouse/features/auth/application/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final controllerUser = TextEditingController();
    final controllerPassword = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerUser,
              decoration: const InputDecoration(labelText: '用户名'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controllerPassword,
              obscureText: true,
              decoration: const InputDecoration(labelText: '密码'),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => cubit.login(
                username: controllerUser.text,
                password: controllerPassword.text,
              ),
              child: const Text('登录'),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) =>
                  state.error == null ? const SizedBox.shrink() : Text(state.error!),
            ),
          ],
        ),
      ),
    );
  }
}
```

说明：LoginPage 需要 `AuthState` import；Task 9/10 会替换为 l10n 文案与 PrimaryButton。

- [ ] **Step 4: 实现 AppShell、路由与根 App**

`lib/app/router/app_shell.dart`：

```dart
import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.currentLocation, required this.child});

  final String currentLocation;
  final Widget child;

  int get _index {
    if (currentLocation.startsWith('/messages')) return 1;
    if (currentLocation == '/scan') return 2;
    if (currentLocation.startsWith('/settings')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: '首页'),
          NavigationDestination(icon: Icon(Icons.message_outlined), label: '消息'),
          NavigationDestination(icon: Icon(Icons.qr_code_scanner), label: '扫码'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: '设置'),
        ],
      ),
    );
  }
}
```

说明：仓管业务 Tab（入库/出库/库存）由业务任务在 `NavigationBar` 中追加，此处只保留框架占位。

`lib/app/router/route_guards.dart`：

```dart
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse/features/auth/application/auth_state.dart';

String? authRedirect(AuthState authState, GoRouterState state) {
  final loggedIn = authState.status == AuthStatus.authenticated;
  final onLogin = state.matchedLocation == '/login';
  if (!loggedIn && !onLogin) return '/login';
  if (loggedIn && onLogin) return '/';
  return null;
}
```

`lib/app/router/app_router.dart`：

```dart
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse/features/auth/application/auth_cubit.dart';
import 'package:warehouse/features/auth/application/auth_state.dart';
import 'package:warehouse/features/auth/presentation/login_page.dart';
import 'package:warehouse/features/home/presentation/home_page.dart';
import 'package:warehouse/features/messages/presentation/message_detail_page.dart';
import 'package:warehouse/features/messages/presentation/messages_page.dart';
import 'package:warehouse/features/scan/presentation/scan_page.dart';
import 'package:warehouse/features/settings/presentation/settings_page.dart';
import 'app_shell.dart';
import 'route_guards.dart';

class AppRouter {
  AppRouter({required AuthCubit authCubit}) : _authCubit = authCubit {
    router = GoRouter(
      initialLocation: '/',
      refreshListenable: GoRouterRefreshStream(_authCubit.stream),
      redirect: (context, state) => authRedirect(_authCubit.state, state),
      routes: [
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
        ShellRoute(
          builder: (context, state, child) => AppShell(
            currentLocation: state.uri.path,
            child: child,
          ),
          routes: [
            GoRoute(path: '/', builder: (context, state) => const HomePage()),
            GoRoute(path: '/scan', builder: (context, state) => const ScanPage()),
            GoRoute(path: '/messages', builder: (context, state) => const MessagesPage()),
            GoRoute(
              path: '/messages/:id',
              builder: (context, state) => MessageDetailPage(
                messageId: state.pathParameters['id'] ?? '',
              ),
            ),
            GoRoute(path: '/settings', builder: (context, state) => const SettingsPage()),
          ],
        ),
      ],
    );
  }

  final AuthCubit _authCubit;
  late final GoRouter router;
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<AuthState> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
```

`lib/app/warehouse_app.dart`：

```dart
import 'package:flutter/material.dart';
import 'package:warehouse/app/di/get_it.dart';
import 'package:warehouse/app/router/app_router.dart';

class WarehouseApp extends StatelessWidget {
  const WarehouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;
    return MaterialApp.router(
      title: 'Warehouse',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
```

修改 `lib/main.dart`：

```dart
import 'package:flutter/material.dart';
import 'app/bootstrap.dart';
import 'app/warehouse_app.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const WarehouseApp());
}
```

修改 `lib/app/bootstrap.dart`，在 `configureDependencies()` 后注册 AppRouter：

```dart
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig.fromDartDefines();
  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<ApiConfig>(appConfig.apiConfig);
  getIt.registerSingleton<LocaleProvider>(FixedLocaleProvider(const Locale('th')));
  configureDependencies();
  getIt.registerSingleton<AppRouter>(AppRouter(authCubit: getIt<AuthCubit>()));
}
```

对应 import 增加：

```dart
import 'package:warehouse/app/router/app_router.dart';
import 'package:warehouse/features/auth/application/auth_cubit.dart';
```

- [ ] **Step 5: 验证**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/widget/app_router_test.dart
flutter analyze --no-fatal-infos
```

Expected: 全部 PASS。若 `testWidgets` 中 `router.go` 后需要额外 pump，追加一次 `await tester.pump()`。

- [ ] **Step 6: 提交**

```bash
git add .
git commit -m "feat: go_router shell, auth guard and placeholder pages"
```

---

### Task 8: 本地数据库（Drift）

**Files:**
- Create: `lib/core/database/tables.dart`
- Create: `lib/core/database/app_database.dart`
- Create: `lib/core/database/command_queue_dao.dart`
- Create: `lib/core/database/preferences_store.dart`
- Create: `lib/core/database/database_module.dart`
- Test: `test/unit/database/app_database_test.dart`

**Interfaces:**
- Consumes: 无外部依赖（独立基础能力）
- Produces:
  - `AppDatabase`（`@DriftDatabase(tables: [SessionRecords, Preferences, CommandQueueEntries, ReadMessages])`）
  - `CommandQueueDao`：`enqueue(...)`、`watchByStatus(...)`、`markStatus(...)`、`deleteAcceptedBefore(...)`
  - `PreferencesStore`：`read(key)`、`write(key, value)`
  - `buildAppDatabase()`（`driftDatabase(name: 'warehouse')`）

- [ ] **Step 1: 添加依赖**

```bash
flutter pub add drift drift_flutter path_provider
flutter pub add dev:drift_dev
```

- [ ] **Step 2: 先写数据库测试（应失败）**

`test/unit/database/app_database_test.dart`：

```dart
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/core/database/app_database.dart';
import 'package:warehouse/core/database/command_queue_dao.dart';
import 'package:warehouse/core/database/preferences_store.dart';
import 'package:warehouse/core/database/tables.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('建表与偏好读写', () async {
    final store = PreferencesStore(db);
    expect(await store.read('app_language'), isNull);
    await store.write('app_language', 'th');
    expect(await store.read('app_language'), 'th');
  });

  test('命令队列入队与状态流转', () async {
    final dao = CommandQueueDao(db);
    final entry = await dao.enqueue(
      commandId: 'cmd-1',
      entityType: 'stocktake',
      entityId: 7,
      payload: '{"count": 10}',
      deviceOccurredAt: DateTime.utc(2026, 11, 18),
    );
    expect(entry.id, greaterThan(0));
    expect(entry.status, 'pending');

    await dao.markStatus(entry.id, 'accepted');
    final accepted = await dao.watchByStatus('accepted').first;
    expect(accepted.single.id, entry.id);
    expect(accepted.single.status, 'accepted');

    await dao.deleteAcceptedBefore(DateTime.now().add(const Duration(days: 1)));
    final pending = await dao.watchByStatus('pending').first;
    expect(pending, isEmpty);
  });

  test('迁移：全部表可查询', () async {
    final tables = db.allTables;
    expect(tables, containsAll([
      db.sessionRecords,
      db.preferences,
      db.commandQueueEntries,
      db.readMessages,
    ]));
  });
}
```

- [ ] **Step 3: 实现表与数据库**

`lib/core/database/tables.dart`：

```dart
import 'package:drift/drift.dart';

class SessionRecords extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

class Preferences extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

class CommandQueueEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get commandId => text()();
  TextColumn get entityType => text()();
  IntColumn get entityId => integer()();
  TextColumn get payload => text()();
  // draft/pending/syncing/accepted/conflict/rejected
  TextColumn get status => text()();
  TextColumn get error => text().nullable()();
  DateTimeColumn get deviceOccurredAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ReadMessages extends Table {
  IntColumn get messageId => integer()();
  DateTimeColumn get readAt => dateTime()();

  @override
  Set<Column> get primaryKey => {messageId};
}
```

`lib/core/database/app_database.dart`：

```dart
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [SessionRecords, Preferences, CommandQueueEntries, ReadMessages])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async => m.createAll(),
        onUpgrade: (m, from, to) async {},
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

AppDatabase buildAppDatabase() => AppDatabase(driftDatabase(name: 'warehouse'));
```

`lib/core/database/database_module.dart`：

```dart
import 'package:injectable/injectable.dart';
import 'app_database.dart';

@module
abstract class DatabaseModule {
  @singleton
  AppDatabase provideAppDatabase() => buildAppDatabase();
}
```

- [ ] **Step 4: 实现 DAO 与偏好存储**

`lib/core/database/command_queue_dao.dart`：

```dart
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'app_database.dart';
import 'tables.dart';

@singleton
class CommandQueueDao {
  CommandQueueDao(this._db);

  final AppDatabase _db;

  Future<CommandQueueEntry> enqueue({
    required String commandId,
    required String entityType,
    required int entityId,
    required String payload,
    required DateTime deviceOccurredAt,
  }) {
    return _db.into(_db.commandQueueEntries).insertReturning(
          CommandQueueEntriesCompanion.insert(
            commandId: commandId,
            entityType: entityType,
            entityId: entityId,
            payload: payload,
            status: const Value('pending'),
            deviceOccurredAt: deviceOccurredAt,
            updatedAt: Value(DateTime.now()),
          ),
        );
  }

  Stream<List<CommandQueueEntry>> watchByStatus(String status) {
    final query = _db.select(_db.commandQueueEntries)
      ..where((entry) => entry.status.equals(status));
    return query.watch();
  }

  Future<void> markStatus(int id, String status, {String? error}) {
    return (_db.update(_db.commandQueueEntries)
          ..where((entry) => entry.id.equals(id)))
        .write(
      CommandQueueEntriesCompanion(
        status: Value(status),
        error: Value(error),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteAcceptedBefore(DateTime before) {
    return (_db.delete(_db.commandQueueEntries)
          ..where((entry) =>
              entry.status.equals('accepted') &
              entry.updatedAt.isSmallerThanValue(before)))
        .go();
  }
}
```

`lib/core/database/preferences_store.dart`：

```dart
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'app_database.dart';
import 'tables.dart';

@singleton
class PreferencesStore {
  PreferencesStore(this._db);

  final AppDatabase _db;

  Future<String?> read(String key) async {
    final row = await (_db.select(_db.preferences)
          ..where((entry) => entry.key.equals(key)))
        .getSingleOrNull();
    return row?.value;
  }

  Future<void> write(String key, String value) {
    return _db.into(_db.preferences).insertOnConflictUpdate(
          PreferencesCompanion.insert(key: key, value: value),
        );
  }
}
```

- [ ] **Step 5: 生成 drift 代码并验证**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/unit/database/app_database_test.dart
flutter analyze --no-fatal-infos
```

Expected: 全部 PASS（`NativeDatabase.memory()` 使用 sqlite3 FFI，无需真机）。

- [ ] **Step 6: 提交**

```bash
git add .
git commit -m "feat: drift database, command queue dao and preferences store"
```

---

### Task 9: 多语言（gen_l10n，th / zh-Hans）

**Files:**
- Create: `l10n.yaml`
- Create: `lib/l10n/app_th.arb`
- Create: `lib/l10n/app_zh.arb`
- Create: `lib/core/i18n/app_locale_provider.dart`
- Modify: `lib/app/warehouse_app.dart`（localizationsDelegates / supportedLocales / locale）
- Modify: `lib/app/bootstrap.dart`（移除 FixedLocaleProvider 默认注册，改用 AppLocaleProvider）
- Modify: `lib/features/auth/presentation/login_page.dart`（使用 l10n 文案）
- Test: `test/unit/i18n/locale_provider_test.dart`
- Test: `test/widget/l10n_test.dart`

**Interfaces:**
- Consumes: `PreferencesStore`（Task 8）、`LocaleProvider`（Task 4）
- Produces:
  - `AppLocalizations`（生成类，`localizationsDelegates`、`of(context)`）
  - `AppLocaleProvider`（`@LazySingleton(as: LocaleProvider)`，跟随系统、无匹配回退 th、手动切换持久化）
  - `AppLocaleProvider.resolve(Locale?)`（静态可测）

- [ ] **Step 1: 添加依赖**

```bash
flutter pub add intl
flutter pub add flutter_localizations --sdk=flutter
```

- [ ] **Step 2: 配置 gen_l10n**

`l10n.yaml`：

```yaml
arb-dir: lib/l10n
template-arb-file: app_th.arb
output-localization-file: app_localizations.dart
output-class: AppLocalizations
output-dir: lib/l10n/generated
nullable-getter: false
use-escaping: true
```

`lib/l10n/app_th.arb`：

```json
{
  "@@locale": "th",
  "appTitle": "Warehouse",
  "home": "หน้าแรก",
  "scan": "สแกน",
  "messages": "ข้อความ",
  "settings": "ตั้งค่า",
  "login": "เข้าสู่ระบบ",
  "logout": "ออกจากระบบ",
  "username": "ชื่อผู้ใช้",
  "password": "รหัสผ่าน",
  "loginError": "เข้าสู่ระบบไม่สำเร็จ",
  "sessionExpired": "เซสชันหมดอายุ",
  "messageDetail": "รายละเอียดข้อความ",
  "messagePlaceholder": "ข้อความ {id}"
}
```

`lib/l10n/app_zh.arb`：

```json
{
  "@@locale": "zh_Hans",
  "appTitle": "仓库",
  "home": "首页",
  "scan": "扫码",
  "messages": "消息",
  "settings": "设置",
  "login": "登录",
  "logout": "退出登录",
  "username": "用户名",
  "password": "密码",
  "loginError": "登录失败",
  "sessionExpired": "会话已失效",
  "messageDetail": "消息详情",
  "messagePlaceholder": "消息 {id}"
}
```

- [ ] **Step 3: 先写 LocaleProvider 测试（应失败）**

`test/unit/i18n/locale_provider_test.dart`：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/core/i18n/app_locale_provider.dart';

void main() {
  test('系统泰文 → th', () {
    expect(AppLocaleProvider.resolve(const Locale('th')), const Locale('th'));
  });

  test('系统中文 → zh-Hans', () {
    expect(
      AppLocaleProvider.resolve(const Locale('zh')),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    );
    expect(
      AppLocaleProvider.resolve(const Locale('zh', 'TW')),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    );
  });

  test('系统其他语言或无匹配回退泰文', () {
    expect(AppLocaleProvider.resolve(const Locale('en')), const Locale('th'));
    expect(AppLocaleProvider.resolve(null), const Locale('th'));
  });
}
```

- [ ] **Step 4: 实现 AppLocaleProvider**

`lib/core/i18n/app_locale_provider.dart`：

```dart
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:warehouse/core/database/preferences_store.dart';
import 'locale_provider.dart';

@LazySingleton(as: LocaleProvider)
class AppLocaleProvider extends ChangeNotifier implements LocaleProvider {
  AppLocaleProvider({
    required PreferencesStore preferencesStore,
    PlatformDispatcher? dispatcher,
  })  : _preferencesStore = preferencesStore,
        _dispatcher = dispatcher ?? PlatformDispatcher.instance;

  final PreferencesStore _preferencesStore;
  final PlatformDispatcher _dispatcher;

  static const _languageKey = 'app_language';
  static const _supportedLocales = [
    Locale('th'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
  ];

  Locale? _manual;

  @override
  Locale get currentLocale => _manual ?? resolve(_dispatcher.locale);

  static Locale resolve(Locale? systemLocale) {
    if (systemLocale == null) return const Locale('th');
    if (systemLocale.languageCode == 'zh') {
      return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
    }
    if (systemLocale.languageCode == 'th') return const Locale('th');
    return const Locale('th'); // 无匹配回退泰文
  }

  Future<void> load() async {
    final saved = await _preferencesStore.read(_languageKey);
    if (saved == null) return;
    _manual = saved == 'zh-Hans'
        ? const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans')
        : const Locale('th');
    notifyListeners();
  }

  Future<void> setLanguage(Locale locale) async {
    _manual = locale;
    await _preferencesStore.write(
      _languageKey,
      locale.languageCode == 'zh' ? 'zh-Hans' : 'th',
    );
    notifyListeners();
  }
}
```

- [ ] **Step 5: 生成 localizations 并更新 App**

```bash
flutter gen-l10n
```

生成 `lib/l10n/generated/`（必须提交）。修改 `lib/app/warehouse_app.dart`：

```dart
import 'package:flutter/material.dart';
import 'package:warehouse/app/di/get_it.dart';
import 'package:warehouse/app/router/app_router.dart';
import 'package:warehouse/core/i18n/locale_provider.dart';
import 'package:warehouse/l10n/generated/app_localizations.dart';

class WarehouseApp extends StatelessWidget {
  const WarehouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;
    return MaterialApp.router(
      title: 'Warehouse',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      locale: getIt<LocaleProvider>().currentLocale,
      supportedLocales: const [
        Locale('th'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
```

修改 `lib/app/bootstrap.dart`：

```dart
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig.fromDartDefines();
  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<ApiConfig>(appConfig.apiConfig);
  configureDependencies();
  await getIt<AppLocaleProvider>().load();
  getIt.registerSingleton<AppRouter>(AppRouter(authCubit: getIt<AuthCubit>()));
}
```

删除 Step 6 中的 `FixedLocaleProvider` 注册，import 改为 `app_locale_provider.dart`。

- [ ] **Step 6: 替换 LoginPage 文案并写 l10n 测试**

`test/widget/l10n_test.dart`：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/l10n/generated/app_localizations.dart';

void main() {
  Future<void> pumpWithLocale(WidgetTester tester, Locale locale) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        supportedLocales: const [
          Locale('th'),
          Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        ],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Builder(
          builder: (context) => Text(AppLocalizations.of(context).home),
        ),
      ),
    );
  }

  testWidgets('中文文案', (tester) async {
    await pumpWithLocale(
      tester,
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    );
    expect(find.text('首页'), findsOneWidget);
  });

  testWidgets('泰文文案', (tester) async {
    await pumpWithLocale(tester, const Locale('th'));
    expect(find.text('หน้าแรก'), findsOneWidget);
  });

  testWidgets('不支持的语言回退泰文', (tester) async {
    await pumpWithLocale(tester, const Locale('en'));
    expect(find.text('หน้าแรก'), findsOneWidget);
  });
}
```

`LoginPage` 中的文案改为：

```dart
import 'package:warehouse/l10n/generated/app_localizations.dart';
// ...
final l10n = AppLocalizations.of(context);
// 用户名/密码/登录/错误提示分别使用 l10n.username / l10n.password / l10n.login / l10n.loginError
```

（具体行内替换由执行者在页面中完成：`InputDecoration(labelText: l10n.username)`、`FilledButton(child: Text(l10n.login))`、`Text(state.error == null ? '' : l10n.loginError)`。）

- [ ] **Step 7: 验证**

```bash
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter test test/unit/i18n test/widget/l10n_test.dart
flutter analyze --no-fatal-infos
```

Expected: 全部 PASS。

- [ ] **Step 8: 提交**

```bash
git add .
git commit -m "feat: th and zh-Hans localization with system fallback"
```

---

### Task 10: 设计系统

**Files:**
- Create: `lib/core/design/app_colors.dart`
- Create: `lib/core/design/app_text_styles.dart`
- Create: `lib/core/design/app_theme.dart`
- Create: `lib/core/design/widgets/primary_button.dart`
- Modify: `lib/app/warehouse_app.dart`（theme）
- Modify: `lib/features/auth/presentation/login_page.dart`（使用 PrimaryButton + 设计令牌）
- Test: `test/widget/design/primary_button_test.dart`

**Interfaces:**
- Consumes: 无（独立基础能力）
- Produces: `AppColors`、`AppTextStyles`、`AppTheme`（`light`/`dark`）、`PrimaryButton(label, onPressed, loading)`

- [ ] **Step 1: 先写组件测试（应失败）**

`test/widget/design/primary_button_test.dart`：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse/core/design/app_theme.dart';
import 'package:warehouse/core/design/widgets/primary_button.dart';

void main() {
  testWidgets('PrimaryButton 渲染标签并可点击', (tester) async {
    var clicked = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme().light,
        home: Scaffold(
          body: PrimaryButton(
            label: '登录',
            onPressed: () => clicked = true,
          ),
        ),
      ),
    );
    expect(find.text('登录'), findsOneWidget);
    await tester.tap(find.text('登录'));
    expect(clicked, isTrue);
  });

  testWidgets('loading 时禁用', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme().light,
        home: Scaffold(
          body: PrimaryButton(label: '登录', onPressed: () {}, loading: true),
        ),
      ),
    );
    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
  });
}
```

- [ ] **Step 2: 实现设计令牌与主题**

`lib/core/design/app_colors.dart`：

```dart
import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFF1B6EF3);
  static const background = Color(0xFFF5F7FA);
  static const surface = Colors.white;
  static const error = Color(0xFFD32F2F);
  static const success = Color(0xFF2E7D32);
  static const warning = Color(0xFFF57C00);
  static const textPrimary = Color(0xFF1A1C1E);
  static const textSecondary = Color(0xFF6B7280);
  static const divider = Color(0xFFE5E7EB);
}
```

`lib/core/design/app_text_styles.dart`：

```dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextTheme textTheme(Brightness brightness) {
    final primaryColor =
        brightness == Brightness.light ? AppColors.textPrimary : Colors.white;
    final secondaryColor =
        brightness == Brightness.light ? AppColors.textSecondary : Colors.white70;
    return TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: primaryColor),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: primaryColor),
      bodyLarge: TextStyle(fontSize: 16, color: primaryColor),
      bodyMedium: TextStyle(fontSize: 14, color: primaryColor),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: primaryColor),
      bodySmall: TextStyle(fontSize: 12, color: secondaryColor),
    );
  }
}
```

`lib/core/design/app_theme.dart`：

```dart
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

@singleton
class AppTheme {
  ThemeData get light => _build(Brightness.light);
  ThemeData get dark => _build(Brightness.dark);

  ThemeData _build(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? AppColors.background
          : Colors.black,
      textTheme: AppTextStyles.textTheme(brightness),
      appBarTheme: AppBarTheme(
        backgroundColor: brightness == Brightness.light
            ? AppColors.surface
            : Colors.grey[900],
        centerTitle: true,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: Color(0xFFD6E4FF),
      ),
    );
  }
}
```

`lib/core/design/widgets/primary_button.dart`：

```dart
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: FilledButton(
        onPressed: loading ? null : onPressed,
        child: loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(label),
      ),
    );
  }
}
```

- [ ] **Step 3: 接入 App 与 LoginPage**

修改 `lib/app/warehouse_app.dart`，在 `MaterialApp.router` 增加：

```dart
theme: getIt<AppTheme>().light,
darkTheme: getIt<AppTheme>().dark,
```

修改 `lib/features/auth/presentation/login_page.dart`：

```dart
import 'package:warehouse/core/design/widgets/primary_button.dart';
import 'package:warehouse/l10n/generated/app_localizations.dart';
// ...
final l10n = AppLocalizations.of(context);
// TextField 使用 l10n.username / l10n.password；
// FilledButton 替换为 PrimaryButton(label: l10n.login, onPressed: ..., loading: 状态为登录中)
```

（若登录中状态需要 loading，可在 `AuthState` 增加 `isSubmitting` 标志，或暂以 `state.status == AuthStatus.unknown` 模拟；本任务不强制，保持简单。）

- [ ] **Step 4: 验证**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/widget/design/primary_button_test.dart test/widget/app_router_test.dart
flutter analyze --no-fatal-infos
```

Expected: 全部 PASS。

- [ ] **Step 5: 提交**

```bash
git add .
git commit -m "feat: design system, theme and primary button"
```

---

### Task 11: 原生能力（扫码 + 推送）

**Files:**
- Create: `lib/core/native/scan_gateway.dart`
- Create: `lib/core/native/push_gateway.dart`
- Create: `lib/core/native/firebase_push_gateway.dart`
- Create: `lib/core/native/push_token_reporter.dart`
- Create: `lib/features/scan/presentation/scan_page.dart`（真实扫码页，替换占位）
- Modify: `lib/app/bootstrap.dart`（初始化推送）
- Modify: `pubspec.yaml`（Android/iOS 权限与 Firebase 配置说明见 Task 13）
- Test: `test/unit/native/push_token_reporter_test.dart`

**Interfaces:**
- Consumes: `ApiClient`（Task 3）
- Produces:
  - `ScanGateway`（抽象：`controller`、`barcodes`、`dispose()`）+ `MobileScanGateway`
  - `PushGateway`（抽象：`init()`、`token`、`onMessage`、`requestPermission()`）+ `FirebasePushGateway`
  - `PushTokenReporter(gateway, client)`：`report()` 上报设备 token 到 `devices/push-token`

- [ ] **Step 1: 添加依赖**

```bash
flutter pub add mobile_scanner firebase_core firebase_messaging
```

- [ ] **Step 2: 先写 PushTokenReporter 测试（应失败）**

`test/unit/native/push_token_reporter_test.dart`：

```dart
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:warehouse/core/api/api_client.dart';
import 'package:warehouse/core/api/api_config.dart';
import 'package:warehouse/core/native/push_gateway.dart';

class FakePushGateway implements PushGateway {
  FakePushGateway(this._token);
  final String? _token;

  @override
  Future<void> init() async {}

  @override
  Future<String?> get token async => _token;

  @override
  Stream<dynamic> get onMessage => Stream.empty();

  @override
  Future<void> requestPermission() async {}
}

void main() {
  test('上报设备 token', () async {
    final dio = Dio(BaseOptions());
    final adapter = DioAdapter(dio: dio);
    adapter.onPost(
      'https://dev.drovio.ai/api/cg/devices/push-token',
      (server) {
        expect(server.request.data, {'token': 'fcm-token-1'});
        server.reply(200, {'ok': true});
      },
    );
    final client = ApiClient(
      config: const ApiConfig(baseUrl: 'https://dev.drovio.ai/api', projectPrefix: '/cg/'),
      dio: dio,
    );
    final reporter = PushTokenReporter(
      gateway: FakePushGateway('fcm-token-1'),
      client: client,
    );
    await reporter.report();
  });

  test('无 token 不上报', () async {
    final dio = Dio(BaseOptions());
    final adapter = DioAdapter(dio: dio);
    final client = ApiClient(
      config: const ApiConfig(baseUrl: 'https://dev.drovio.ai/api', projectPrefix: '/cg/'),
      dio: dio,
    );
    final reporter = PushTokenReporter(
      gateway: FakePushGateway(null),
      client: client,
    );
    await reporter.report();
  });
}
```

- [ ] **Step 3: 实现扫码 Gateway**

`lib/core/native/scan_gateway.dart`：

```dart
import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

abstract class ScanGateway {
  MobileScannerController get controller;
  Stream<Barcode> get barcodes;
  void dispose();
}

@LazySingleton(as: ScanGateway)
class MobileScanGateway implements ScanGateway {
  MobileScanGateway({MobileScannerController? controller})
      : _controller = controller ?? MobileScannerController();

  final MobileScannerController _controller;
  final _barcodes = StreamController<Barcode>.broadcast();

  @override
  MobileScannerController get controller => _controller;

  @override
  Stream<Barcode> get barcodes => _barcodes.stream;

  void handleCapture(BarcodeCapture capture) {
    for (final barcode in capture.barcodes) {
      if (barcode.rawValue != null && barcode.rawValue!.isNotEmpty) {
        _barcodes.add(barcode);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _barcodes.close();
  }
}
```

`lib/features/scan/presentation/scan_page.dart`（替换占位实现）：

```dart
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:warehouse/app/di/get_it.dart';
import 'package:warehouse/core/native/scan_gateway.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key, this.onDetected});

  final void Function(Barcode barcode)? onDetected;

  @override
  Widget build(BuildContext context) {
    final gateway = getIt<ScanGateway>();
    return Scaffold(
      appBar: AppBar(title: const Text('扫码')),
      body: MobileScanner(
        controller: gateway.controller,
        onDetected: (capture) {
          for (final barcode in capture.barcodes) {
            if (barcode.rawValue != null && barcode.rawValue!.isNotEmpty) {
              onDetected?.call(barcode);
            }
          }
        },
      ),
    );
  }
}
```

说明：`MobileScanGateway` 注册为单例；业务代码只依赖 `ScanGateway` 接口，不 import 插件。扫码自动化测试依赖摄像头，CI 不跑，验收以真机手动清单为主（记录在 `docs/build.md`）。

- [ ] **Step 4: 实现推送 Gateway 与上报**

`lib/core/native/push_token_reporter.dart`：

```dart
import 'package:injectable/injectable.dart';
import 'package:warehouse/core/api/api_client.dart';
import 'push_gateway.dart';

@singleton
class PushTokenReporter {
  PushTokenReporter({required PushGateway gateway, required ApiClient client})
      : _gateway = gateway,
        _client = client;

  final PushGateway _gateway;
  final ApiClient _client;

  Future<void> report() async {
    final token = await _gateway.token;
    if (token == null || token.isEmpty) return;
    await _client.post<dynamic>('devices/push-token', body: {'token': token});
  }
}
```

`lib/core/native/firebase_push_gateway.dart`：

```dart
import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:warehouse/core/observability/log.dart';
import 'push_gateway.dart';

@LazySingleton(as: PushGateway)
class FirebasePushGateway implements PushGateway {
  FirebasePushGateway({FirebaseMessaging? messaging})
      : _messaging = messaging ?? FirebaseMessaging.instance;

  final FirebaseMessaging _messaging;
  final _messages = StreamController<dynamic>.broadcast();
  StreamSubscription<RemoteMessage>? _onMessageSubscription;

  @override
  Future<void> init() async {
    try {
      await Firebase.initializeApp();
      final settings = await _messaging.requestPermission(alert: true, badge: true, sound: true);
      logInfo('push permission: ${settings.authorizationStatus}');
      _onMessageSubscription =
          FirebaseMessaging.onMessage.listen((message) => _messages.add(message));
    } catch (e, s) {
      // 本地未配置 google-services.json / GoogleService-Info.plist 时降级为不可用
      logWarning('push init failed: $e');
      logError('push init stack', e, s);
    }
  }

  @override
  Future<String?> get token async {
    if (Platform.isIOS) return _messaging.getAPNSToken();
    return _messaging.getToken();
  }

  @override
  Stream<dynamic> get onMessage => _messages.stream;

  @override
  Future<void> requestPermission() =>
      _messaging.requestPermission(alert: true, badge: true, sound: true);
}
```

（`PushGateway.onMessage` 的 payload 类型在本计划用 `dynamic` 占位，正式消息模型在消息中心设计确认后收窄；`FirebasePushGateway` 不写单测，由真机验收。）

`lib/core/native/push_gateway.dart`（接口文件）：

```dart
abstract class PushGateway {
  Future<void> init();
  Future<String?> get token;
  Stream<dynamic> get onMessage;
  Future<void> requestPermission();
}
```

修改 `lib/app/bootstrap.dart`，在 `configureDependencies()` 后初始化推送：

```dart
final pushGateway = getIt<PushGateway>();
await pushGateway.init();
await getIt<PushTokenReporter>().report();
```

对应 import：

```dart
import 'package:warehouse/core/native/push_gateway.dart';
```

- [ ] **Step 5: 验证**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/unit/native/push_token_reporter_test.dart
flutter analyze --no-fatal-infos
flutter build apk --debug
```

Expected: 测试 PASS；`flutter build apk --debug` 在不含 google-services.json 时也应成功（Firebase 仅在运行时初始化）。

- [ ] **Step 6: 提交**

```bash
git add .
git commit -m "feat: scan gateway and firebase push gateway with token reporter"
```

---

### Task 12: OpenAPI 契约与按前缀代码生成

**Files:**
- Create: `tools/openapi/refresh.sh`
- Create: `tools/openapi/filter_spec.py`
- Create: `tools/openapi/generate.dart`
- Create: `tools/openapi/openapi.yaml`（首次拉取快照）
- Modify: `build.yaml`（swagger_dart_code_generator 配置）
- Modify: `docs/architecture.md`（10.1 补充 filter_spec.py）
- Test: `test/unit/tools/filter_spec_test.py`（python3 直接运行，不进 flutter test）

**Interfaces:**
- Consumes: OpenAPI 地址 `https://dev.drovio.ai/api/docs/openapi.yaml`（当前 egret API v1.0，225 paths / 252 methods / 288 schemas）
- Produces:
  - `refresh.sh`：下载 → 过滤 → 生成，仓管端默认 `PREFIX=cg`
  - `filter_spec.py`：只保留 `/cg/` 路径 + 被引用 Schema（传递解析）；无匹配路径时保留全部 Schema 作为过渡
  - `generate.dart`：调用 build_runner 的 swagger builder

- [ ] **Step 1: 添加依赖并确认生成器 CLI**

```bash
flutter pub add dev:swagger_dart_code_generator
dart run swagger_dart_code_generator --help
```

Expected: 打印 CLI 帮助。若帮助中的参数与本计划不同，按实际参数调整 `generate.dart`/`build.yaml`（生成器版本以本机安装为准）。

- [ ] **Step 2: 先写过滤脚本测试（应失败）**

`test/unit/tools/filter_spec_test.py`：

```python
import sys
import tempfile
from pathlib import Path

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools" / "openapi"))
import filter_spec  # noqa: E402


def test_only_cg_paths_kept():
    spec = {
        "openapi": "3.0.0",
        "paths": {
            "/cg/auth/login": {"post": {"responses": {"200": {"$ref": "#/components/responses/R"}}}},
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
        filter_spec.main([str(inp), str(out), "--prefix", "/cg/"])
        result = yaml.safe_load(out.read_text(encoding="utf-8"))
    assert list(result["paths"]) == ["/cg/auth/login"]
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
        filter_spec.main([str(inp), str(out), "--prefix", "/cg/"])
        result = yaml.safe_load(out.read_text(encoding="utf-8"))
    assert result["paths"] == {}
    assert "Token" in result["components"]["schemas"]


if __name__ == "__main__":
    import pytest

    raise SystemExit(pytest.main([__file__, "-v"]))
```

- [ ] **Step 3: 实现 filter_spec.py**

`tools/openapi/filter_spec.py`：

```python
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
    parser.add_argument("--prefix", default="/cg/", help="保留的路径前缀，如 /cg/")
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
        # 过渡策略：当前快照没有 /cg/ 路径时保留全部 Schema，
        # 保证生成器输出可用；后端补充 /cg/ 后自动切换为引用过滤。
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
```

- [ ] **Step 4: 实现 refresh.sh 与 generate.dart**

`tools/openapi/refresh.sh`：

```bash
#!/usr/bin/env bash
set -euo pipefail

OPENAPI_URL="${OPENAPI_URL:-https://dev.drovio.ai/api/docs/openapi.yaml}"
PREFIX="${PREFIX:-cg}"
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SNAPSHOT="$ROOT/tools/openapi/openapi.yaml"
FILTERED="$ROOT/tools/openapi/spec/openapi.yaml"

echo "下载 $OPENAPI_URL"
curl -fsSL "$OPENAPI_URL" -o "$SNAPSHOT"

echo "按前缀 /$PREFIX/ 过滤（保留引用到的共享 Schema）"
mkdir -p "$(dirname "$FILTERED")"
python3 "$ROOT/tools/openapi/filter_spec.py" "$SNAPSHOT" "$FILTERED" --prefix "/$PREFIX/"

echo "生成 Dart 代码（swagger_dart_code_generator）"
cd "$ROOT"
dart run tools/openapi/generate.dart

echo "完成：$FILTERED -> lib/contracts/generated"
```

`tools/openapi/generate.dart`：

```dart
import 'dart:io';

Future<void> main() async {
  final result = await Process.run('dart', [
    'run',
    'build_runner',
    'build',
    '--build-filter',
    'swagger_dart_code_generator',
    '--delete-conflicting-outputs',
  ]);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  if (result.exitCode != 0) {
    exit(result.exitCode);
  }
}
```

修改 `build.yaml`，增加 swagger builder：

```yaml
      swagger_dart_code_generator:
        options:
          # 只扫描过滤后的生成输入目录，避免同时处理原始全量快照
          input_folder: "tools/openapi/spec"
          output_folder: "lib/contracts/generated"
          include_paths: ["cg"]
```

- [ ] **Step 5: 运行验证**

```bash
chmod +x tools/openapi/refresh.sh
python3 test/unit/tools/filter_spec_test.py
bash tools/openapi/refresh.sh
find lib/contracts/generated -type f
flutter analyze --no-fatal-infos
```

Expected:
- `filter_spec_test.py` 通过（需要 `python3 -m pip install pyyaml pytest`，若环境无 pytest 可改用 `python3 -c "..."` 直跑两个函数）。
- 当前快照无 `/cg/` 路径 → WARNING + 保留全部 Schema；生成结果可为空或全量模型，`flutter analyze` 必须通过。
- 后端补充 `/cg/` 接口后，再次运行 `refresh.sh` 只生成 `/cg/` 路径及其引用模型。

- [ ] **Step 6: 更新架构文档**

在 `docs/architecture.md` 10.1 增加：

```text
过滤实现：tools/openapi/filter_spec.py 仅保留项目前缀路径及被引用的共享 Schema（传递解析）；
当前快照无匹配路径时保留全部 Schema 作为过渡，后端补充接口后自动切换。
```

- [ ] **Step 7: 提交**

```bash
git add tools/openapi build.yaml lib/contracts/generated docs/architecture.md
git commit -m "chore: openapi snapshot and prefix-filtered code generation"
```

---

### Task 13: 构建发布（版本、签名、三端配置、release CI）

**Files:**
- Create: `tools/version.sh`
- Create: `docs/build.md`
- Create: `android/keystore.properties.example`
- Create: `test/integration/app_launch_test.dart`
- Modify: `android/settings.gradle.kts`（google-services 插件条件加载）
- Modify: `android/app/build.gradle.kts`（applicationId、versionCode/Name、签名）
- Modify: `.github/workflows/ci.yml`（增加集成测试说明）
- Create: `.github/workflows/release.yml`
- Modify: `pubspec.yaml`（integration_test dev 依赖）

**Interfaces:**
- Consumes: 全部基础架构
- Produces:
  - `tools/version.sh` → `VERSION=YYYY.MM.DD-<7位短哈希>`、`BUILD_NUMBER=<提交数>`、`IOS_VERSION=YYYY.MM.DD`
  - `docs/build.md`：版本/签名/环境/分发手册
  - release CI：Android release APK（self-hosted）；iOS 本地构建（签名材料在 Mac 上）

- [ ] **Step 1: 先写版本脚本并验证**

`tools/version.sh`：

```bash
#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "error: not a git repository" >&2
  exit 1
fi

commit_hash=$(git rev-parse --short=7 HEAD)
build_date=$(TZ=Asia/Shanghai date +%Y.%m.%d)
build_number=$(git rev-list --count HEAD)

echo "VERSION=$build_date-$commit_hash"
echo "BUILD_NUMBER=$build_number"
echo "IOS_VERSION=$build_date"
```

```bash
chmod +x tools/version.sh
source <(bash tools/version.sh)
echo "$VERSION / $BUILD_NUMBER / $IOS_VERSION"
```

Expected: `2026.11.18-<hash> / <count> / 2026.11.18`。

- [ ] **Step 2: 配置 Android 签名与版本**

`android/keystore.properties.example`：

```properties
# 复制为 keystore.properties（不入库）。storeFile 使用相对 android/ 目录的路径
storeFile=platform.jks
storePassword=change-me
keyAlias=warehouse
keyPassword=change-me
```

修改 `android/settings.gradle.kts`，在 `plugins` 块追加：

```kotlin
id("com.google.gms.google-services") version "4.4.2" apply false
```

修改 `android/app/build.gradle.kts`：

```kotlin
import java.io.FileInputStream
import java.util.Properties

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("keystore.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.drovio.warehouse"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.drovio.warehouse"
        minSdk = 23
        targetSdk = 35
        versionCode = keystoreProperties.getProperty("versionCode")?.toIntOrNull() ?: 1
        versionName = keystoreProperties.getProperty("versionName") ?: "0.0.1"
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                null
            }
            isMinifyEnabled = false
        }
    }
}

// google-services.json 未配置时不应用插件，CI 可离线构建
if (file("google-services.json").exists()) {
    apply(plugin = "com.google.gms.google-services")
}
```

注意：`versionCode/versionName` 也可由 `flutter build --build-name/--build-number` 传入（Android 支持任意 versionName）；本计划默认以 keystore.properties 驱动，CI 中由脚本写入。

- [ ] **Step 3: 配置 iOS bundle id**

```bash
cd ios
sed -i '' 's/PRODUCT_BUNDLE_IDENTIFIER = com.drovio.warehouse;.*/PRODUCT_BUNDLE_IDENTIFIER = com.drovio.warehouse;/' Runner.xcodeproj/project.pbxproj
```

同时确认 `ios/Runner/Info.plist` 的 `CFBundleShortVersionString` 由 Xcode 版本号管理；iOS 构建命令见 `docs/build.md`（签名材料在 Mac 本地，不入库）。

- [ ] **Step 4: 添加集成测试**

```bash
flutter pub add dev:integration_test --sdk=flutter
```

`test/integration/app_launch_test.dart`：

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:warehouse/features/auth/presentation/login_page.dart';
import 'package:warehouse/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App 启动：未登录渲染登录页', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
```

运行（真机/模拟器，CI 暂不执行）：

```bash
flutter test integration_test/app_launch_test.dart -d <device>
```

- [ ] **Step 5: 编写构建发布手册**

`docs/build.md` 要点（完整内容由执行者按 heron 约定展开）：

```markdown
# 构建与发布（参考 heron 项目）

## 版本号
- 格式：YYYY.MM.DD-<7位短哈希>（Asia/Shanghai），构建号=提交数。
- Android 使用完整 VERSION 作为 versionName；iOS 使用 IOS_VERSION（YYYY.MM.DD）。

## 环境配置
- 复制 .env.local.example 为 .env.local（不入库），flutter run/build 时加 --dart-define-from-file=.env.local。

## 签名
- 签名材料只在本机，不入库；keystore.properties.example 复制为 keystore.properties。
- 存在签名材料时 debug/release 使用同一证书；CI 无签名材料仍可离线构建。

## 构建命令
- Android release：source <(bash tools/version.sh) && flutter build apk --release --build-name "$VERSION" --build-number "$BUILD_NUMBER"
- iOS release：flutter build ipa --release --build-name "$IOS_VERSION" --build-number "$BUILD_NUMBER"（Mac 本地）

## Firebase 配置
- android/app/google-services.json、ios/Runner/GoogleService-Info.plist 本地放置，不入库。

## 分发
- 仓管端/运维端：普通安装包分发；合作方端：应用商店（本项目为仓管端）。

## 真机验收清单
- 扫码：手机摄像头扫描条形码/二维码成功回调。
- 推送：前台通知、点击路由、设备 token 上报。
```

- [ ] **Step 6: 配置 release CI**

`.github/workflows/release.yml`：

```yaml
name: Release build

on:
  workflow_dispatch:

permissions:
  contents: read

jobs:
  android:
    runs-on: [self-hosted, Linux, dev-drovio]
    timeout-minutes: 45
    steps:
      - uses: actions/checkout@v7.0.1
        with:
          fetch-depth: 0
      - name: Install dependencies
        run: flutter pub get
      - name: Unit and widget tests
        run: flutter test
        continue-on-error: true
      - name: Build release APK
        run: |
          source <(bash tools/version.sh)
          flutter build apk --release --build-name "$VERSION" --build-number "$BUILD_NUMBER"
      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: warehouse-android-release
          path: build/app/outputs/flutter-apk/app-release.apk

  ios:
    # 签名材料与证书在 Mac 本地；有 macOS runner 后再启用此 job
    if: false
    runs-on: macos-14
    steps:
      - name: Reserved for iOS release build
        run: echo "iOS 构建见 docs/build.md（本地执行）"
```

修改 `.github/workflows/ci.yml` 的 `Debug APK build` 步骤后追加说明性步骤：

```yaml
      - name: Integration tests (device required)
        run: echo "集成测试需真机/模拟器，见 docs/build.md"
```

- [ ] **Step 7: 全量验证**

```bash
dart format --set-exit-if-changed lib test tools/openapi/generate.dart
flutter analyze --no-fatal-infos
flutter test
flutter build apk --debug
source <(bash tools/version.sh)
flutter build apk --release --build-name "$VERSION" --build-number "$BUILD_NUMBER"
```

Expected: 全部通过（release 在无签名材料时以未签名 APK 输出，CI 允许）。

- [ ] **Step 8: 提交**

```bash
git add .
git commit -m "chore: version script, signing, release pipeline and build docs"
```

---

## 自检结果

**1. Spec 覆盖（对照 docs/architecture.md）：**

| 架构文档要求 | 覆盖任务 |
|---|---|
| 目录结构 app/core/contracts/features | Task 1 |
| core 不依赖 contracts/features | Task 3/4/5/8/10/11 的 core 实现均不含 contracts/features import（AuthRepository 在 contracts，core 只定义抽象） |
| 技术栈基线（Bloc/go_router/Drift/Dio/生成器/freezed/gen_l10n/firebase/mobile_scanner/get_it） | Task 2/3/7/8/9/11/12 |
| 请求层、前缀、认证、错误模型、分页、SSE、上传 | Task 3/4/5/6 |
| 会话与 401 失效 | Task 4/6 |
| 离线分级框架（命令队列） | Task 8（业务离线范围 P1 暂缓） |
| 原生能力（扫码/推送） | Task 11 |
| 多语言 th/zh-Hans、回退、手动切换 | Task 9 |
| API 前缀过滤生成 | Task 12 |
| 构建发布（版本、签名、环境、CI） | Task 13 |
| 测试策略（不阻塞、同目录测试） | Task 1（CI continue-on-error）+ 各任务测试 |
| 复制到另两端（core 原样复制） | 架构文档第 11 节；本计划完成后的复制步骤不在本计划内 |

未覆盖（有意暂缓）：P1 业务层（离线范围、硬件矩阵、合作端形态、消息模型），以及 ADR 记录；框架冻结后另行讨论。

**2. 占位符扫描：**

- 无 "TBD/TODO/implement later"。允许的临时占位：占位页面（Home/Scan/Messages/Settings，属于框架验证）、`dynamic` 推送 payload（待消息模型确认）、staging/prod URL（待后端确认）、`/cg/auth` 字段名（Task 12 生成后校准）。
- Task 12 的过渡策略（无 `/cg/` 路径时保留全部 Schema）是显式决策并记录，不是未完成项。

**3. 类型一致性：**

- `PageRequest.pageSize` 在 Task 3 定义并在测试中一致使用（无 `pageSizeoba` 笔误）。
- `AuthTokenProvider`/`LocaleProvider` 抽象在 Task 4 定义，Task 6/9 分别绑定实现（`@LazySingleton(as: ...)`），`ApiModule.provideDio` 的四个参数与 `createDio` 一致。
- `AuthCubit` 依赖 `AuthTokenProvider` + `AuthRepository` + `SessionEvents`，Task 6 测试的 Fake 与 Task 7 路由测试一致。
- `ApiConfig.resolve` 在所有 ApiClient 测试中产生 `https://dev.drovio.ai/api/cg/...`，与 Task 12 前缀约定一致。
- `/messages/:id` 使用独立的 `MessageDetailPage`（Task 7），不指向登录页。
- `AppDatabase`/`CommandQueueDao`/`PreferencesStore` 类型在 Task 8/9 间一致（`PreferencesStore.read/write(String)`）。

已知待执行时校准点（非缺陷）：

- swagger_dart_code_generator 的 CLI/build.yaml 参数以本机 `--help` 输出为准（Task 12 Step 1 已要求先确认）。
- `server.throws` 若不存在则按 Task 4 Step 5 的备选方案调整网络错误测试。
- drift 列声明语法 `text()()` 若与安装版本不符，以 `flutter analyze` 提示为准微调（Task 8 Step 5）。

## Execution Handoff

计划已保存：`docs/superpowers/plans/2026-11-18-flutter-base-architecture.md`

两种执行方式：

**1. Subagent-Driven（推荐）** — 每个任务派发新的 subagent，任务间做两阶段审查，迭代快、上下文干净。

**2. Inline Execution** — 在当前会话按 executing-plans 批量执行，带检查点。

选哪种？
