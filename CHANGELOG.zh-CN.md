# 版本记录

[English](CHANGELOG.md)

本文档记录 Codex Remote Runtime 面向用户的变化。项目采用
[语义化版本](https://semver.org/lang/zh-CN/)。只有当不可变 Git Tag、Runtime 资产
和 GitHub Release 均已公开时，该版本才算对外发布。稳定版另外要求 Developer ID
签名和 Apple 公证。

## 尚未发布

### 变更

- Codex Remote 源码仓库采用 Apache License 2.0 开源，同时保留已发布 Beta 归档的
  历史许可。

## [0.2.0-beta.10] - 2026-09-23

### 变更

- 配对输出改为统一的彩色终端排版：标题、有效期、安全提示、可复制 URL、二维码区域
  和 PNG 路径清晰分隔。
- URL 内容保持纯文本，便于可靠复制；`NO_COLOR` 和非 TTY 输出仍保持稳定、可检索。

## [0.2.0-beta.9] - 2026-09-23

### 修复

- 恢复 `codex-remote pair` 默认在终端输出二维码和可复制的鉴权配对 URL。
- `codex-remote start` 和 `codex-remote restart` 服务就绪后也会输出同样的一次性终端
  二维码和 URL。
- PNG 仍可通过 `--terminal=false --output` 显式生成。

## [0.2.0-beta.8] - 2026-09-23

### 修复

- 直接运行 `codex-remote pair` 时默认生成紧凑的私有 PNG，并在 macOS 图片查看器中
  打开，让 iPhone 相机扫描稳定的像素二维码。
- 改用 ZXing 兼容的高容错矩阵、显式四模块静区和完整终端背景色单元，确保三个定位
  方框保持闭合。
- 将 PNG 模块缩小为 5px，不使用插值；当前配对链接生成的图片约为 285 x 285。

## [0.2.0-beta.7] - 2026-09-23

### 修复

- 让标准二维码静区与终端半块行保持对齐，确保顶部定位图案边框连续，不再像二维码
  上方多出一条悬空黑线。
- 默认相机模式收敛到约 45 x 23 个终端字符，同时保留纯黑/纯白 ANSI 背景和显式的
  其他渲染模式。

## [0.2.0-beta.6] - 2026-09-22

### 修复

- 将过大的全块终端配对二维码替换为中等尺寸相机模式，使用纯黑/纯白 ANSI 背景、
  正方形比例半块和额外静区边界。
- 避免字体渲染在二维码实心模块之间产生缝隙，同时保留大号、紧凑和小号渲染模式供
  显式选择。

## [0.2.0-beta.5] - 2026-09-22

### 修复

- 默认使用大号正方形全块终端二维码，普通 iPhone 相机不再依赖终端字体的宽高比例。

## [0.2.0-beta.4] - 2026-09-22

### 修复

- 重启和启动失败回滚会等待 Runtime Supervisor 进程树及持久化端口完全退出。
- 保留原生 WebSocket 项目/Turn 路由，同时只持久化 Runtime HTTP 创建的 Run。

### 文档

- 增加运行要求、配对生命周期、安全与网络模型、故障排查、Beta 限制，以及经过验证的
  卸载和彻底清理说明。
- 增加公开 Roadmap、贡献与安全说明、结构化 Issue 表单，以及更清晰的内容入口和项目
  支持说明。
- 使 Formula 描述与 caveats 和“远程工作台”的产品定位及数据保留行为保持一致。

## [0.2.0-beta.3] - 2026-08-24

### 变更

- 将五个独立登录项收敛为一个 `com.codex-remote.runtime` LaunchAgent，由
  Supervisor 管理全部 Runtime 进程，同时保留各服务独立日志。
- 升级修复会先卸载五个精确的旧 LaunchAgent Label 并删除对应 plist，再启动
  Supervisor。

## [0.2.0-beta.2] - 2026-08-24

### 修复

- 对 Valkey 配置中的默认 macOS 状态路径和密码进行引用与转义，避免
  `Application Support` 中的空格导致启动失败。
- 服务就绪检查失败时，只回滚本次 Setup 新加载的 LaunchAgent。

## [0.2.0-beta.1] - 2026-08-24

首个 Apple Silicon 公开 Beta，基于已经完成本地安装和真机验收的 `0.2.0` 候选版本。

### 新增

- 通过 Homebrew 分发的 Apple Silicon Mac Runtime。
- 在同一局域网内通过 iPhone Safari 使用 Codex。
- 二维码配对、刷新恢复、退出和 Mac 端撤销访问。
- 从手机查看项目和 Codex 会话。
- 发送任务、查看实时状态、执行活动和最终结果。
- 用户级 Setup，自动查找 Codex 并选择可用端口。
- 隔离的 PostgreSQL 和内置 Valkey 数据，不修改用户已有的 PostgreSQL、Redis 或
  Valkey 安装。
- 后台服务、健康检查和 `codex-remote doctor` 诊断命令。

### 当前限制

- 已由 `0.2.0-beta.2` 取代：使用默认 macOS `Application Support` 状态路径时，
  Setup 无法启动 Valkey。
- 此 Beta 为闭源、未签名且未经过 Apple 公证，许可见
  [BETA-LICENSE](BETA-LICENSE)。
- 仅支持 Apple Silicon Mac。
- 手机只能在同一局域网内访问，尚不支持公网访问和 TLS。
- 每台已配对设备使用一个 Safari 标签；多个标签同时刷新可能被重放保护撤销会话。

每个公开版本都提供不可变 Git Tag 和 GitHub Release，其中包含安装包、校验值、
兼容 Manifest 和发布说明。

[0.2.0-beta.1]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.1
[0.2.0-beta.2]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.2
[0.2.0-beta.3]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.3
[0.2.0-beta.4]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.4
[0.2.0-beta.5]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.5
[0.2.0-beta.6]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.6
[0.2.0-beta.7]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.7
[0.2.0-beta.8]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.8
[0.2.0-beta.9]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.9
[0.2.0-beta.10]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.10
