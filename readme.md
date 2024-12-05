# webtunnel docker setup

A repo to quickly set up a self-contained webtunnel on a vps or other single-purpose web host. Uses traefik/let's encrypt to handle certs.

## how to use

Define the variables in `env`. Then run `./define.env.sh` to generate the additional required fields. This will move the file to `.env`. Start the service with `sudo docker-compose up -d` and you're up.

If you want automatic updates for the docker compose stack located at, for example, `/srv/webtunnel/docker-compose.yml`, define a cron job like so:

```
0 5 * * 4 docker-compose --file /srv/webtunnel/docker-compose.yml pull && docker-compose --file /srv/webtunnel/docker-compose.yml up -d
```

If docker requires root, the rule should be in root's crontab.

To get your bridge line, run `sudo docker-compose exec bridge get-bridge-line.sh`
