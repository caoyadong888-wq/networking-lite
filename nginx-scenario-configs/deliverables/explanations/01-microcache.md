# Microcaching

## English

Use this when an anonymous page or API GET is expensive and a few seconds of staleness is acceptable. Logged-in browsers send a `session` cookie, and clients that send `Authorization` skip the cache. A staff refresh is `?nocache=1`.

Open-source nginx has no cache purge module. The bypass arguments are the refresh switch. Successful responses live for 30 seconds. 404s live for 5 seconds. One request fills the cache (`proxy_cache_lock`) and a stale object is served while that refresh runs.

Copy `scenarios/01-microcache.conf` over `/etc/nginx/nginx.conf` only on a host that should run this file alone. On a host that already has sites, move the `proxy_cache_path` and the two `map` blocks into the `http` block, and move the `server` block into `conf.d`. Change `192.0.2.10` and `cache.example.com` to your origin and name. TLS belongs on the edge proxy, not in this file.

Check with `nginx -t` and reload. The response header `X-Cache-Status` is `MISS`, then `HIT`.

## 中文

匿名页面或匿名 GET 很贵、又能接受几秒旧数据时用这份配置。带 `session` cookie 的浏览器，以及带 `Authorization` 的客户端，不进缓存。值班刷新用 `?nocache=1`。

开源 nginx 没有缓存清除模块，刷新就靠这个旁路参数。200 缓存 30 秒，404 缓存 5 秒。`proxy_cache_lock` 让同一把钥匙只有一个请求回源，刷新期间先把旧对象给出去。

单独一台机器可以把 `scenarios/01-microcache.conf` 放到 `/etc/nginx/nginx.conf`。已经有站点时，把 `proxy_cache_path` 和两段 `map` 放进 `http`，把 `server` 放进 `conf.d`。把 `192.0.2.10` 和 `cache.example.com` 换成你的源站和域名。证书放在边缘代理上，不放在这个文件里。

`nginx -t` 通过后重载。响应头 `X-Cache-Status` 会先是 `MISS`，再是 `HIT`。
