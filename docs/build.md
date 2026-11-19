# 构建与发布（参考 heron 项目）

## 版本号

- 唯一来源为 `pubspec.yaml` 的 `version` 字段，格式：`YYYY.MM.DD+<构建号>`，如 `2026.11.19+15`。
- Android 的 versionName/versionCode、iOS 的 CFBundleShortVersionString/CFBundleVersion 均取自该字段，两端保持一致。
- 生成方式：`source <(bash tools/version.sh)`，输出 `VERSION` / `BUILD_NUMBER` / `IOS_VERSION`（均来自 pubspec）。
- 发版前手动修改 pubspec.yaml 的 version，不要再用 `--build-name/--build-number` 传入其他值。

## 环境配置

- 复制 `.env.local.example` 为 `.env.local`（不入库），flutter run/build 时加 `--dart-define-from-file=.env.local`。
- `AppConfig.fromDartDefines()` 读取环境与 API 地址，见 `docs/architecture.md`。

## 签名

- 签名材料只在本机，不入库；`android/keystore.properties.example` 复制为 `android/keystore.properties`。
- 证书为 `android/platform.jks`（keytool 生成，别名 `warehouse`），debug 与 release 使用同一证书。
- 存在签名材料时 debug/release 均使用该证书；无签名材料时回退 debug 证书（CI 可离线构建，安装包仅用于验证）。
- iOS 签名材料（证书、描述文件）在 Mac 本地管理，不入库。

### CI 签名（Actions secrets）

CI 上由 workflow 从 Actions secrets 恢复签名材料，密钥不写入仓库：

1. 在仓库 Settings → Secrets and variables → Actions 配置 4 个 secret：
   - `ANDROID_KEYSTORE_BASE64`：`base64 -i android/platform.jks | tr -d '\n' | pbcopy`（不要带换行）
   - `ANDROID_KEYSTORE_PASSWORD`：keystore 密码
   - `ANDROID_KEY_ALIAS`：`warehouse`
   - `ANDROID_KEY_PASSWORD`：key 密码
2. CI 步骤将 base64 解码为 `android/platform.jks`，并从 secrets 生成 `android/keystore.properties`。
3. 未配置 secret 时该步骤跳过，构建使用 debug 证书回退（仅用于验证，不可用于正式分发）。

## 构建命令

- Android release：

  ```bash
  source <(bash tools/version.sh)
  flutter build apk --release --build-name "$VERSION" --build-number "$BUILD_NUMBER"
  ```

- iOS release（Mac 本地）：

  ```bash
  source <(bash tools/version.sh)
  flutter build ipa --release --build-name "$IOS_VERSION" --build-number "$BUILD_NUMBER"
  ```

- 集成测试（真机/模拟器）：

  ```bash
  flutter test integration_test/app_launch_test.dart -d <device>
  ```

- debug：`flutter build apk --debug`

## Firebase 配置

- `android/app/google-services.json`、`ios/Runner/GoogleService-Info.plist` 本地放置，不入库。
- 未配置时 debug/release 构建仍可通过；推送在运行时降级为不可用（`FirebasePushGateway.init` 捕获异常）。

## 分发

- 仓管端/运维端：普通安装包分发。
- 合作方端：应用商店（本项目为仓管端，仅参考）。

## 真机验收清单

- 扫码：手机摄像头扫描条形码/二维码，成功回调触发业务处理。
- 推送：前台通知展示、点击路由、设备 token 上报到 `devices/push-token`。
- 多语言：切换系统语言为泰文/中文，跟随系统且无匹配回退泰文。
- 会话：401 后自动回到登录页并清理本地会话。
