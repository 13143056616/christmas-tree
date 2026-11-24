# 圣诞树 · 送给赖皮丽

基于 [nobody-r/christmas-tree](https://github.com/nobody-r/christmas-tree) 的定制版：把标题、落款、祝福语都换成了你的，并做了国内访问优化。

## 一、先看效果

Windows 双击 **`start.bat`**，浏览器会自动打开 `http://localhost:8080`。

Mac / Linux 用 `./start.sh`。

> 必须走本地服务，不能直接双击 `index.html`：MediaPipe 的模型文件用 fetch 加载，`file://` 协议下会被浏览器拦掉。

开场是一屏金色星尘 + `Merry Christmas`，点任意处（或右上角「跳过」）进入正片。

## 二、改东西只改一个文件

`custom.config.js`，四行字：

| 要改的 | 位置 | 说明 |
|---|---|---|
| 收件人 | `var to = "赖皮丽"` | 顶部标题会变成「圣诞快乐，赖皮丽」；留空则用通用文案 |
| 落款 | `var from = "神仙陈"` | 开场小字自动带「· 来自 神仙陈」；留空则不显示 |
| 祝福语 | `var message = "愿今夜的星光…"` | 开场 Merry Christmas 下面那一行 |
| 照片 | `var photos = []` | 见下 |

改完 `Ctrl + F5` 强刷。

### 加照片

1. 把图片丢进 `photos/` 目录（建议 3:4 竖图或 1:1 方图，单张压在 500KB 以内）
2. 在 `custom.config.js` 里写路径：

```js
var photos = ["./photos/01.jpg", "./photos/02.jpg", "./photos/03.jpg"];
```

照片会用**捏指**手势一张张翻出来，也会出现在左侧「回忆相册」里。

也可以不改文件，直接在页面左侧「回忆相册」点上传 —— 照片存在浏览器 IndexedDB 里，下次用同一个浏览器打开还在。但那种方式只存在你这台机器上，发给别人看不到，所以要送人还是写进 `photos/`。

### 换音乐

把 mp3 丢进 `audio/`，改 `custom.config.js` 里没有对应项的话，直接在页面右上角设置面板里「上传本地音乐」。默认曲目是 Ikson 的《Christmas》，免费可商用。

## 三、发给赖皮丽（这一步有坑）

**手机浏览器只有在 HTTPS 下才允许开摄像头**，局域网 `http://192.168.x.x` 打开会拿不到摄像头权限，手势功能直接失效。

所以想让她在手机上玩，必须挂到一个 https 地址上：

| 方式 | 成本 | 适合 |
|---|---|---|
| **GitHub Pages** | 免费，10 分钟 | 你已经有 GitHub 账号，最稳 |
| **Vercel / Cloudflare Pages** | 免费，拖拽上传 | 不想碰 git |
| **临时隧道**（cloudflared / ngrok） | 免费，但地址每次变 | 只想当场演示一下 |

GitHub Pages 的做法：新建仓库 → 把这个目录整个传上去（**除了 `.git`**）→ Settings → Pages → 选 main 分支根目录 → 拿到 `https://用户名.github.io/仓库名/` 链接。

体积 30MB，主要是 MediaPipe 的 22MB 模型。GitHub Pages 单仓库上限 1GB，够用。

## 四、手势怎么用

打开右上角的摄像头按钮，允许权限，然后：

| 手势 | 效果 |
|---|---|
| ✊ 握拳 | 粒子收拢成树 |
| 🖐 摊手 | 星光散开 |
| ☝️ 拇指食指捏合 | 弹出一张照片 |

不想抬手也行：鼠标拖动旋转、滚轮缩放、按住左键让星光绽放。

右侧面板还能调粒子数量、主色点缀色、礼盒和彩球的样式、切换「圣诞树 / 星光漂浮」两种展示模式。

## 五、我改了什么

| 文件 | 改动 |
|---|---|
| `index.html` | 新标题、去掉 Google Fonts 外链（改本地字体，国内不再卡首屏）、补 SEO/主题色 |
| `fonts/` | 新增，Playfair Display 两个 woff2（约 76KB），大标题的斜体衬线靠它 |
| `custom.config.js` | 新增，收件人/落款/祝福语/照片的统一配置入口 |
| `assets/index-CZPyPNXc.js` | 三处字符串改为读配置（主标题、开场祝福语、内置相册数组），其余逻辑一行未动 |
| `start.bat` / `start.sh` | 新增，一键起本地服务 |
| `assets/index-CZPyPNXc.js.orig` | 原始打包文件备份，想完全还原就把 `.orig` 后缀去掉覆盖回去 |

粒子数、树的螺旋、光照、物理缓动全部是原作者的实现，没碰。
