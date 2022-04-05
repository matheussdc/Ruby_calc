require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)
      grades = JSON.parse(grades)
      blacklist = blacklist.split
      lista_key_str = Array.new      #string
      lista_key_sym = grades.keys      #symbol
      lista_key_sym.each do |key|
        lista_key_str.push(key.to_s) #symbol -> string
      end
      lista_sem_ig = lista_key_str - blacklist #lista sem os citados
      resul = 0
      lista_sem_ig.each do |nome|
        resul += grades["#{nome}"]
      end
      resul /= lista_sem_ig.length #Media
      return resul.round(2)
    
    end
  
    def no_integers(numbers)
      numbers = numbers.split
      cond_div = ["25", "50", "75", "00"] #condição de divisibilidade
      resul = Array.new                    # array resposta
      numbers.each do |numero|
        if numero.length < 2
          resul.push("N")
          next
        end
        check = numero[-2] + numero[-1] #checa a condição olhando os dois ultimos digitos
        if cond_div.include?(check)
          resul.push("S")
        else resul.push("N")
        end
      end
      return resul
    end
  
    def filter_films(genero, year)
      films = get_films
      quero_gnr = genero.split #gets.chomp
      ano = year               #gets.chomp
      lista = Array.new
      (0...films[:"movies"].length).each do |num|
        aux = 0
        quero_gnr.each do |gnr|
          aux += 1 if films[:"movies"][num][:"genres"].include?(gnr)
        end
        if aux == quero_gnr.length && films[:"movies"][num][:"year"] >= ano
          lista.push(films[:"movies"][num][:"title"])
        end

      end
      if lista.empty?
        return "Nenhum filme nessas condições"
      else
        return lista
      end
    end
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end
