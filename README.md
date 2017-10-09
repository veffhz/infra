# Инфраструктурный репозиторий

- Создание инстанса с запущенным приложением reddit:

gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app --metadata startup-script-url=https://raw.githubusercontent.com/veffhz/infra/config-scripts/startup.sh

gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app --metadata startup-script-url=https://raw.githubusercontent.com/veffhz/infra/master/startup.sh

## Создание packer-образа:

- ubuntu 16 (ruby, mongodb):
 packer build -var-file=variables.json ./ubuntu16.json

- ubuntu 16 (ruby, mongodb, deploy/start app, port 9292):
 packer build -var-file=variables.json ./immutable.json

- app instance:
 packer build -var-file=variables.json ./app.json

- db instance:
 packer build -var-file=variables.json ./db.json

## Создание окружения с помощью Terraform

- в требуемом окружении (prod/stage) выполнить:

  terraform init -backend-config=backend.tfvars

  terraform apply

 для init и apply требуются файлы с переменными.
 Примеры смотри в каталоге example.

## Настройка конфигурации инстансов с помощью Ansible

  ansible-playbook reddit_app.yml --limit db --tags db-tag

  ansible-playbook reddit_app.yml --limit app --tags app-tag

  ansible-playbook reddit_app.yml --limit app --tags deploy-tag


### Создание окружения stage 
 
  ansible-playbook site.yml

  Создание окружения stage 
 
  ansible-playbook -i environments/prod/hosts site.yml


