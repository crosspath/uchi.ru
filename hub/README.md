# Микросервис для GitHub

Доступные операции:
* `<github repo>/contributors/<count>` - показать `<count>` участников, имеющих наибольшее количество коммитов в репозитории `<github repo>`

В настоящее время GitHub использует GraphQL для предоставления API.

* [получить token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line) и сохранить в `config/github-token.txt`
* [пример приложения с GraphQL](https://github.com/github/github-graphql-rails-example)
* [документация по GraphQL для GitHub](https://developer.github.com/v4/)
* [в настоящее время невозможно получить список участников тех репозиториев, в которых нет текущего пользователя](https://github.com/isaacs/github/issues/444)
