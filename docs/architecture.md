# Drovio 三端 Flutter 基础架构设计（初稿）

- 状态：基础架构已落地（框架层 P0 完成，业务层 P1 待讨论）
- 日期：2026-11-18
- 范围：APP 基础架构 + 请求层；服务端业务仅作为接口契约边界
- 首个落地项目：仓管端（warehouse）

## 1. 目标与范围

本项目用于三个独立 App：

| App | 使用方 | 主要能力 |
|---|---|---|
| 仓管端 | 内部仓管 | 入库、出库、库存、盘点、报废、扫码、离线 |
| 运维端 | 内部运维 | 工单、设备操作、安装检测、巡检、拍照、定位 |
| 合作方端 | 外部合作方 | 经营、分润、提现、支付、工单、IC 卡 |

统一约束：

- 客户端基于 Flutter 设计。
- 三个项目使用独立仓库，不建立内部包管理，不单独设置模板仓库。
- 先在仓管项目完善基础架构，再复制到运维和合作方项目。
- 三个项目已加入 Flock 聚合工作区，基础内容变更时一起修改。
- 接口统一来自同一份 OpenAPI，各项目通过不同前缀访问。
- `core` 是可复制的基础能力，不含项目业务接口和模型。

## 2. 已确定的架构决策

| 决策点 | 结论 |
|---|---|
| 客户端技术 | Flutter + Dart |
| App 形态 | 三个独立 App，各自独立包名和发布 |
| 平台范围 | 三端同时支持 Android 和 iOS |
| 仓库策略 | 一项目一仓库；不建模板仓库、不做内部包 |
| 基础复制方式 | 在仓管项目完成 `core` 后复制到另外两个项目 |
| core 边界 | 只放通用能力，不依赖项目接口、模型、业务 |
| 项目接口 | 放在各项目 `contracts/`，不属于 `core` |
| API 契约来源 | 统一 OpenAPI，`baseUrl + projectPrefix` 按项目配置 |
| 项目前缀 | 仓管 `/cg/`、运维 `/y/`、合作端 `/h/`，后期可调整 |
| 认证体系 | 仓管/运维/Web 后台共用员工账号体系，按角色区分；合作方独立 |
| 首个项目 | 仓管端，先覆盖强离线与扫码最高风险 |
| 离线分级 | 仓管强离线、运维弱离线、合作方在线为主 |
| 多语言 | 支持泰文、中文；默认跟随系统语言，无匹配时回退泰文 |
| 推送 | Android / iOS 原生推送（Android FCM，iOS APNs） |
| 状态管理 | Bloc |
| 路由 | go_router |
| 本地数据库 | Drift + SQLite |
| 网络层 | Dio |
| API 代码生成 | swagger_dart_code_generator |
| 序列化 | freezed + json_serializable |
| 多语言实现 | Flutter gen_l10n |
| 推送实现 | firebase_messaging（FCM / APNs） |
| 扫码 | mobile_scanner，手机摄像头扫码；PDA 远期再扩展 |
| 依赖注入 | get_it + injectable |

### 2.1 技术栈基线

| 能力 | 选择 | 说明 |
|---|---|---|
| 状态管理 | Bloc | 三端统一使用，Feature 内部管理状态 |
| 路由 | go_router | 深链接、路由守卫、状态恢复 |
| 本地数据库 | Drift + SQLite | 类型安全表、迁移、流式查询 |
| 网络层 | Dio | 拦截器、重试、取消、上传 |
| API 代码生成 | swagger_dart_code_generator | 生成到 `contracts/generated/` |
| 序列化 | freezed + json_serializable | 生成 DTO 与领域模型 |
| 多语言 | Flutter gen_l10n | 泰文/中文，跟随系统并回退泰文 |
| 推送 | firebase_messaging | Android FCM / iOS APNs |
| 扫码 | mobile_scanner | 摄像头扫码 + 原生 PDA 适配 |
| 依赖注入 | get_it + injectable | 注册 Repository、Bloc 等全局服务 |

## 3. 仓库目录结构

```text
warehouse/
  lib/
    app/                组合根：启动、Shell、路由、环境
    core/               可复制基础能力
    contracts/          项目接口契约与模型
    features/           业务模块
  test/
    unit/
    widget/
    integration/
  tools/
    openapi/            OpenAPI 下载与生成脚本
  docs/
    architecture.md     本文档
    adr/                架构决策记录
```

### 3.1 core 目录

`core` 是复制到另外两个项目时基本不变的目录：

```text
core/
  api/                  通用请求管道
  auth/                 会话、Token、AuthTokenProvider
  design/               设计令牌、主题、基础组件
  i18n/                 泰文/中文、日期金额格式化
  database/             Drift、迁移、本地存储
  sync/                 离线命令队列、同步状态
  native/               扫码、相机、打印、定位、支付、推送
  media/                拍照、压缩、水印、上传队列
  messaging/            消息未读、消息路由
  observability/        日志、崩溃、埋点
  utils/                通用工具
```

### 3.2 core/api 只放通用请求能力

```text
core/api/
  api_config.dart            baseUrl、projectPrefix、环境
  api_client.dart            通用 HTTP 请求方法
  api_exception.dart         业务错误、网络错误、超时
  api_response.dart          响应解析
  pagination.dart            PageRequest / PageResult
  interceptors/              Auth、Language、Trace、Error
  events/
    event_stream_client.dart SSE 通用客户端
  upload/
    upload_client.dart       通用上传能力
```

`core/api` 不包含任何具体接口路径和业务 DTO。

### 3.3 contracts 目录

`contracts` 是项目专属部分，复制到其他项目时整体替换：

```text
contracts/
  generated/
    api/                 OpenAPI 生成的接口
    models/              OpenAPI 生成的模型
  auth/
    auth_repository.dart     登录、Profile、权限能力
  warehouse/
    inbound_contracts.dart   入库接口与模型
    outbound_contracts.dart  出库接口与模型
    inventory_contracts.dart 库存接口与模型
    stocktake_contracts.dart 盘点接口与模型
    scrap_contracts.dart     报废接口与模型
  common/
    notification_contracts.dart 三端共用的消息接口
```

### 3.4 依赖方向

```text
app
 ↓
features          页面、用例
 ↓
contracts         项目接口、DTO、Repository
 ↓
core/api          通用请求管道
```

规则：

- `core` 不依赖 `contracts`。
- `contracts` 不依赖 `features`。
- `core` 不出现“入库”“工单”“分润”等业务概念。

## 4. 分层与模块边界

每个 Feature 采用统一分层：

```text
features/inbound/
  presentation/    页面、组件、页面状态
  application/     业务流程、命令、表单
  domain/          业务模型、状态机、规则
  data/            Repository，引用 contracts 与 core
```

业务模块按能力划分，不按页面划分：

- 仓管：home、inbound、outbound、inventory、stocktake、scrap、scan、messages。
- 运维：home、work_order、device_operation、installation、asset、messages。
- 合作方：home、business、device、profit、settlement、withdrawal、payment、messages。

## 5. App Shell 设计

三个 App 各自保留独立 Shell：

```text
AppShell
 ├── 登录/会话守卫
 ├── 底部 Tab 导航
 ├── 二级页面栈
 ├── 深链接路由
 ├── 消息未读角标
 └── 会话上下文
```

仓管 Tab：首页 / 入库 / 出库 / 库存 / 我的。
运维 Tab：首页 / 工单 / 消息 / 我的。
合作方 Tab：首页 / 经营 / 消息 / 我的。

二级页面不占 Tab：入库详情、出库确认、工单详情、设备操作、IC 卡充值等放入导航栈。

## 6. 请求层设计

### 6.1 URL 与项目前缀

```text
baseUrl + projectPrefix + endpointPath
```

示例：

```text
仓管   https://dev.drovio.ai/api/cg/...
运维   https://dev.drovio.ai/api/y/...
合作方 https://dev.drovio.ai/api/h/...
```

三个项目的 `projectPrefix`：

```text
仓管   /cg/
运维   /y/
合作方 /h/
```

前缀为暂定值，后期按服务端实际路由调整；调整时只改 `ApiConfig`，不改请求层。

如果 OpenAPI 路径本身已带前缀，`projectPrefix` 可留空；具体以服务端规范为准。

### 6.2 认证

- 当前文档使用 `Authorization: Bearer <token>` header。
- `core/auth` 只提供 `AuthTokenProvider` 抽象。
- 登录、Profile 接口属于 `contracts`。
- 仓管端、运维端与 Web 管理后台使用同一套员工账号体系，通过角色和平台区分权限。
- 认证封装参考 Web 管理后台的 `/admin/auth/*` 结构：登录、注销、修改密码、当前账号 Profile。
- 仓管与运维认证接口暂定为 `/cg/auth/*`、`/y/auth/*`，具体路径以后端 OpenAPI 为准。
- 合作方端来自 W38 对应的合作方用户体系，与员工账号体系独立；合作方认证接口暂定为 `/h/auth/*`。
- Token 按当前 Web 管理后台现状处理：无过期、无刷新机制；会话失效以服务端返回为准。
- `AuthTokenProvider` 仍保留刷新扩展点，后续后端增加刷新机制时无需改业务代码。

### 6.3 错误模型

统一 `errs.Error`：

```json
{
  "code": "string",
  "message": "string",
  "details": {}
}
```

客户端转成 `ApiException`，页面按 `code` 匹配多语言文案；401 触发会话失效，403 提示无权限。

### 6.4 分页

当前规范统一：

```text
page       从 1 开始
page_size  默认 20，最大 200
```

响应统一：

```json
{
  "items": [],
  "total": 0
}
```

客户端使用统一 `PageRequest` / `PageResult<T>`。

### 6.5 语言、时间与单位

- 支持语言：泰文（`th`）和中文（`zh-Hans`）。
- 默认跟随系统语言；系统为中文时使用 `zh-Hans`，为泰文时使用 `th`，其他或无匹配时回退泰文。
- 用户可在 App 内手动切换语言；手动选择后以用户选择为准，并在本地持久化。
- 请求头固定发送 `Accept-Language: th` 或 `zh-Hans`。
- 时间使用 RFC3339 并带业务时区偏移，客户端转 UTC 保存、按业务时区展示。
- 金额单位萨当 `cents`、水量单位 `ml`，全部用整数 `int`。

### 6.6 消息推送

- Android 使用 FCM，iOS 使用 APNs，通过 Flutter 推送插件接入原生通道。
- `core/native` 提供统一 `PushGateway`，业务不直接依赖 FCM/APNs SDK。
- 推送能力包括：设备 Token 上报、前台通知、点击路由、消息未读角标。
- 具体消息内容是否同时使用 SSE 或轮询，待消息中心设计确认。

### 6.7 事件流

当前规范已包含 SSE：

- 每帧 `id`、`event`、`data`。
- 每 15 秒 `: ping` 保活。
- 断线重连携带 `Last-Event-ID`。

`core/api/events` 提供通用 `EventStreamClient`，用于未来的工单状态、消息等实时推送。

### 6.8 文件上传

当前规范存在两类上传：

- `multipart/form-data` 普通上传。
- 分片 `PUT`，携带 `Content-Range` 与 `X-Content-SHA256`。

`core/api/upload` 统一封装上传、重试与断点续传。

### 6.9 幂等与离线命令

当前 OpenAPI 未定义 `Idempotency-Key` 或 `command_id`。仓管离线、运维弱网都依赖安全重试，后续新增接口应支持：

```text
command_id      客户端生成的全局唯一操作 ID
device_id       设备 ID
operator_id     操作人
warehouse_id    数据范围
base_version    乐观锁版本
device_time     设备时间，仅参考
```

服务端确认前，本地状态只算草稿；确认后才更新业务状态。

## 7. 离线与数据

### 7.1 离线分级

| App | 策略 |
|---|---|
| 仓管 | 强离线：任务缓存、扫码结果、草稿、命令队列、断点续盘 |
| 运维 | 弱离线：工单草稿、检测进度、照片上传队列 |
| 合作方 | 在线为主：只缓存统计与列表，支付、提现、结算必须在线 |

### 7.2 本地数据

本地数据库统一使用 Drift + SQLite，主要保存：

- 会话与偏好
- 任务与实体缓存
- 操作草稿
- 命令队列
- 消息已读
- 上传任务

### 7.3 命令状态

```text
draft
→ pending
→ syncing
→ accepted
→ conflict / rejected
```

每条命令携带 `command_id`、`device_id`、`operator_id`、`warehouse_id`、`entity_id`、`base_version`、`device_occurred_at`。

## 8. 原生能力

统一 `Native Gateway`，业务模块不直接依赖第三方插件：

- `ScanGateway`：当前仅手机摄像头扫码；PDA 硬件扫码键、键盘扫码枪为远期扩展。
- `MediaGateway`：相机、相册限制、压缩、水印。
- `PrintGateway`：标签打印、蓝牙打印机。
- `PaymentGateway`：支付创建、拉起、回调确认。
- `PushGateway`：Android FCM / iOS APNs 原生推送。

## 9. 安全与权限

- 仓管/运维/Web 共用员工账号体系，通过角色与平台区分权限；合作方使用独立账号体系。
- 客户端按服务端下发的菜单/角色/能力渲染入口，服务端仍然做最终校验。
- 关键操作记录设备、账号、时间与操作结果。
- Token 暂无过期与刷新机制，存 SecureStore/Keychain；收到 401 时按会话失效处理。
- 设备绑定、PIN/生物识别、操作员切换暂不处理，等 PDA 或共享设备需求明确后再评估。
- 退出登录清理业务数据库、图片缓存、Token。

## 10. 代码生成、构建发布与测试

### 10.1 代码生成与接口同步

每个项目保留相同脚本：

```text
tools/openapi/
  refresh.sh      拉取最新 openapi.yaml，并按前缀过滤生成
  openapi.yaml    当前契约快照（原始全量）
  filter_spec.py  前缀过滤 + 引用 Schema 传递解析
  generate.dart   生成 Dart 模型与接口
  .venv/          过滤脚本运行环境（pyyaml，不入库）
```

生成输出到：

```text
lib/contracts/generated/
```

三个项目从同一 URL 拉取同一份规范；接口更新时分别重新生成并同步提交。生成范围按项目前缀过滤：

```text
仓管   refresh.sh /cg/  → 仅生成 /cg/ 路径及其引用的 Schema
运维   refresh.sh /y/   → 仅生成 /y/ 路径及其引用的 Schema
合作方 refresh.sh /h/   → 仅生成 /h/ 路径及其引用的 Schema
```

过滤时保留共享 Schema，避免引用缺失。

过滤实现：tools/openapi/filter_spec.py 仅保留项目前缀路径及被引用的共享 Schema（传递解析）；
当前快照无匹配路径时保留全部 Schema 作为过渡，后端补充接口后自动切换。
过滤后的规范写入 lib/contracts/swagger/openapi.yaml（生成器输入），
swagger_dart_code_generator 以 build_only_models 模式输出模型到 lib/contracts/generated/，
请求仍统一走 core/api 的 Dio ApiClient。

### 10.2 构建与发布（参考 heron 项目）

构建与发布沿用 heron 的既有约定，Flutter 侧按对应方式实现：

- 版本号格式 `YYYY.MM.DD-短哈希`，取提交日期与 7 位短哈希；构建号取提交数，日期按 Asia/Shanghai。
- 环境配置通过本地文件覆盖，不入 Git；命令行参数优先级高于本地文件。
- 签名材料只保存在本机，不进入仓库；存在签名材料时 debug 与 release 使用同一证书。
- CI 使用 self-hosted Linux 运行器，`fetch-depth: 0`，先跑测试再构建；CI 无签名材料时仍可完成离线构建。
- 构建产物不自动上传、不自动生成 Release 下载出口，测试包分发方式后续单独确认。
- Flutter 对应实现：环境配置用 `--dart-define-from-file` 读取本地环境文件；签名与发布材料在平台工程目录中按 heron 同规则管理。
- 分发方式：仓管端、运维端使用普通安装包分发；合作方端走应用商店发布。
- CI 运行测试并输出结果，但测试不设置覆盖率门槛，也不作为构建、发布或合并流程的阻塞条件。

三端均同时支持 Android 与 iOS。仓管/运维如后续引入 MDM，可在现有签名与分发流程上扩展。

### 10.3 测试要求

每个功能建议提供对应测试文件，测试文件与实现文件保持同目录结构：

```text
features/inbound/
  presentation/
    widgets/                widgets_test.dart
  application/
    inbound_cubit.dart      inbound_cubit_test.dart
  data/
    inbound_repository.dart inbound_repository_test.dart
```

测试分层：

- `core`：请求管道、错误映射、分页、同步队列、本地数据库迁移。
- `contracts`：DTO 解析、Repository 与 ApiClient 的交互。
- `features`：Bloc/Cubit、表单、页面组件、关键流程集成测试。
- `app`：路由、深链接、会话守卫的集成测试。

测试策略为尽量覆盖：核心业务路径尽量覆盖 unit、widget、integration 三层；生成代码不单独维护测试，由使用它的 Repository 测试覆盖。

测试定位为辅助手段：不设置固定覆盖率门槛，测试结果不影响任何构建、发布或合并流程；开发阶段尽量补充测试，但测试不作为流程阻塞条件。

## 11. 复制到另外两个项目

| 目录 | 复制方式 |
|---|---|
| `core/` | 原样复制，不修改 |
| `contracts/` | 替换为对应项目接口契约 |
| `features/` | 替换为对应项目业务模块 |
| `app/` | 修改 App 名、Tab、路由入口 |
| `tools/openapi/` | 保留，生成脚本不变 |
| `test/` | 基础测试复制，业务测试替换 |

复制完成后，三端 `core` 保持一致；后续基础能力变更在 Flock 中同步修改并统一测试。

## 12. 落地计划

### 阶段 0：设计讨论与定稿

- [x] 确认框架层待讨论项（P0）。
- [x] 冻结框架层架构决策（ADR 记录待补充）。
- [x] 确认 OpenAPI 前缀（/cg/、/y/、/h/ 暂定）与按前缀生成。

### 阶段 1：工程骨架

- [x] 创建 Flutter 项目。
- [x] 建立 `app/core/contracts/features/test/docs` 目录。
- [x] 配置 dev/staging/prod 环境。
- [x] 接入 CI：analyze、format、unit test、build。

### 阶段 2：核心能力

- [x] 路由与深链接。
- [x] 会话、登录、权限能力。
- [x] 请求层：ApiClient、Auth、Error、Pagination、SSE、分片上传。
- [x] 本地数据库与迁移。
- [x] 扫码与推送基础能力。
- [x] 设计系统与泰文/中文。
- [x] OpenAPI 契约下载与按前缀模型生成。
- [x] 版本脚本、签名配置与 release CI。

### 阶段 3：离线与同步

- 本地命令队列。
- 同步状态机与幂等。
- 上传队列与断点续传。
- 冲突处理。
- 流程草稿与断点恢复。

### 阶段 4：垂直切片

- 用仓管“入库确认”或“盘点执行”打通完整链路。
- 验证离线扫码、重启恢复、同步结果、冲突处理。
- 跑通消息、深链接与日志监控。

### 阶段 5：复制与固化

- 编写复制清单。
- 复制到运维与合作方项目。
- 三端基础能力保持一致。

## 13. 验收标准

- 离线扫码 200 条，杀掉 App 再重启，数据不丢。
- 同一命令重复提交，服务端只生效一次。
- 网络恢复后同步队列自动完成，冲突可见可处理。
- 安装检测中断后能断点续跑。
- Token 过期自动刷新，退出登录后本地敏感数据全部清理。
- 深链接能从消息跳到对应业务详情。
- 泰文/中文切换不丢页面状态。
- `core` 中不存在对 `contracts` / `features` 的依赖。
- 复制后只需修改 `contracts`、`features`、`app`，`core` 不变。

## 14. 待讨论项

### P0：框架层（当前讨论范围）

1. **技术栈细节**
   - 状态管理、路由、数据库、网络、代码生成、多语言、推送、扫码已按技术栈基线确认。
   - 依赖注入已确定为 get_it + injectable。

2. **项目前缀与 OpenAPI 契约**
   - 前缀已暂定为 `/cg/`、`/y/`、`/h/`，后期按服务端实际路由调整。
   - 登录、Profile 使用各自前缀，暂定 `/cg/auth/*`、`/y/auth/*`、`/h/auth/*`。
   - 当前 OpenAPI 尚无仓管入库/出库/盘点等接口，由谁、何时补充？

3. **认证与安全**
   - 认证封装参考 Web 管理后台 `/admin/auth/*` 结构，已写入 6.2。
   - 仓管/运维/Web 共用员工账号，合作方独立账号，已写入 6.2。
   - Token 暂无过期与刷新机制，沿用当前 Web 管理后台行为。
   - 设备绑定、PIN/生物识别、操作员切换暂不处理，等 PDA 或共享设备需求明确后再评估。

4. **API 代码生成范围**
   - 已确定使用 swagger_dart_code_generator。
   - 已确定按项目前缀过滤生成，并保留引用到的共享 Schema。

5. **构建与发布**
   - 已确定参考 heron 项目：版本号、环境配置、签名、CI 约定见 10.2。
   - 三端同时支持 Android 与 iOS，已确定。
   - 仓管/运维普通安装包分发，合作方走应用商店，已确定。

6. **框架测试策略**
   - 每个功能建议提供对应测试文件，分层见 10.3。
   - 测试策略为尽量覆盖，核心业务路径覆盖 unit、widget、integration 三层。
   - 不设固定覆盖率门槛，测试不阻塞构建、发布或合并流程，已确定。

### P1：业务层（暂缓讨论，先完成整体框架）

7. **离线范围**
   - 仓管首批哪些操作允许离线：入库确认、盘点、扫码记录、报废？
   - 冲突处理规则：以服务端为准还是人工处理？
   - 幂等契约 `command_id` 是否已由后端支持，字段叫什么？

8. **硬件矩阵**
   - 暂不讨论；当前无 PDA 设备，扫码只通过手机摄像头实现。
   - PDA、硬件扫码键、键盘扫码枪、标签打印均为远期计划。

9. **合作方端形态**
   - 是原生 App，还是 H5/小程序优先？若只做 App，是否需要 iOS？

10. **消息与推送细节**
   - 原生推送通道已确定（Android FCM / iOS APNs），但消息类型与通知文案来源待确认。
   - 消息未读数由服务端下发还是本地合并，是否需要统一接口？

## 15. 建议的讨论顺序

1. 先完成框架层 P0：OpenAPI 契约、认证、代码生成范围、构建发布、测试策略。
2. 业务层问题在框架冻结后再讨论。
3. 每确认一项，本文档同步更新并记录到 `docs/adr/`。
