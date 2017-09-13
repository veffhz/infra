# Инфрастурктурный репозиторий


Создание packer-образа:

ubuntu 16 (ruby, mongodb)
- packer build -var-file=variables.json ./ubuntu16.json

ubuntu 16 (ruby, mongodb, deploy/start app, port 9292)
- packer build -var-file=variables.json ./immutable.json


