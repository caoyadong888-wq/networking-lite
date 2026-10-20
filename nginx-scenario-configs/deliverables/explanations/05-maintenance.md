# Maintenance mode

## English

`maintenance.sh on` creates `/etc/nginx/maintenance.flag` and reloads nginx. While the file exists, every URI except `/healthz` returns 503 and `maintenance.html`. `maintenance.sh off` removes the flag and reloads. `maintenance.sh status` prints `on` or `off`.

A browser that sends `maint_bypass=office-staff-preview` skips the page, so a duty operator can look at the real site. Anyone who can set that cookie can skip it too. It is a preview latch, not an access boundary. `/healthz` stays `200 ok` so a monitor can tell the proxy is up during the window.

Copy `maintenance.html` to `/usr/share/nginx/html/maintenance.html` on the nginx host. The 503 page sends `Retry-After: 3600`. Change that number in the named location `@maintenance` if the window is shorter.

On a laptop test, pass `--flag` and `--reload-cmd` so the script does not touch `/etc` or the running nginx:

```bash
./maintenance.sh on --flag /tmp/maintenance.flag --reload-cmd true
```

## 中文

`maintenance.sh on` 会创建 `/etc/nginx/maintenance.flag` 并重载 nginx。文件还在时，除了 `/healthz`，所有地址返回 503 和 `maintenance.html`。`maintenance.sh off` 删掉标志并重载。`maintenance.sh status` 打印 `on` 或 `off`。

浏览器带上 `maint_bypass=office-staff-preview` 就能看真实站点，方便值班的人验收。能设置这个 cookie 的人都能绕过，它是预览开关，不是权限边界。`/healthz` 在维护期间仍返回 `200 ok`，监控可以知道代理还活着。

把 `maintenance.html` 拷到 nginx 主机的 `/usr/share/nginx/html/maintenance.html`。503 页面带 `Retry-After: 3600`。窗口更短就改命名 location `@maintenance` 里的数字。

在笔记本上试时加上 `--flag` 和 `--reload-cmd`，避免动到 `/etc` 和正在跑的 nginx：

```bash
./maintenance.sh on --flag /tmp/maintenance.flag --reload-cmd true
```
