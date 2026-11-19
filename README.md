# partner

Drovio 合作方端 App（Android + iOS），基于 Flutter 开发。合作方端为独立账号体系，与仓管/运维/Web 管理后台的员工账号体系分开。

架构设计见 [docs/architecture.md](docs/architecture.md)，构建与发布见 [docs/build.md](docs/build.md)。

## 三端说明

| App | 使用方 | API 前缀 | 主要能力 | 离线策略 |
| --- | --- | --- | --- | --- |
| 仓管端 | 内部仓管 | `/cg/` | 入库、出库、库存、盘点、报废、扫码 | 强离线 |
| 运维端 | 内部运维 | `/y/` | 工单、设备操作、安装检测、巡检 | 弱离线 |
| 合作方端（本项目） | 外部合作方 | `/h/` | 经营、分润、提现、支付、IC 卡 | 在线为主 |

仓库策略：一项目一仓库，不做内部包管理、不设模板仓库；本项目从仓管端（warehouse）复制基础架构后继续开发，后期并入 Flock 聚合工作区统一维护。

## 技术栈

| 能力 | 选择 |
| --- | --- |
| 客户端 | Flutter 3.38 + Dart 3.10，Android + iOS 同时发布，包名 `com.drovio.partner` |
| 状态管理 | Bloc（flutter_bloc） |
| 路由 | go_router |
| 本地数据库 | Drift + SQLite |
| 网络层 | Dio（拦截器、重试、SSE、分片上传） |
| API 代码生成 | swagger_dart_code_generator |
| 序列化 | freezed + json_serializable |
| 依赖注入 | get_it + injectable |
| 多语言 | Flutter gen_l10n（泰文 `th` / 中文 `zh-Hans`，默认跟随系统，无匹配回退泰文） |
| 推送 | firebase_messaging（Android FCM / iOS APNs） |
| 扫码 | mobile_scanner（手机摄像头；PDA 为远期计划） |
| 安全存储 | flutter_secure_storage |

## 目录结构

```text
partner/
  lib/
    app/                组合根：启动、路由、Shell、环境、DI
    core/               可复制基础能力（不依赖项目业务）
    contracts/          项目接口契约、DTO、Repository
    features/           业务模块（auth、home、messages、scan、settings…）
    l10n/               泰文/中文资源与生成代码
  test/
    unit/               单元测试
    widget/             Widget 测试
  integration_test/     真机/模拟器集成测试
  tools/
    openapi/            OpenAPI 下载、过滤、生成脚本
    version.sh          从 pubspec.yaml 读取版本号
  docs/                 架构与构建文档
```

依赖方向：`app → features → contracts → core/api`。`core` 不依赖 `contracts` / `features`，保证复制到其他项目时基本不变。

## 快速开始

### 环境要求

| 项目 | 要求 |
| --- | --- |
| Flutter | 3.38.10（Dart 3.10.9） |
| Android | Android SDK，minSdk 24 / targetSdk 36 |
| iOS | Xcode + CocoaPods（本机出包） |

### 本地配置

```bash
cp .env.local.example .env.local   # 不入库，可按环境修改
cp android/keystore.properties.example android/keystore.properties   # 签名配置，仅本机
```

`flutter run` / `flutter build` 时加 `--dart-define-from-file=.env.local`；`AppConfig.fromDartDefines()` 读取环境与 API 地址。默认值见 [docs/build.md](docs/build.md)。

### 运行与构建

```bash
flutter pub get
flutter run --dart-define-from-file=.env.local          # 连接设备/模拟器运行
flutter build apk --debug                               # debug APK
source <(bash tools/version.sh)                         # 读取版本号
flutter build apk --release --build-name "$VERSION" --build-number "$BUILD_NUMBER"   # Android release
flutter build ipa --release --build-name "$IOS_VERSION" --build-number "$BUILD_NUMBER"  # iOS（Mac 本地）
flutter test                                            # 单元 + Widget 测试
flutter test integration_test/app_launch_test.dart -d <device>   # 集成测试
```

安装到测试机：`adb install -r build/app/outputs/flutter-apk/app-release.apk`。

### 版本号

唯一来源为 `pubspec.yaml` 的 `version` 字段（格式 `YYYY.MM.DD+构建号`，如 `2026.11.19+15`）。Android 的 versionName/versionCode 与 iOS 的 CFBundleShortVersionString/CFBundleVersion 均取自该字段，两端保持一致；发版前只修改 pubspec，不要另传其他构建参数。

### 签名

- 证书：`android/platform.jks`（keytool 生成，别名 `partner`），debug 与 release 使用同一证书
- 本地配置：`android/keystore.properties`（含 storeFile / storePassword / keyAlias / keyPassword），与 `platform.jks` 均不入库
- CI：从 Actions secrets（`ANDROID_KEYSTORE_BASE64`、`ANDROID_KEYSTORE_PASSWORD`、`ANDROID_KEY_ALIAS`、`ANDROID_KEY_PASSWORD`）恢复签名材料；未配置时回退 debug 证书
- iOS 签名材料（证书、描述文件）在 Mac 本地管理，不入库

## 接口契约与代码生成

所有接口来自同一份 OpenAPI：`https://dev.drovio.ai/api/docs/openapi.yaml`。请求路径为 `baseUrl + projectPrefix + endpointPath`，本仓库前缀 `/h/`（合作方），后期按服务端实际路由调整时只改 `ApiConfig`。

```bash
bash tools/openapi/refresh.sh    # 拉取最新规范，按前缀过滤并生成模型
```

过滤后的规范写入 `lib/contracts/swagger/openapi.yaml`，生成的模型与接口输出到 `lib/contracts/generated/`。生成代码不手改；接口更新后重新生成并提交。

## 多语言、推送与扫码

- 多语言：泰文/中文，跟随系统语言，无匹配回退泰文；App 内可手动切换并本地持久化；请求头固定发送 `Accept-Language`
- 推送：Android FCM / iOS APNs。`android/app/google-services.json`、`ios/Runner/GoogleService-Info.plist` 本机放置不入库；未配置时构建仍可通过，运行时降级为推送不可用
- 扫码：mobile_scanner 手机摄像头扫码；PDA 硬件扫码键、键盘扫码枪为远期扩展

## 测试

- 每个功能提供对应测试文件，与实现同目录结构（如 `inbound_cubit.dart` 对应 `inbound_cubit_test.dart`）
- 覆盖分层：`core`（请求管道、错误映射、数据库）、`contracts`（DTO 解析、Repository）、`features`（Bloc、表单、页面）、`app`（路由、深链接、会话守卫）
- 测试是辅助手段：不设固定覆盖率门槛，测试不阻塞构建、发布或合并流程

## CI 与发布

- Runner：开发服务器 self-hosted（label `dev-drovio`），Android SDK 常驻
- [ci.yml](.github/workflows/ci.yml)：push / PR 到 `master` 时执行格式检查、analyze、测试、debug 构建
- [release.yml](.github/workflows/release.yml)：手动触发，构建正式签名 release APK 并上传 artifact（`partner-android-release`）；iOS job 保留，接入 macOS runner 后启用
- 分发：仓管端/运维端普通安装包；合作方端走应用商店（本项目为合作方端）

## 提交规则

遵循 [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)：

```text
<type>(<scope>): <中文描述，结尾不加句号>
```

- type：`feat` / `fix` / `refactor` / `perf` / `docs` / `style` / `test` / `build` / `ci` / `chore`
- 提交信息不带任何 AI 署名或工具标识
- 一个小功能完整跑通（格式、analyze、测试、构建）再提交；不相关改动分开提交
- 签名文件、`.env.local`、`local.properties`、APK、构建缓存不入库

## 文档索引

- [docs/architecture.md](docs/architecture.md)：三端定位、core 边界、请求层、离线分级、落地计划与待讨论项
- [docs/build.md](docs/build.md)：版本号、环境配置、签名与 CI secrets、真机验收清单
- [AGENTS.md](AGENTS.md) / [CLAUDE.md](CLAUDE.md)：开发规则与操作速查
