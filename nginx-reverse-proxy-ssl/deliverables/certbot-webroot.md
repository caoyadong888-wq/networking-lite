# Certbot webroot (lite)

nginx must already answer `http://app.example.com/.well-known/acme-challenge/`
from `/var/www/certbot`. The redirect file in this lite pack does that.

```bash
sudo mkdir -p /var/www/certbot
sudo certbot certonly --webroot \
  -w /var/www/certbot \
  -d app.example.com \
  --email admin@example.com \
  --agree-tos \
  --non-interactive
sudo nginx -t && sudo systemctl reload nginx
```

Files are written under `/etc/letsencrypt/live/app.example.com/`.
Renew with `sudo certbot renew --dry-run`. The full pack adds a deploy hook,
the standalone bootstrap, and the case where port 80 is not free yet.
