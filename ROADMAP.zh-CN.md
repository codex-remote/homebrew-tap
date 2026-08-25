# Codex Remote Roadmap

[English](ROADMAP.md) | [返回 README](README.zh-CN.md)

本 Roadmap 只覆盖公开的 Codex Remote macOS Runtime 和 Mobile Web 体验，用于说明方向，
不代表发布日期或兼容性承诺。只有完成实现和真机验证后，条目才会进入已交付状态。

## 当前可用

- 通过第三方 Homebrew Tap 分发的 Apple Silicon macOS Runtime。
- iPhone Safari 在同一局域网内访问。
- 浏览项目和 Codex 会话、发送任务、查看实时状态和结果。
- 一次性二维码或链接配对、浏览器退出、凭证刷新和重放保护。
- 用户级 Setup、隔离的 PostgreSQL 与内置 Valkey 状态、单一 Runtime 登录项、健康
  检查、Repair、诊断和显式数据清理。

## 下一步可靠性工作

- 在顶层 CLI 中提供受支持的设备列表和单设备撤销命令。
- 在保留服务端重放保护的同时，避免 Safari 多标签并发刷新导致已配对会话失效。
- 改进已保存端口冲突的诊断，并清晰区分 Runtime 本机健康与 iPhone 到 Mac 的网络
  可达性。
- 每个公开 Beta 持续覆盖干净安装、升级、回滚、卸载和真机回归。

## Stable 分发门禁

- 使用 Apple Developer ID 对 Runtime 可执行文件签名，并对公开产物完成 Apple 公证。
- 完成许可证审查，同时保留不可变 Release Manifest 和校验值。
- 在干净的受支持 Mac 上验证安装、升级、回滚、诊断和真机配对。
- 只有签名、公证后的 Runtime 满足 Homebrew 政策，才推进官方 Homebrew Cask。在此
  之前继续使用当前第三方 Tap 安装。

## 当前不提供

- Intel、Windows 或 Linux Runtime 包。
- 手机连接的公网端点或 TLS。
- 面向普通用户的 Mac 端设备管理顶层命令。
- Beta 版本的生产支持或兼容性承诺。

只有公网访问所需的身份认证、传输安全、防滥用、容量限制、恢复行为和运维验证全部
实现并记录后，才会对外宣传该能力。

## 反馈

可通过 [GitHub Issues](https://github.com/codex-remote/homebrew-tap/issues) 提交可复现的
问题或具体工作流需求。不要附带配对链接、二维码、凭证、私有源代码或未经检查的诊断
日志。

安全问题请使用
[私密漏洞报告](https://github.com/codex-remote/homebrew-tap/security/advisories/new)。
