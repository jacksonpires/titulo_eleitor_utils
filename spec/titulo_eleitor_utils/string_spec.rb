require "spec_helper"

describe String do
  it "#valid_titulo_eleitor_mask?" do
    expect("7590.2631.1727".valid_titulo_eleitor_mask?).to be_true
    expect("759026311727".valid_titulo_eleitor_mask?).to be_true
  end

  it "#mascara_de_titulo_eleitor_valida?" do
    expect("7590.2631.1727".mascara_de_titulo_eleitor_valida?).to be_true
    expect("759026311727".mascara_de_titulo_eleitor_valida?).to be_true
  end

  it "#valid_titulo_eleitor_mask? - be false" do
    expect("7590.26E1.1727".valid_titulo_eleitor_mask?).to be_false
    expect("7590..2631.1727".valid_titulo_eleitor_mask?).to be_false
    expect("7590.26311727".valid_titulo_eleitor_mask?).to be_false
  end

  it "#mascara_de_titulo_eleitor_valida? - be false" do
    expect("7590.26E1.1727".mascara_de_titulo_eleitor_valida?).to be_false
    expect("7590..2631.1727".mascara_de_titulo_eleitor_valida?).to be_false
    expect("7590.2631..1727".mascara_de_titulo_eleitor_valida?).to be_false
  end

  it "#valid_titulo_eleitor?" do
    titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    expect(titulo_eleitor.valid_titulo_eleitor?).to be_true
  end

  it "#titulo_eleitor_valido?" do
    titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    expect(titulo_eleitor.titulo_eleitor_valido?).to be_true
  end

  it "#to_titulo_eleitor_format?" do
    titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    expect(titulo_eleitor.to_titulo_eleitor_format).to match(/^[0-9]{4}\.[0-9]{4}\.[0-9]{4}+$/)
  end

  it "#para_formato_titulo_eleitor?" do
    titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    expect(titulo_eleitor.para_formato_titulo_eleitor).to match(/^[0-9]{4}\.[0-9]{4}\.[0-9]{4}+$/)
  end

  it "#generate_titulo_eleitor" do
    valid_titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    final_titulo_eleitor = valid_titulo_eleitor[0..9].generate_titulo_eleitor

    expect(final_titulo_eleitor).to be_a_kind_of(String)
    expect(final_titulo_eleitor.size).to eql(12)
  end

  it "#gerar_titulo_eleitor" do
    valid_titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    final_titulo_eleitor = valid_titulo_eleitor[0..9].gerar_titulo_eleitor

    expect(final_titulo_eleitor).to be_a_kind_of(String)
    expect(final_titulo_eleitor.size).to eql(12)
  end

  it "#gerar_titulo_eleitor_formatado" do
    valid_titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    final_titulo_eleitor = valid_titulo_eleitor[0..9].gerar_titulo_eleitor_formatado

    expect(final_titulo_eleitor).to match(/^[0-9]{4}\.[0-9]{4}\.[0-9]{4}+$/)
  end

  it "#generate_titulo_eleitor_formatted" do
    valid_titulo_eleitor = TituloEleitorUtils.titulo_eleitor
    final_titulo_eleitor = valid_titulo_eleitor[0..9].generate_titulo_eleitor_formatted

    expect(final_titulo_eleitor).to match(/^[0-9]{4}\.[0-9]{4}\.[0-9]{4}+$/)
  end

  it "#titulo_eleitor_province" do
    state = "759026311727".titulo_eleitor_province
    expect(state).to eql("TO")
  end

  it "#uf_do_titulo_eleitor" do
    state = "759026311727".uf_do_titulo_eleitor
    expect(state).to eql("TO")
  end
end
