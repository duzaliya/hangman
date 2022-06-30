# класс игры
# Игровая логика: хранит загаданное слово, сколько букв отгадано и какие,
# сколько было ошибок, смотрит есть ли названная буква

class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    # значения всех других методов мы можем рассчитать, благодаря этим 2м instance переменным
    @letters = word.chars #буквы = слово, разбитое на символы
    @user_guesses = [] # массив для введенных пользователем букв
  end

  def errors
    # буквы-ошибки завясят от введенных юзером букв и от букв загаданного слова, а также от нормализованных букв
    @user_guesses - normalized_letters
  end

  def errors_made
    # какое количество ошибок сделано зависит от errors
    errors.length
  end

  def errors_allowed
    # ошибок осталось
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    # зависит от загаданных букв и букв, которые ввел юзер, а также нормализованных букв
    # eсли буква была нормализована, возвращает ее ненормализованный вариант
    result = 
      @letters.map do |letter|
      # если очередная буква загаданного слова есть в @user_guesses,
      # то на месте очередной буквы загаданного слова должна быть эта буква
        if @user_guesses.include?(normalize_letter(letter))
          letter
        end
      end
    result
  end

  def lost?
    # зависит исключительно от кол-ва сделанных ошибок
    # если сделано 7 ошибок - игра проиграна, если не сделано 7 ошибок - не проиграна
    errors_allowed == 0
  end

  def normalize_letter(letter)
    # заменяет переданную букву ё-е, й-и
    case letter
    when "Ё" then "Е"
    when "Й" then "И"
    else letter
    end
  end

  def normalized_letters
    @letters.map { |letter| normalize_letter(letter)}
  end

  def over?
    # зависит от того, выиграна ли или проиграна игра
    won? || lost?
  end

  # метод play - единственный метод, к-й меняет состояние игры
  # чтобы отделить этот метод от других, принято ставить !
  def play!(letter)
    normalize_letter = normalize_letter(letter)
    # чтобы ничего не ломалось при некорректном использовании класса,
    # целесообразно добавить проверку
    # если игра не закончилась и буквы нет среди уже названных
    if !over? && !@user_guesses.include?(normalize_letter)
    # то добавляем эту букву в названные
      @user_guesses << normalize_letter
    # все, что должен делать этот метод, - закидывать в @user_guesses
    # ту букву, которую мы передали
    # если юзер уже называл эту букву, нам не нужно менять состояние игры
    # unless @user_guesses.include?(letter)
    end
  end
  
  def won?
    # зависит от букв загаданного слова и названных букв
    # @letters - @user_guesses == 0
    (normalized_letters - @user_guesses).empty?
  end

  def word
    # зависит от букв загаданного слова
    # нужно обратно объединить загаданные буквы
    @letters.join
  end
end
