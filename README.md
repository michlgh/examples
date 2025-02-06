# Примеры ролей Ansible

Добро пожаловать в репозиторий примеров ролей Ansible! Этот репозиторий предназначен для демонстрации различных ролей, которые можно использовать для автоматизации задач управления конфигурацией и развертывания приложений.

## Содержание

- [Введение](#введение)
- [Структура ролей](#структура-ролей)
- [Список ролей](#список-ролей)
  - [Kafka Cluster](#kafka-cluster)
  - [Elastic Cluster](#elastic-cluster)
  - [TGBot](#tgbot)
- [Как использовать](#как-использовать)
- [Как проверить](#как-проверить)

## Введение

Ansible — это мощный инструмент для автоматизации, который позволяет управлять конфигурацией и развертыванием приложений на множестве серверов. В этом репозитории вы найдете примеры ролей, которые помогут вам начать работу с Ansible и упростят процесс автоматизации.

## Структура ролей

Каждая роль в Ansible имеет свою структуру, которая включает в себя следующие директории:

- `tasks/` - Основные задачи роли.
- `files/` - Статические файлы, которые могут быть скопированы на удаленные хосты.

## Список ролей

### Kafka Cluster

Эта роль устанавливает и настраивает кластер Kafka. Для работы этой роли требуется установленный Docker.

### Elastic Cluster

Эта роль устанавливает и настраивает кластер Elastic (Elasticsearch и Kibana). Для работы этой роли также требуется установленный Docker.

### TGBot

Эта роль копирует файлы и собирает docker image. Для работы этой роли также требуется установленный Docker.

## Как использовать

1. Клонируйте этот репозиторий на свой локальный компьютер:
  ```bash
  git clone https://github.com/michlgh/examples
  ```

2. Создайте файл *hosts* для ansible по примеру ниже
  ```bash
  [<имя группы>]
  <имя хоста>
  [<имя группы>:vars]
  ansible_ssh_user=<имя пользователя>
  ```

3. В файле playbook.yml задать значения переменных, которые отмечены в <..>

4. Запустить плейбук (предварительно установив ansible)
  ```bash
  ansible-playbook playbook.yml -t <имя роли> -i hosts
  ```
## Как проверить

1. Чтобы проверить elasticsearch
 
  Запрос через cli
  ```bash
  curl localhost:9200/_cluster/health
  ```
 
  Вывод будет, по примеру ниже (где number_of_nodes: количество нод)
  ```bash
  {"cluster_name":"имя кластера","status":"green","timed_out":false,"number_of_nodes":2,"number_of_data_nodes":2,"active_primary_shards":29,"active_shards":58,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":0,"unassigned_primary_shards":0,"delayed_unassigned_shards":0,"number_of_pending_tasks":0,"number_of_in_flight_fetch":0,"task_max_waiting_in_queue_millis":0,"active_shards_percent_as_number":100.0}%
  ```

2. Чтобы проверить kafka
 
  Запрос через cli
  ```bash
  docker exec -it <имя контейнера kafka> kafka-broker-api-versions --bootstrap-server <адрес из KAFKA_ADVERTISED_LISTENERS>:<адрес порта из KAFKA_ADVERTISED_LISTENERS после *:*>
  ```
 
  Вывод будет, по примеру ниже
  ```bash
  kafka1:9092 (id: 1 rack: null) -> (
	Produce(0): 0 to 11 [usable: 11],
	Fetch(1): 0 to 16 [usable: 16],
	ListOffsets(2): 0 to 8 [usable: 8],
	Metadata(3): 0 to 12 [usable: 12],
	LeaderAndIsr(4): 0 to 7 [usable: 7],
	StopReplica(5): 0 to 4 [usable: 4],
  И так далее ..
  ```

3. Чтобы проверить tgbot
 
  Запрос через cli
  ```bash
  docker logs <имя контейнера>
  ```
  