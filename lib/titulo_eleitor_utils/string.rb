class String

  # Verifica se uma máscara de Título de Eleitor é válida:
  #
  # "7590.2631.1727".valid_titulo_eleitor_mask? => # true
  def valid_titulo_eleitor_mask?
    without_mask = !!(self =~ /^[0-9]{12}+$/)
    with_mask = !!(self =~ /^[0-9]{4}\.[0-9]{4}\.[0-9]{4}+$/)
    with_mask || without_mask
  end

  # Verifica se um Título de Eleitor é válido:
  #
  # "759026311727".valid_titulo_eleitor? => # true
  # "7590.2631.1727".valid_titulo_eleitor? => # true
  def valid_titulo_eleitor?
    valid_state = TituloEleitorUtils::TituloEleitor.valid_state?(self)

    if valid_titulo_eleitor_mask? && valid_state
      original_titulo_eleitor = self.gsub(/\.?/,"",)
      tested_titulo_eleitor = original_titulo_eleitor[0..9]

      tested_titulo_eleitor << (
        TituloEleitorUtils::TituloEleitor.new(
          original_titulo_eleitor[0..9]
        ).first_digit.to_s
      )

      tested_titulo_eleitor << (
        TituloEleitorUtils::TituloEleitor.new(
          tested_titulo_eleitor[0..11]
        ).second_digit.to_s
      )

      tested_titulo_eleitor == original_titulo_eleitor ? true : false
    end
  end

  # Para formatar um número válido de Título de Eleitor:
  #
  # "759026311727".to_titulo_eleitor_format => # "7590.2631.1727"
  def to_titulo_eleitor_format
    if self.valid_titulo_eleitor?
      "#{self[0..3]}.#{self[4..7]}.#{self[8..11]}"
    end
  end

  # Gera um número de Título de Eleitor a partir de um número candidato:
  #
  # "7590263117".generate_titulo_eleitor => # "759026311727"
  def generate_titulo_eleitor
    if !!(self =~ /^[0-9]{10}+$/)
      final_titulo_eleitor = self

      final_titulo_eleitor << (
        TituloEleitorUtils::TituloEleitor.new(
          final_titulo_eleitor[0..9]
        ).first_digit.to_s
      )

      final_titulo_eleitor << (
        TituloEleitorUtils::TituloEleitor.new(
          final_titulo_eleitor[0..10]
        ).second_digit.to_s
      )

      final_titulo_eleitor
    end
  end

  # Para gerar um número de Título de Eleitor formatado a partir de um número candidato:
  #
  # "759026311727".generate_titulo_eleitor_formatted => # "7590.2631.1727"
  def generate_titulo_eleitor_formatted
    generate_titulo_eleitor.to_titulo_eleitor_format
  end

  # Para saber a qual unidade federativa o Título de Eleitor pertence:
  #
  # "759026311727".titulo_eleitor_province => # "TO"
  def titulo_eleitor_province
    TituloEleitorUtils.titulo_eleitor_province(self)
  end

  # Apelido 'mascara_de_titulo_eleitor_valida' para o método valid_titulo_eleitor_mask
  alias_method :mascara_de_titulo_eleitor_valida?, :valid_titulo_eleitor_mask?

  # Apelido 'titulo_eleitor_valido?' para o método valid_titulo_eleitor?
  alias_method :titulo_eleitor_valido?, :valid_titulo_eleitor?

  # Apelido 'para_formato_titulo_eleitor' para o método to_titulo_eleitor_format
  alias_method :para_formato_titulo_eleitor, :to_titulo_eleitor_format

  # Apelido 'gerar_titulo_eleitor' para o método generate_titulo_eleitor
  alias_method :gerar_titulo_eleitor, :generate_titulo_eleitor

  # Apelido 'gerar_titulo_eleitor_formatado' para o método generate_titulo_eleitor_formatted
  alias_method :gerar_titulo_eleitor_formatado, :generate_titulo_eleitor_formatted

  # Apelido 'uf_do_titulo_eleitor' para o método titulo_eleitor_province
  alias_method :uf_do_titulo_eleitor, :titulo_eleitor_province

end
