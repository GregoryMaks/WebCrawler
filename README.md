# WebCrawler

## Task description (in Russian)

```
Приложение – Web Spider
Цель – рекурсивный поиск заданного текста начиная с заданной страницы в Internet.
Для каждой страницы нужно определить, сколько раз на ней встречается заданный текст. Затем найти все гиперссылки вида http://*, https://* с данной страницы и для них рекурсивно проделать то же самое. Страницы в очереди не должны дублироваться.
Поиск производится асинхронно в несколько потоков. Должна быть возможность прервать, приостановить и продолжить работу. Поиск осуществляется по графу ссылок в глубину не дальше заданного уровня.
Входные данные
• начальная страница (например, http://www.bbc.com/)
• ключевой текст (например, Ukraine)
• ограничение по числу результатов (от 1 до 500)
• максимальная глубина поиска (от 1 до 5)
• число потоков (от 1 до 8)
Вывод результатов
• общая информация – число активных потоков, общее количество просмотренных страниц, число страниц с найденным текстом
• список, каждый элемент которого показывает результат поиска – адрес страницы, в очереди/закончен, количество вхождений текста или user­friendly ошибку
• приложение должно сохранять отзывчивость при скроллинге.
Приложение состоит из 1 экрана. В верхней части находятся управляющие элементы. Дизайн экрана на усмотрение соискателя.
```

## Solution description

TBD

## Solution details

TBD