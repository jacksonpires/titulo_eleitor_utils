module TituloEleitorUtils
  class TituloEleitor

    # Acessor de leitura para os números
    attr_reader :numbers

    # Inicializador da classe
    def initialize(numbers)
      if numbers.is_a? String
        numbers = numbers.split('')
      elsif numbers.is_a? Fixnum
        numbers = numbers.to_s.split('')
      end

      @numbers = numbers
    end

    # Gera o Título de Eleitor propriamente dito
    def generate_titulo_eleitor
      @numbers << first_digit
      @numbers << second_digit
      @numbers.join("")
    end

    # Gera o primeiro dígito verificador
    def first_digit
      if @numbers.size == 10
        value = 0
        multipliers = [2,3,4,5,6,7,8,9]

        multipliers.each_with_index do |mult, index|
          value += @numbers[index].to_i * mult
        end

        check_remainder(value % 11)
      end
    end

    # Gera o segundo dígito verificador
    def second_digit
      if @numbers.size == 11
        last_three_digits = [@numbers[8], @numbers[9], @numbers[10]]
        value = 0
        multipliers = [7,8,9]

        multipliers.each_with_index do |mult, index|
          value += last_three_digits[index].to_i * mult
        end

        check_remainder(value % 11)
      end
    end

    # Checa o resto da divisão
    def check_remainder(remainder)
      if remainder < 2
        0
      else
        (11 - remainder)
      end
    end

    # Verifica se o valor do dígito do estado é válido
    def self.valid_state?(titulo_eleitor_number)
      if titulo_eleitor_number.gsub!(/\.?/,"",).size == 12
        state_number = titulo_eleitor_number[8,2].to_i
        ((state_number >= 1) && (state_number <= 28)) ? true : false
      end
    end
  end
end
