# 版本记录

[English](CHANGELOG.md)

本文档记录 Codex Remote Runtime 面向用户的变化。项目采用
[语义化版本](https://semver.org/lang/zh-CN/)。只有当不可变 Git Tag、完成签名和
Runtime 资产和 GitHub Release 均已公开时，该版本才算对外发布。稳定版另外要求
Developer ID 签名和 Apple 公证。

## 尚未发布

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

- 此 Beta 为闭源、未签名且未经过 Apple 公证，许可见
  [BETA-LICENSE](BETA-LICENSE)。
- 仅支持 Apple Silicon Mac。
- 手机只能在同一局域网内访问，尚不支持公网访问和 TLS。
- 每台已配对设备使用一个 Safari 标签；多个标签同时刷新可能被重放保护撤销会话。

每个公开版本都提供不可变 Git Tag 和 GitHub Release，其中包含安装包、校验值、
兼容 Manifest 和发布说明。

[0.2.0-beta.1]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.1
