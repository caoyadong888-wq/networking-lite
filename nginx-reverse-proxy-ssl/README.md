# Nginx reverse proxy + SSL templates (lite)

## English

### Purpose

A free slice of the reverse-proxy pack: one HTTPS proxy, one HTTP to HTTPS
redirect that still serves the ACME challenge, and webroot certificate notes.
The generator, WebSocket map, SPA fallback, rate limit, TLS cipher file, and
standalone Certbot notes are in the full pack.

### Deliverables

- `deliverables/reverse-proxy.conf`
- `deliverables/http-to-https.conf`
- `deliverables/certbot-webroot.md`
- `examples/app.example.com.conf`

### Quick start

Copy `examples/app.example.com.conf` to `/etc/nginx/conf.d/` on a host you
administer, point the upstream at your own app, then:

```bash
sudo nginx -t && sudo systemctl reload nginx
```

Issue the certificate with `deliverables/certbot-webroot.md` before the
HTTPS server will load. The sample upstream `192.0.2.10` is a documentation
address (RFC 5737). Replace it.

### Requirements

nginx 1.25 or newer, and Certbot 2.x if you issue a certificate.

## 中文

### 用途

完整包的免费子集：一份 HTTPS 反向代理、一份仍能响应 ACME 校验的 HTTP 跳转，
以及 webroot 证书说明。生成器、WebSocket、单页应用、限流、TLS 套件和
standalone 说明在完整版里。

### 交付清单

- `deliverables/reverse-proxy.conf`
- `deliverables/http-to-https.conf`
- `deliverables/certbot-webroot.md`
- `examples/app.example.com.conf`

### 快速开始

把 `examples/app.example.com.conf` 拷到你管理的主机的 `/etc/nginx/conf.d/`，
把上游改成你自己的应用，然后：

```bash
sudo nginx -t && sudo systemctl reload nginx
```

HTTPS 段需要先按 `deliverables/certbot-webroot.md` 签发证书。示例里的
`192.0.2.10` 是 RFC 5737 文档地址，请换成你的上游。

### 环境要求

nginx 1.25 或更高。签发证书时需要 Certbot 2.x。

Full version: GUMROAD_URL

## Delivery time / 交付时间

- Lite (this repo): free, available now. / 精简版（本仓库）：免费，立即可用。
- Full version: instant download after purchase (GUMROAD_URL). / 完整版：购买后即时下载（GUMROAD_URL）。
