require "spec_helper"

describe TituloEleitorUtils do
  it ".titulo_eleitor" do
    valid_titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    expect(valid_titulo_eleitor).to be_a_kind_of(String)
    expect(valid_titulo_eleitor[8,2].to_i).to be >= 1
    expect(valid_titulo_eleitor[8,2].to_i).to be <= 28
    expect(valid_titulo_eleitor.length).to eql(12)
  end

  it ".titulo_eleitor_formatted" do
    valid_titulo_eleitor = TituloEleitorUtils.titulo_eleitor_formatted
    expect(valid_titulo_eleitor).to match(/^[0-9]{4}\.[0-9]{4}\.[0-9]{4}+$/)
  end

  it ".titulo_eleitor_formatado" do
    valid_titulo_eleitor = TituloEleitorUtils.titulo_eleitor_formatado
    expect(valid_titulo_eleitor).to match(/^[0-9]{4}\.[0-9]{4}\.[0-9]{4}+$/)
  end

  it ".valid_titulo_eleitor?" do
    valid_titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    expect(TituloEleitorUtils.valid_titulo_eleitor? valid_titulo_eleitor).to be_true
  end

  it ".titulo_eleitor_valido?" do
    titulo_eleitor_valido = TituloEleitorUtils.titulo_eleitor
    expect(TituloEleitorUtils.titulo_eleitor_valido? titulo_eleitor_valido).to be_true
  end

  it ".valid_titulo_eleitor? - be false" do
    invalid_titulo_eleitor = "1234.5678.9101"
    expect(TituloEleitorUtils.valid_titulo_eleitor? invalid_titulo_eleitor).to be_false
  end

  it ".sample_numbers" do
    numbers = TituloEleitorUtils.sample_numbers
    expect(numbers.size).to eql(10)
    expect(numbers).to be_a_kind_of(Array)
    expect(numbers.join("")[8,2].to_i).to be >= 1
    expect(numbers.join("")[8,2].to_i).to be <= 28
  end

  it ".titulo_eleitor_province" do
    state = TituloEleitorUtils.titulo_eleitor_province("759026311727")
    expect(state).to eql("TO")
  end

  it ".uf_do_titulo_eleitor" do
    state = TituloEleitorUtils.uf_do_titulo_eleitor("759026311727")
    expect(state).to eql("TO")
  end
end
