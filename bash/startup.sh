#!/bin/bash

# install ruby
sudo su appuser <<'EOF'
  cd /home/appuser
  git clone https://github.com/veffhz/infra.git
  bash infra/install_ruby.sh > /home/appuser/install_ruby.log
EOF

# install mongodb
bash /home/appuser/infra/install_mongodb.sh > /home/appuser/install_mongodb.log

# deploy ruby app
sudo su appuser <<'EOF'
  [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session

  cd /home/appuser
  bash infra/deploy.sh > /home/appuser/deploy_app.log
EOF
