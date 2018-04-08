# Микросервис для создания PDF

Доступные операции:
* `diploma?repo=<repo owner>/<repo name>&login=<user login>&name=<user name>` - сгенерировать PDF с информацией об участнике репозитория на GitHub

## Запуск

`RAILS_ENV=development puma`

## Примеры

Если запустить на локальной машине и обратиться к странице по адресу `localhost:3000/diploma?repo=crosspath/magnate&login=crosspath&name=Evgeniy+Nochevnov`, то сервис отправит результат в виде PDF-файла:

    Hello, Evgeniy Nochevnov!
    You're one of the top contributors to repository crosspath/magnate
    Your login is crosspath
