# partner

Drovio 合作方端 Flutter App（Android + iOS）。合作方端使用独立账号体系，与仓管/运维/Web 管理后台的员工账号体系分开。

## 定位

- 仓库策略：一项目一仓库；不做内部包管理、不设模板仓库。本仓库由仓管端（warehouse）基础架构复制而来，后期并入 Flock 聚合工作区统一维护基础内容
- `core/` 是复制到其他项目时基本不变的基础能力；项目接口、DTO、Repository 放 `contracts/`，不属于 `core`
- 依赖方向：`app → features → contracts → core/api`；`core` 不得依赖 `contracts` / `features`，不得出现“入库”“工单”“分润”等业务概念
- 接口统一来自同一份 OpenAPI（`https://dev.drovio.ai/api/docs/openapi.yaml`），本仓库按前缀 `/h/` 过滤生成，请求路径为 `baseUrl + projectPrefix + endpointPath`
- 离线分级：合作方在线为主（只缓存统计与列表，支付、提现、结算必须在线）；扫码当前仅手机摄像头（mobile_scanner），PDA 为远期计划
- 当前阶段：框架层 P0 已落地（路由、会话、请求层、数据库、扫码、推送、设计系统、多语言、OpenAPI 生成、CI、签名），业务层 P1 与离线同步待开发，见 `docs/architecture.md`

## 技术栈

- Flutter 3.38 + Dart 3.10；包名 `com.drovio.partner`；minSdk 24 / targetSdk 36；Android 与 iOS 同时发布
- 状态管理 Bloc（flutter_bloc）；路由 go_router；本地数据库 Drift + SQLite；网络层 Dio；依赖注入 get_it + injectable
- API 模型由 swagger_dart_code_generator 生成到 `lib/contracts/generated/`；DTO 序列化用 freezed + json_serializable
- 多语言 Flutter gen_l10n：泰文 `th`、中文 `zh-Hans`；默认跟随系统语言，无匹配回退泰文；请求头固定发送 `Accept-Language`
- 推送 firebase_messaging：Android FCM / iOS APNs，由 `core/native` 的 `PushGateway` 统一封装，业务不直接依赖插件
- 扫码 mobile_scanner：仅手机摄像头；PDA 硬件扫码键、键盘扫码枪为远期扩展点（`ScanGateway`）

## 关键约定

- **core 边界**：`core/api` 只放通用请求管道（ApiClient、拦截器、异常、分页、SSE、分片上传），不包含具体接口路径与业务 DTO
- **认证**：封装参考 Web 管理后台 `/admin/auth/*` 结构；登录、Profile 属于 `contracts/auth`；`core/auth` 只提供 `AuthTokenProvider` 抽象与会话存储
- **Token 现状**：按当前 Web 管理后台处理，无过期、无刷新机制；收到 401 视为会话失效并清理本地会话；`AuthTokenProvider` 保留刷新扩展点，后端增加刷新机制后无需改业务代码
- **生成代码**：`lib/contracts/generated/`、`*.g.dart`、`injection.config.dart` 由生成器输出，不手改；OpenAPI 更新后用 `tools/openapi/refresh.sh` 重新生成并提交
- **错误模型**：统一 `errs.Error`（code/message/details），页面按 `code` 匹配多语言文案；403 提示无权限
- **版本号**：唯一来源 `pubspec.yaml` 的 `version` 字段（`YYYY.MM.DD+构建号`，如 `2026.11.19+15`）；Android versionName/versionCode 与 iOS CFBundleShortVersionString/CFBundleVersion 均取自该字段，两端保持一致；发版前只改 pubspec
- **签名**：debug 与 release 共用同一证书 `android/platform.jks` + `android/keystore.properties`（均不入库）；CI 从 Actions secrets（`ANDROID_KEYSTORE_BASE64` 等）恢复签名材料，未配置时回退 debug 证书
- **测试定位**：每个功能提供对应测试文件（与实现同目录结构）；核心路径尽量覆盖 unit / widget / integration；不设覆盖率门槛，测试不阻塞构建、发布或合并流程
- **CI**：self-hosted runner（label `dev-drovio`）；`ci.yml` 做格式、分析、测试、debug 构建，`release.yml` 手动触发出正式签名 APK 并上传 artifact；iOS 当前在本机出包，接入 macOS runner 后再启用对应 job

## 常用命令

```bash
flutter pub get
dart format lib test
flutter analyze --no-fatal-infos
flutter test
dart run build_runner build --delete-conflicting-outputs   # injectable / json / 生成代码
bash tools/openapi/refresh.sh                              # 拉取并过滤生成 OpenAPI 模型
flutter run --dart-define-from-file=.env.local             # 先复制 .env.local.example
source <(bash tools/version.sh)
flutter build apk --release --build-name "$VERSION" --build-number "$BUILD_NUMBER"
flutter test integration_test/app_launch_test.dart -d <device>
```

## 提交规则

- 遵循 [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)：`<type>(<scope>): <描述>`，type 取 `feat` / `fix` / `refactor` / `perf` / `docs` / `style` / `test` / `build` / `ci` / `chore`，scope 按目录（如 `core`、`contracts`、`auth`、`ci`）
- 描述用中文，结尾不加句号；提交信息不得出现 AI 署名或工具标识（无 `Co-Authored-By`、`Generated with` 类字样）
- 一个小功能完整跑通（格式、analyze、测试、构建通过）再提交；不提交半成品；不相关改动分开提交
- `local.properties`、`.env.local`、签名文件、APK、构建缓存不入库，`.gitignore` 已覆盖
- 远端为 SSH（`git@github.com:droviotech/partner.git`），普通推送 `master`；基础架构、CI、签名、文档有变更时同步更新 `docs/` 与本文件

## 文档索引

- 架构设计：[docs/architecture.md](docs/architecture.md)：三端定位、core 边界、请求层、离线分级、待讨论项
- 构建与发布：[docs/build.md](docs/build.md)：版本号、环境配置、签名与 CI secrets、真机验收清单
