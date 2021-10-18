require_relative 'operations.rb'

module Calculator
  class Menu
    def initialize
    puts "+--------------------+"
    puts "| Menu da Calculouca |"
    puts "+--------------------+"
    puts "> Selecione uma das seguintes operações:\n\n"
    puts "1 - Média Preconceituosa"
    puts "2 - Calculadora sem... números?"
    puts "3 - Filtrar Filmes"
    puts "4 - Sair daqui\n\n"
    print "Selecionar: "
    selecao = gets.chomp.to_i   #entrada
    puts
    case selecao
    when 1 then self.op1
    when 2 then self.op2
    when 3 then self.op3
    when 4 then self.op4
    end
    end
    def op1
      puts "+--------------------------+"
      puts "| Média Preconceituosa >:c |"
      puts "+--------------------------+"
      puts "> Insira o JSON com as notas dos alunos (todos): "
      print"> "
      grades = gets.chomp
      puts "> Insira o nomes de 'certos alunos' separados por espaço:"
      print"> "
      blacklist = gets.chomp
      print "'Media' da turma: "
      print Operations.new.biased_mean(grades, blacklist)
      puts "\n\n"
      
    end
    def op2
      puts "+----------------------------+"
      puts "| Calculadora sem números :O |"
      puts "+----------------------------+"
      puts "> Insira a sequencia de números separados por espaço"
      print"> "
      numbers = gets.chomp
      resultado = Operations.new.no_integers(numbers)
      print "Resposta para divisibilidade por 25: "
      resultado.each do |res|
        print res
        print " " unless res == resultado.length - 1
      end
      puts "\n\n"
    end
    def op3
      puts "+-------------------+"
      puts "| Filtrar Filmes :/ |"
      puts "+-------------------+"
      puts "> Insira os generos que busca separados por espaço:"
      print"> "
      genres = gets.chomp
      puts"> Ver filmes lançados a partir de que ano?"
      print"> "
      year = gets.chomp
      puts "Filmes:"
      puts Operations.new.filter_films(genres, year)
      puts "\n"
    end
    def op4
      puts "+----------------+"
      puts "| Arrivederci !! |"
      puts "+----------------+"
      exit
    end
  end
end
