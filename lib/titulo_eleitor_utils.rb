require "titulo_eleitor_utils/version"
require "titulo_eleitor_utils/string"
require "titulo_eleitor_utils/titulo_eleitor"

module TituloEleitorUtils

  # Gera um número de Título de Eleitor.
  #
  # Exemplo:
  # TituloEleitorUtils.titulo_eleitor => # "023434561340"
  def self.titulo_eleitor
    TituloEleitor.new(sample_numbers).generate_titulo_eleitor
  end

  # Gera um número de Título de Eleitor formatado.
  #
  # Exemplo:
  # TituloEleitor.titulo_eleitor_formatted => # "0234.3456.1340"
  def self.titulo_eleitor_formatted
    TituloEleitor.new(sample_numbers)
      .generate_titulo_eleitor.to_titulo_eleitor_format
  end

  # Gera um número de Título de Eleitor formatado.
  #
  # Exemplo:
  # TituloEleitor.titulo_eleitor_formatado => # "0234.3456.1340"
  def self.titulo_eleitor_formatado
    self.titulo_eleitor_formatted
  end

  # Verifica se um Título de Eleitor é válido.
  #
  # Exemplo:
  # TituloEleitor.valid_titulo_eleitor?(023434561340) => # true
  # TituloEleitor.valid_titulo_eleitor?("023434561340") => # true
  # TituloEleitor.valid_titulo_eleitor?("0234.3456.1340") => # true
  def self.valid_titulo_eleitor?(titulo_eleitor_number)
    titulo_eleitor_number.to_s.valid_titulo_eleitor?
  end

  # Verifica se um Título de Eleitor é válido.
  #
  # Exemplo:
  # TituloEleitor.titulo_eleitor_valido?(023434561340) => # true
  # TituloEleitor.titulo_eleitor_valido?("023434561340") => # true
  # TituloEleitor.titulo_eleitor_valido?("0234.3456.1340") => # true
  def self.titulo_eleitor_valido?(titulo_eleitor_number)
    self.valid_titulo_eleitor?(titulo_eleitor_number)
  end

  # Para saber a qual unidade federativa o Título de Eleitor pertence:
  #
  # Exemplo:
  # TituloEleitor.titulo_eleitor_province("759026311727") => # "TO"
  def self.titulo_eleitor_province(titulo_eleitor_number)
    provinces = ["SP","MG","RJ","RS","BA","PR","CE","PE","SC","GO","MA","PB",
                 "PA","ES","PI","RN","AL","MT","MS","DF","SE","AM","RO","AC",
                 "AP","RR","TO","ZZ"]

    provinces[titulo_eleitor_number[10..11].to_i - 1]
  end

  # Para saber a qual unidade federativa o Título de Eleitor pertence:
  #
  # Exemplo:
  # TituloEleitor.uf_do_titulo_eleitor("759026311727") => # "TO"
  def self.uf_do_titulo_eleitor(titulo_eleitor_number)
    titulo_eleitor_province(titulo_eleitor_number)
  end

  private

  # Sorteia 10 números para compor um novo Título de Eleitor
  def self.sample_numbers
    titulo_eleitor_candidate = [*0..9].sample(8)
    titulo_eleitor_candidate.concat sample_state
  end

  # Sorteia um número entre 01 e 28, representando os estados + exterior
  def self.sample_state
    state_number = "%02d" % [*1..28].sample.to_s
    [state_number[0].to_i, state_number[1].to_i]
  end
end
