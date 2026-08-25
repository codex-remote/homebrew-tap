# Codex Remote

[English](README.md) | [安装](#快速开始) | [产品界面](#产品界面) | [Roadmap](ROADMAP.zh-CN.md) | [版本发布](https://github.com/codex-remote/homebrew-tap/releases)

**把手机作为远程工作台，继续使用运行于 Mac 的 Codex。**

Codex Remote 适合那些不值得一直守在电脑前等待的任务。你可以在 Mac 上开始工作，
然后在同一局域网内通过手机查看进度、发送后续要求或阅读结果。

它不是远程桌面。手机直接使用 Codex 的项目、会话、任务、状态和结果，不会传输整个
Mac 屏幕，也不会控制鼠标和键盘。

## 你可以做什么

- 查看 Mac 上可用的项目和 Codex 会话。
- 从手机发起任务，或继续已有对话。
- 实时查看任务状态并接收结果。
- 让项目文件和 Codex 执行过程始终留在 Mac 上。

## 产品界面

下方截图展示了项目与会话导航、实时连接状态、任务结果，以及向 Codex 发送后续要求的
输入框。

<p align="center">
  <img src="assets/mobile-projects.png" alt="iPhone 上的 Codex Remote 项目与会话导航" width="360">
  <img src="assets/mobile-conversation.png" alt="在 iPhone 上查看已经完成的 Codex 任务" width="360">
</p>

截图使用通用示例项目和任务，不包含任何个人工作区或真实会话数据。

## 工作方式

![Codex Remote 通过局域网连接 iPhone 和 Mac](assets/local-network-architecture.svg)

手机直接连接 Mac 上的 Codex Remote Gateway。Gateway 将请求交给 Codex Remote，
后者使用同一台 Mac 上的 Codex 和项目。整个过程不传输 Mac 屏幕，也不远程控制鼠标
和键盘。

## 运行要求

- Apple Silicon Mac；此 Beta 不支持 Intel Mac。
- macOS 和 [Homebrew](https://brew.sh/)；Formula 没有声明具体的最低 macOS 版本。
- Mac 已安装并登录 Codex CLI `0.148.0` 或更高版本。Runtime `0.2.0-beta.3`
  已测试到 `codex-cli 0.149.0-alpha.4.1`。
- 使用 iPhone Safari；此 Beta 尚未验证其他手机和浏览器组合。
- iPhone 与 Mac 位于同一局域网，Mac 保持开机、唤醒并能够运行 Codex。
- 局域网和防火墙规则允许 iPhone 访问 Setup 选定的 Gateway 端口；不支持公网访问。

## 快速开始

> [!IMPORTANT]
> Runtime `0.2.0-beta.3` 是面向测试的公开 Beta，未签名且未经过 Apple 公证。未来
> 稳定版仍要求 Developer ID 签名和 Apple 公证。

### 1. 安装

```bash
brew trust --formula codex-remote/tap/codex-remote
brew install codex-remote/tap/codex-remote
```

### 2. 配置 Mac

指定需要从手机访问的项目所在目录：

```bash
codex-remote setup --workspace-root ~/work
```

Setup 会查找 Codex、准备 Codex Remote 自己的本地数据、选择可用端口并启动后台服务。
它不会修改或停止用户已有的 PostgreSQL、Redis 或 Valkey。

### 3. 配对手机

```bash
codex-remote pair
```

在 iPhone 上打开显示的链接或扫描二维码。配对完成后，选择项目和会话，就可以像在
Mac 上一样发送任务。

请把二维码和完整配对链接当作密码保管。每个链接都含有一次性凭证，会在 `pair` 打印
的时间失效（默认 10 分钟），成功兑换后不能再次使用。

## 配对与设备

每增加一个浏览器或设备，需要运行一次 `codex-remote pair`。新配对不会撤销此前已配对
的设备。此版本中，浏览器收到的会话凭证在配对 30 天后到期；在此期间，短期访问凭证
会自动刷新。

在 Mobile Web 的连接设置中使用“退出此设备”，可以撤销当前浏览器会话。Runtime 底层
提供 Mac 端撤销接口，但 `codex-remote` 目前还没有面向用户的命令来列出设备或单独
撤销某个设备。退出、到期或被撤销后，需要重新配对。

## 日常使用

Codex 始终在 Mac 上执行。你可以锁定 Mac 屏幕或离开电脑，再通过手机跟进任务。
Mac 需要保持开机、连接网络，并且能够正常运行 Codex。

Codex Remote 只注册一个 `com.codex-remote.runtime` 登录项，由 Supervisor 管理数据库、
事件存储、Codex Agent、Run Server 和手机 Gateway。

后续升级使用普通的 Homebrew 命令：

```bash
brew upgrade codex-remote
```

升级和重装只替换不可变的 Runtime 文件，会保留现有配置、端口、数据库、工作区根目录
和已配对设备状态。

## 安全与网络模型

- iPhone 通过局域网连接 Mac 上选定的 Gateway 端口。此 Beta 没有云端中继或公网
  访问端点。
- 手机与 Mac 之间当前使用普通 HTTP，没有 TLS。因此，配对凭证、请求、状态、结果，
  以及手机界面中查看的源代码内容在传输中没有加密。请只在可信局域网内使用，不要做
  端口转发，也不要通过其他方式把 Gateway 暴露到公网。
- `codex-remote pair` 创建一次性配对凭证。链接把凭证放在 URL Fragment 中，
  Mobile Web 会在兑换前从地址栏中移除它。不要分享包含二维码或完整链接的截图和终端
  输出。
- 浏览器把配对后的刷新凭证保存在具有 `HttpOnly` 和 `SameSite=Strict` 属性的
  Cookie 中；当前访问凭证只保存在浏览器内存里。
- 用于创建和撤销凭证的 Auth Control API 只监听 Mac 回环接口。手机侧 Gateway 只
  开放允许列表中的 Runtime 和认证路由。

## 隐私与数据

项目文件存储在 Mac 上，Codex 也在 Mac 上执行。手机界面请求的信息会通过局域网发送
到该浏览器，包括项目与会话元数据、提示词、状态、结果，以及用户主动查看的源代码
内容。Codex 本身仍可能通过现有 Codex 安装和账号使用其网络服务。

Codex Remote 将用户配置、数据库、日志和服务状态存储在
`~/Library/Application Support/CodexRemote`，并将 PostgreSQL 与 Valkey 凭证存入
macOS 钥匙串。它不会修改或停止用户已有的 PostgreSQL、Redis 或 Valkey。

## 故障排查

先运行：

```bash
codex-remote doctor
```

Doctor 会检查平台、本地路径与配置、Runtime 文件、Codex 兼容性与 App Server 握手、
钥匙串凭证、LaunchAgent、旧登录项，以及本机 Run Server 和 Gateway 的健康状态。
它只报告问题，不会自动修复，也无法从 iPhone 侧检查 Wi-Fi 路径、路由器客户端隔离或
macOS 防火墙。

需要机器可读结果时，使用 `codex-remote doctor --json`。

### Setup 失败或被中断

如果 Setup 在失败前已经创建了状态，请在 Mac 的普通终端中验证并重建服务配置：

```bash
codex-remote setup --repair
codex-remote doctor
```

Repair 会保留已保存的端口、工作区根目录、数据库和钥匙串凭证，不会静默更换已经
保存的 Gateway 端口。

### 无法找到 Codex

Setup 会依次检查 `--codex-binary`、`CODEX_BINARY`、`PATH`、ChatGPT.app 和
Codex.app。如果 Codex 安装在其他位置，请传入可执行文件的绝对路径：

```bash
codex-remote setup --codex-binary /absolute/path/to/codex \
  --workspace-root /absolute/path/to/work
```

重试前，请确认 Codex 已登录并且能够启动 App Server。

### 配对链接过期或已使用

重新运行 `codex-remote pair`，并在新链接打印的有效期内使用。配对链接只能使用一次。

### 链接能打开，但 iPhone 无法连接

1. 确认 Mac 处于唤醒状态，并且两台设备连接同一局域网。访客 Wi-Fi、客户端隔离、
   VPN 或防火墙都可能阻止设备间访问。
2. 在 Mac 上运行 `codex-remote doctor`。Run Server 和 Gateway 都显示健康后，手机
   才可能正常访问。
3. 在本地防火墙规则中允许选定的 Codex Remote Gateway 端口。不要全局关闭防火墙，
   也不要把该端口暴露到公网。
4. 网络恢复后，生成新的配对链接。

### 已配对的 Safari 突然失去访问权限

每台已配对设备只使用一个 Safari 标签。多个标签并发刷新可能触发重放保护并撤销
会话。关闭多余标签后，再运行 `codex-remote pair` 重新配对。

### 出现多个 Codex Remote 登录项

升级到 `0.2.0-beta.3` 或更高版本，然后在普通终端中运行
`codex-remote setup --repair`。Repair 会删除精确匹配的旧服务项，只保留一个
`com.codex-remote.runtime` 登录项。

## 卸载与本地数据

在 Mac 的普通终端中停止 Codex Remote、移除登录项，同时保留本地数据以便以后重装：

```bash
codex-remote uninstall
brew uninstall codex-remote
```

第一个命令会显示保留的数据路径。普通的 `brew upgrade`、`brew reinstall` 或
`codex-remote uninstall` 都不会删除本地数据。

如需永久删除 Codex Remote 状态及其 PostgreSQL 和 Valkey 钥匙串凭证，请先执行明确
的清理命令，再删除 Homebrew 包：

```bash
codex-remote uninstall --purge --yes
brew uninstall codex-remote
```

> [!CAUTION]
> Purge 会永久删除 `~/Library/Application Support/CodexRemote`，其中包括配置、
> 日志、数据库内容和已配对设备状态。

## Beta 限制

- 仅支持 Apple Silicon Mac 和 iPhone Safari；其他环境未经验证或不受支持。
- iPhone 必须能在同一局域网内访问 Mac。
- 手机连接使用普通 HTTP，没有 TLS 或公网访问端点。
- 每台已配对设备只使用一个 Safari 标签，否则并发令牌刷新可能撤销会话。
- 二进制文件没有 Developer ID 签名，也未经过 Apple 公证，可能被 macOS 或受管理
  设备的安全策略阻止。不要全局关闭 Gatekeeper。
- 顶层 CLI 目前无法在 Mac 上列出设备或单独撤销某个已配对设备。

## 许可与源码开放范围

应用以闭源二进制形式通过这个公开仓库发布，并遵循
[公开 Beta 二进制许可](BETA-LICENSE)。Beta 未经过 Developer ID 签名和 Apple 公证；
具体实现源码和内部文档目前暂不公开。

## 支持项目

如果 Codex Remote 确实解决了你的工作流问题，可以考虑为这个仓库加一个 Star。
Star 能帮助更多 Codex 用户发现这个 Beta，并关注后续进展。

欢迎通过 [GitHub Issues](https://github.com/codex-remote/homebrew-tap/issues) 提交可复现的
问题和聚焦的产品反馈。提交前请先阅读[公开 Roadmap](ROADMAP.zh-CN.md)、
[贡献说明](CONTRIBUTING.md)和[安全策略](SECURITY.md)。
