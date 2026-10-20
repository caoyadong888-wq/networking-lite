# Rate-limit and connection-limit tiers

## English

One global `limit_req` is too coarse for a login form and a signed-in app. This file has three request zones and three connection zones:

- `/login/` allows 1 request per second, burst 3, and 5 concurrent connections.
- Everyone else without a `session` cookie gets 5 requests per second, burst 20, and 20 connections.
- A non-empty `session` cookie is treated as a member: 30 requests per second, burst 80, and 80 connections.

The zone name cannot be a variable, so members are sent to the named location `@member` before the anonymous limits run. Excess traffic gets HTTP 429.

The cookie test is presence, not a signature. A client can set `session=1` and reach the wider budget. That is intentional for this tier split. Real authentication stays in the app. Use the login zone to slow credential stuffing.

Change the `rate=` values in the three `limit_req_zone` lines. Keep the zone names in sync with `limit_req` and `limit_conn`.

## 中文

登录框和已登录应用不该共用一个限流。这份文件有三档请求配额和三档连接配额：

- `/login/` 每秒 1 个请求，突发 3，同时 5 个连接。
- 没有 `session` cookie 的访问者每秒 5 个请求，突发 20，同时 20 个连接。
- `session` cookie 非空就算成员：每秒 30 个请求，突发 80，同时 80 个连接。

配额名字不能用变量，所以成员在匿名限额生效前被转到命名 location `@member`。超出的请求返回 429。

这里只看 cookie 在不在，不校验签名。客户端自己写 `session=1` 就能进更宽的一档。这是分档，不是登录。真正的鉴权仍在应用里。登录这一档用来拖慢撞库。

改三行 `limit_req_zone` 里的 `rate=`。`limit_req` 和 `limit_conn` 上的区名要一起改。
