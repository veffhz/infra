#!/bin/bash

sudo su appuser <<'EOF'
  cd /home/appuser
  git clone -b config-scripts https://github.com/veffhz/infra.git
  bash infra/install_ruby.sh > /home/appuser/install_ruby.log
EOF

bash infra/install_mongodb.sh > /home/appuser/install_mongodb.log

sudo su appuser <<'EOF'
  cd /home/appuser
  bash infra/deploy.sh > /home/appuser/deploy_app.log
EOF
