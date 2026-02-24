#!/bin/bash
docker compose -f docker/caddy.yml \
               -f docker/transition-site.yml up -d --pull always
