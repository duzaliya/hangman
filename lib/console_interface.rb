# класс ввода-вывода
# Взаимодействие с консолью: вывод правил, вывод состония игры,
# полуение букв от пользователя, вывод результата

class ConsoleInterface
  FIGURES = 
    Dir[__dir__ + '/../data/figures/*.txt'].
    sort.
    map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts <<~END
    Слово: #{word_to_show}
    #{figure}
    Ошибки (#{@game.errors_made}): #{errors_to_show}
    У вас осталось ошибок: #{@game.errors_allowed}

    END

    if @game.won?
      puts "Поздравляем, вы выиграли!"
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово #{@game.word}"
    end
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter == nil
          "__"
        else
          letter
        end
      end

    result.join(' ')  
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def get_input
    # print - чтобы пользователь вводил букву в этой  же строке, а не на следующей
    print "Введите следующую букву: "
    # [0] - чтобы взть только первую букву из тех, что введет пользователь
    letter = gets[0].upcase
    letter
  end
end
