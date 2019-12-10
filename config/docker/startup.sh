#! /bin/sh

# Wait for DB services
sh ./config/docker/wait-for-services.sh

# Prepare DB (Migrate - If not? Create db & Migrate)
sh ./config/docker/prepare-db.sh

# Pre-comple app assets
sh ./config/docker/asset-pre-compile.sh

# Start Application
rm -f /myapp/tmp/pids/server.pid
#bundle exec puma -C config/puma.rb
rails s -e production -p 3000 -b 0.0.0.0