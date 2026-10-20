# Nginx scenario configs (lite)

## English

### Purpose

Three of the eight scenarios: microcache, rate/connection tiers, and the maintenance flag. WordPress, the SPA split, the admin allowlist, large uploads, and the canary split are in the full pack.

### Deliverables

- `deliverables/scenarios/01-microcache.conf`
- `deliverables/scenarios/02-rate-tiers.conf`
- `deliverables/scenarios/05-maintenance.conf`
- `deliverables/explanations/` for those three
- `deliverables/maintenance.sh`
- `deliverables/maintenance.html`

### Quick start

```bash
docker run --rm \
  -v "$PWD/deliverables/scenarios/05-maintenance.conf":/etc/nginx/nginx.conf:ro \
  nginx:1.30.6-alpine nginx -t
```

Copy `maintenance.html` to `/usr/share/nginx/html/` before the 503 page can load. Documentation addresses are `example.com` and `192.0.2.0/24`.

### Requirements

nginx 1.25 or newer. Docker is only needed to replay `nginx -t`.

## 中文

### 用途

八个场景里的三个：微缓存、分档限流限连接、维护开关。WordPress、单页和 API 拆分、管理后台白名单、大文件上传、金丝雀分流在完整版里。

### 交付清单

- `deliverables/scenarios/01-microcache.conf`
- `deliverables/scenarios/02-rate-tiers.conf`
- `deliverables/scenarios/05-maintenance.conf`
- 对应的三篇 `deliverables/explanations/`
- `deliverables/maintenance.sh`
- `deliverables/maintenance.html`

### 快速开始

```bash
docker run --rm \
  -v "$PWD/deliverables/scenarios/05-maintenance.conf":/etc/nginx/nginx.conf:ro \
  nginx:1.30.6-alpine nginx -t
```

503 页面要先把 `maintenance.html` 放到 `/usr/share/nginx/html/`。文档地址是 `example.com` 和 `192.0.2.0/24`。

### 环境要求

nginx 1.25 或更高。只有重放 `nginx -t` 时才需要 Docker。

Full version / 完整版: GUMROAD_URL

## Delivery time / 交付时间

- Lite (this folder): free, available now. / 精简版（本目录）：免费，立即可用。
- Full version: instant download after purchase (GUMROAD_URL). / 完整版：购买后即时下载（GUMROAD_URL）。
