# Что это?

Решение тестового задания для команды сайта Uchi.ru.

# Что нужно сделать?

```
В нашей работе мы пишем на руби микросервисы и выкатываем их в докер-кластеры. Нам приходится много работать с обработкой JSON. А ещё мы проводим онлайн-олимпиады и генерируем pdf-дипломы. Поэтому наше задание про это.

Нужно по адресу публичного репозитория на гитхабе найти трёх его самых активных контрибьюторов и сгенерировать для них простые pdf-дипломы. Спроектируйте приложение из нескольких микросервисов и разверните его на любой публичной платформе (например, на бесплатном аккаунте в Хероку). Код, конечно же, должен быть на Гитхабе.
```

Под микросервисами тут понимаются отдельные приложения, которые взаимодействуют между собой через вызовы или общие ресурсы.

# Как запустить это решение?

    gem install foreman
    bundle
    foreman start

# Что ещё нужно знать?

Есть комментарии по реализации каждого микросервиса, см. файл **README** в папках *hub*, *pdf*, *web*.
