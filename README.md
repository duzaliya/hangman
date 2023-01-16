# Консольная игра "Виселица" на Ruby.

### Правила игры:

* Компьютер загадывает слово и показывает, сколько в нем букв.

* Игрок вводит буквы по одной.

* Если такая буква есть в слове, компьютер показывает, сколько раз она встречается в слове и на каких местах. 
Если буквы нет, компьютер засчитывает ошибку.

* После каждой ошибки дорисовывается виселица.

* Всего можно сделать 7 ошибок.

* Если слово отгадано полностью, игрок победил.

#### Запустить игру:

##### Склонируйте репозиторий

```
git clone https://github.com/duzaliya/hangman.git
```

```
bundle install
bundle exec ruby main.rb
```

#### Добавить новое слово:

hangman/data/words.txt
