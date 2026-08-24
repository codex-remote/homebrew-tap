# Codex Remote

[English](README.md)

Codex Remote 把手机变成 Codex 的远程工作台，Mac 仍然是实际执行机器。你可以在
Mac 上启动任务后离开电脑，再通过手机 Safari 查看项目和会话、提交后续任务，并在
局域网内接收运行状态与结果。

它解决的是一个很具体的问题：Codex 执行长任务时，使用者不必一直守在运行任务的
Mac 前。

Codex Remote 不是远程桌面。它不会传输整个屏幕，也不会接管鼠标和键盘；它与 Mac
上的 Codex Runtime 交换结构化的项目、会话、任务、状态和结果。

## 工作方式

```text
手机 Safari -> 本地 Gateway -> Run Server -> Mac Agent -> Codex App Server
```

项目文件和 Codex 执行过程始终留在 Mac 上。手机只连接本地 Gateway，Runtime 负责
鉴权请求、实时状态和结果传递。首个版本仅支持 Apple Silicon Mac。

## 发布状态

Runtime `0.2.0` 已通过本地安装和真机验收，但尚未公开发布。只有在完成二进制许可、
Developer ID 签名、Apple 公证、不可变 Tag 和资产发布，以及干净 Mac 验收后，下面
的命令才会真正可用：

```bash
brew trust --formula codex-remote/tap/codex-remote
brew install codex-remote/tap/codex-remote
codex-remote setup --workspace-root ~/work
codex-remote pair
```

Homebrew 6 要求使用者显式信任第三方 Formula。这个信任步骤由 Homebrew 管理，
Formula 不能代替使用者自动完成。

## install 与 setup 的职责

`brew install` 只安装不可变的 Runtime 文件和由 Homebrew 管理的 `postgresql@17`
依赖。它不会初始化数据库、生成密钥、选择端口、扫描工作区、注册后台服务，也不会
启动 Codex Remote。

`codex-remote setup` 负责当前用户的配置：查找并验证 Codex，在
`~/Library/Application Support/CodexRemote` 下创建隔离的 PostgreSQL 数据和内置
Valkey 状态，选择并保存可用端口，执行迁移，把密钥写入 Keychain，注册服务并检查
健康状态。用户现有的 PostgreSQL、Redis 或 Valkey 不会被修改、停止、取消链接或
复用。

随后运行 `codex-remote pair`，显示手机访问所需的局域网地址和二维码。

## Tap 路径是什么意思

Formula 的完整名称是 `codex-remote/tap/codex-remote`：

- 第一个 `codex-remote` 是 GitHub 组织名。
- `tap` 按 Homebrew 约定映射到名为 `homebrew-tap` 的仓库。
- 最后一个 `codex-remote` 对应该仓库中的 `Formula/codex-remote.rb`。

Tap 注册后，后续升级和重新安装可以使用较短的 Formula 名称。在一台从未注册该
Tap 的干净 Mac 上直接执行 `brew install codex-remote`，属于后续的官方 Homebrew
Cask 里程碑，需要先通过 Homebrew 官方仓库审核。

## 公开分发边界

这是 Codex Remote 唯一的公开分发仓库。它保存 Homebrew Formula 元数据；正式发布
某个版本时，对应的签名、公证 Runtime 资产也会附加到本仓库的 GitHub Release。

实现源码以及内部产品、架构、协议和发布文档暂不公开。公开资产只包含应用 Runtime、
必要的许可证声明、校验值、Manifest 和面向用户的安装说明。这里不得提交凭据、私有
源码、内部文档或指向本地文件的 `file://` 地址。
