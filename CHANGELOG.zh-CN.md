# 版本记录

[English](CHANGELOG.md)

本文档记录 Codex Remote Runtime 面向用户的变化。项目采用
[语义化版本](https://semver.org/lang/zh-CN/)。只有当不可变 Git Tag、完成签名和
Apple 公证的 Runtime 资产以及 GitHub Release 均已公开时，该版本才算正式发布。

## 尚未发布

### 计划版本：0.2.0

Runtime `0.2.0` 已通过本地安装和真机验收，但仍然是发布候选，目前还不能从这个
仓库安装。

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

- 公开 Runtime 压缩包尚未完成许可证、签名、公证和上传。
- 仅支持 Apple Silicon Mac。
- 手机只能在同一局域网内访问，尚不支持公网访问和 TLS。
- 每台已配对设备使用一个 Safari 标签；多个标签同时刷新可能被重放保护撤销会话。

## 已发布版本

目前还没有公开发布的版本。未来每个正式版本都会提供 Git Tag 和 GitHub Release，
其中包含安装包、校验值、兼容 Manifest 和发布说明。
