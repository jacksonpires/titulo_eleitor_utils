require "spec_helper"

describe TituloEleitorUtils do
  context 'TituloEleitorUtils::TituloEleitor' do
    it "#initialize - Text" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new("759026311727")
      expect(titulo_eleitor.numbers).to be_a_kind_of(Array)
      expect(titulo_eleitor.numbers.size).to eql(12)
    end

    it "#initialize - Fixnum" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new(759026311727)
      expect(titulo_eleitor.numbers).to be_a_kind_of(Array)
      expect(titulo_eleitor.numbers.size).to eql(12)
    end

    it "#initialize - Array" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new([7,5,9,0,2,6,3,1,1,7,2,7])
      expect(titulo_eleitor.numbers).to be_a_kind_of(Array)
      expect(titulo_eleitor.numbers.size).to eql(12)
    end

    it "#generate_titulo_eleitor" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new("759026311727")
      complete_titulo_eleitor = titulo_eleitor.generate_titulo_eleitor
      expect(complete_titulo_eleitor.size).to eql(12)
    end

    it "#first_digit" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new("7590263117")
      first_digit = titulo_eleitor.first_digit
      expect(first_digit).to eql(2)
    end

    it "#first_digit - false" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new("123")
      first_digit = titulo_eleitor.first_digit
      expect(first_digit).to be_false
    end

    it "#second_digit" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new("75902631172")
      second_digit = titulo_eleitor.second_digit
      expect(second_digit).to eql(7)
    end

    it "#second_digit - false" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new("123")
      second_digit = titulo_eleitor.second_digit
      expect(second_digit).to be_false
    end

    it "#check_remainder" do
      titulo_eleitor = TituloEleitorUtils::TituloEleitor.new("759026311727")
      expect(titulo_eleitor.check_remainder(0)).to eql(0)
      expect(titulo_eleitor.check_remainder(1)).to eql(0)
      expect(titulo_eleitor.check_remainder(2)).to eql(9)
    end
  end
end
