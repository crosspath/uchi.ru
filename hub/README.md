# Микросервис для GitHub

Доступные операции:
* `<github repo>/contributors/<count>` - показать `<count>` участников, имеющих наибольшее количество коммитов в репозитории `<github repo>`

В настоящее время GitHub использует GraphQL для предоставления API.

* [получить token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line) и сохранить в `config/github-token.txt`
* [пример приложения с GraphQL](https://github.com/github/github-graphql-rails-example)
* [документация по GraphQL для GitHub](https://developer.github.com/v4/)
* [в настоящее время невозможно получить список участников тех репозиториев, в которых нет текущего пользователя](https://github.com/isaacs/github/issues/444)

## Запуск

`RAILS_ENV=development puma`

## Примеры

Если запустить на локальной машине, использовать токен пользователя _crosspath_ и обратиться к странице по адресу `localhost:3000/crosspath/magnate/contributors/3`, то сервис отправит результат:

```json
{
  "data": {
    "nodes": [
      {
        "login": "crosspath",
        "name": "Evgeniy Nochevnov"
      }
    ]
  },
  "errors": [],
  "__typename": "RepositoryCollaboratorConnection",
  "nodes": [
    {
      "data": {
        "login": "crosspath",
        "name": "Evgeniy Nochevnov"
      },
      "errors": [],
      "__typename": "User",
      "login": "crosspath",
      "name": "Evgeniy Nochevnov"
    }
  ]
}
```
