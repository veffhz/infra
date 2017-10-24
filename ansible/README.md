# Ansible dynamic inventory

- Установка GCE_INI_PATH:
 
  export GCE_INI_PATH = ./gce.ini


- Тест (список инстансов проекта):

  python gce_inventory/gce.py --list
