# класс игры
# Игровая логика: хранит загаданное слово, сколько букв отгадано и какие,
# сколько было ошибок, смотрит есть ли названная буква

class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors
    @user_guesses - normalized_letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    @letters.map do |letter|
      if @user_guesses.include?(normalize_letter(letter))
        letter
      end
    end
  end

  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    normalize_letter = normalize_letter(letter)
    if !over? && !@user_guesses.include?(normalize_letter)
      @user_guesses << normalize_letter
    end
  end
  
  def won?
    (normalized_letters - @user_guesses).empty?
  end

  def word
    @letters.join
  end

  private

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
end
