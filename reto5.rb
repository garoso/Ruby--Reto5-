class Asks 
  attr_reader :asks_array

  def initialize
    @asks_array = []
    asks
  end

  private

  def asks
    file = File.read('preguntas.txt')
    file = file.split("\n")
    file.each do |ask|
      ask = ask.split(",")
      @asks_array << {ask: ask[0],answer: ask[1]}
    end
    @asks_array.shuffle!
  end
end

class Game

  def initialize
    asks = Asks.new
    puts
    puts "Bienvenido a reto 5, Para jugar, solo ingresa la respuestas correcta para cada una de las preguntas, Listo? Vamos!"
    puts
    do_questions (asks)
    puts "Gracias por jugar"
  end

  def do_questions (asks)
    asks.asks_array.each_with_index do |question,i|
      ask = question[:ask]
      answer = question[:answer]
      puts "Ronda #{i+1}"
      puts "#{ask}: "
      print "Respuesta: "
      user_answer = gets.chomp
      while user_answer != answer
        puts "Incorrecto!, trata de nuevo"
        print "Respuesta: "
        user_answer = gets.chomp
      end
      puts "Correcto!"
      puts
    end
  end
end

game = Game.new
