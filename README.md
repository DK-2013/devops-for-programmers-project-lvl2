### Hexlet tests and linter status:
[![Actions Status](https://github.com/DK-2013/devops-for-programmers-project-lvl2/workflows/hexlet-check/badge.svg)](https://github.com/DK-2013/devops-for-programmers-project-lvl2/actions)

[redmine](https://devops-2.kizilov.club/)

## Sample deploy [redmine](https://hub.docker.com/_/redmine) throw ansible

### Requirements
* ansible
* make
* [DO](https://cloud.digitalocean.com/) account (servers, balanser, db)
* [DataDog](https://www.datadoghq.com/) api key

### Install roles and collections from ansible-galaxy
```shell
make setup
```

### Add settings
* hosts to `inventory.ini`
* db settings: `group_vars/webservers/db_settings.yml`
* db password: `group_vars/webservers/db_pass.yml` as `dbPassword: your db password`
* DataDog api key: `group_vars/webservers/secrets.yml` as `datadog_api_key: your api key`
* password for ansible vault to `vault-password` as string
* encrypt secrets:
```shell
make secrets
```

### deploy redmine
```shell
make deploy
```
type password from `vault-password` on prompt

### change secrets
* decrypt: `make opensec`
* make changes
* encrypt: `make secrets`
* deploy: `make deploy`
