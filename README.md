# Калькулятор доходности по займу.

## Описание начальных условий:

Инвестор дает деньги в заём четырем заёмщикам на полгода. Ожидаемая доходность
инвестора — 30% годовых. Фактическая доходность считается по историческим
данным. Пример исторических данных приведен в прилагаемой файле
`examples/example.xlsx`. Часть расчетных формул есть в таблицах.

## Описание вкладок таблицы.

* На вкладке итого приведены формулы для расчета ожидаемой и исторической
доходности.
* На вкладках ЮЛ1-ЮЛ3 собраны исторические данные по выплатам трех ЮЛ-заёмщиков.
  * ЮЛ1 осуществлял выплаты вовремя.
  * ЮЛ2 осуществил полное досрочное погашение в четвертом месяце.
  * ЮЛ3 платил вовремя первые два месяца, а потом стал допускать просрочки.

## Задача

1. Разработать структуру базы данных для хранения исторических данных
2. Реализовать web-страницу калькулятор, считающую доход инвестора при вложении
любой суммы. Калькулятор считает ожидаемую и историческую доходность. Ожидаемая
доходность 30%, а фактическая считается по историческим данным из базы.
3. Реализовать возможность внести исторические данные по ЮЛ4

Ожидается, что это будет приложение Ruby on Rails, тесты по своему желанию.
Оценить готовность к выполнению, срок выполнения. Результатом вижу ссылку
на GitLab/GitHub/Bitbucket с инструкцией по деплою приложения. Как максимум —
развернуть приложение на Heroku/VPS.

## Ruby version

2.4.1

## System dependencies

## Configuration

## Database creation

`bundle exec rails db:create`

## Database initialization

## How to run the test suite

`bundle exec rspec`

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions
