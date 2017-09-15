# Инфрастурктурный репозиторий


- Создание инстанса с запущенным приложением reddit:

gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app --metadata startup-script-url=https://raw.githubusercontent.com/veffhz/infra/master/startup.sh



- Создание packer-образа:

ubuntu 16 (ruby, mongodb):
 packer build -var-file=variables.json ./ubuntu16.json

ubuntu 16 (ruby, mongodb, deploy/start app, port 9292):
 packer build -var-file=variables.json ./immutable.json
