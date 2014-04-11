# TituloEleitorUtils
[![Gem Version](https://badge.fury.io/rb/titulo_eleitor_utils.png)](http://badge.fury.io/rb/titulo_eleitor_utils)
[![Build Status](https://travis-ci.org/jacksonpires/titulo_eleitor_utils.svg?branch=master)](https://travis-ci.org/jacksonpires/titulo_eleitor_utils)
[![Code Climate](https://codeclimate.com/github/jacksonpires/titulo_eleitor_utils.png)](https://codeclimate.com/github/jacksonpires/titulo_eleitor_utils)
[![Coverage Status](https://coveralls.io/repos/jacksonpires/cpf_utils/badge.png?branch=master)](https://coveralls.io/r/jacksonpires/cpf_utils?branch=master)

TituloEleitorUtils é uma suíte de funcionalidades para Título de Eleitor.
O TituloEleitorUtils é capaz de gerar números de Título de Eleitor para testes no formado tradicional ou apenas numérico, verifica a qual UF o Título de Eleitor pertence, testa se determinado número de Título de Eleitor é válido, gera dígitos verificadores para determinado número candidato a Título de Eleitor, dentre outras coisas.

*PS: Devido à inconsistência entre as formatações/máscaras usadas para Título de Eleitor em todo território nacional, optamos por usar uma formatação/máscara próxima à que Justiça Eleitoral usa nos comprovantes de votação. Nossa formatação/máscara será ####.####.####, visto que o título eleitoral é formado por 12 dígitos.*

## Compatibilidade

O TituloEleitorUtils usa o Travis-CI para efetuar testes em diferentes versões do Ruby. As versões testadas e aprovadas, por enquanto, são:

* MRI 1.9.2, 1.9.3, 2.0.0, 2.1.0
* JRuby 1.9.x

## Instalação

Adicione essa linha na Gemfile da sua aplicação:

```ruby
gem 'titulo_eleitor_utils'
```

E então execute:

```ruby
$ bundle
```

Ou instale você mesmo, conforme abaixo:

```ruby
$ gem install titulo_eleitor_utils
```

## Uso

O TituloEleitorUtils é muito fácil de usar, por exempo:

```ruby
# Para gerar um número de Título de Eleitor:
TituloEleitorUtils.titulo_eleitor => # "023434561340"

# Para gerar um Título de Eleitor formatado:
TituloEleitorUtils.titulo_eleitor_formatted => # "0234.3456.1340"

# Para verificar se um Título de Eleitor é válido:
TituloEleitorUtils.valid_titulo_eleitor?("023434561340") => # true
TituloEleitorUtils.valid_titulo_eleitor?(023434561340) => # true
TituloEleitorUtils.valid_titulo_eleitor?("0234.3456.1340") => # true

# Outra forma de verificar se um Título de Eleitor é válido:
"023434561340".valid_titulo_eleitor? => # true
"0234.3456.1340".valid_titulo_eleitor? => # true

# Para verificar se uma máscara de Título de Eleitor é válida:
"0234.3456.1340".valid_titulo_eleitor_mask? => # true
"0234.3456..1340".valid_titulo_eleitor_mask? => # false

# Para formatar um número válido de Título de Eleitor:
"023434561340".to_titulo_eleitor_format => # "0234.3456.1340"

# Para gerar um número de Título de Eleitor a partir de um número candidato de 10 dígitos:
"612873950001".generate_titulo_eleitor => # "023434561340"

# Para gerar um número de Título de Eleitor formatado a partir de um número candidato de 10 dígitos:
"612873950001".generate_titulo_eleitor_formatted => # "0234.3456.1340"

# Para saber a qual unidade federativa o Título de Eleitor pertence:
TituloEleitorUtils.titulo_eleitor_province("759026311727") => # "TO"
"759026311727".titulo_eleitor_province => # "TO"
```

Também é possível usar métodos em português:

```ruby
# Para gerar um número de Título de Eleitor:
TituloEleitorUtils.titulo_eleitor => # "023434561340"

# Para gerar um Título de Eleitor formatado:
TituloEleitorUtils.titulo_eleitor_formatado => # "0234.3456.1340"

# Para verificar se um Título de Eleitor é válido:
TituloEleitorUtils.titulo_eleitor_valido?("023434561340") => # true
TituloEleitorUtils.titulo_eleitor_valido?(023434561340) => # true
TituloEleitorUtils.titulo_eleitor_valido?("0234.3456.1340") => # true

# Outra forma de verificar se um Título de Eleitor é válido:
"023434561340".titulo_eleitor_valido? => # true
"0234.3456.1340".titulo_eleitor_valido? => # true

# Para verificar se uma máscara de Título de Eleitor é válida:
"0234.3456.1340".mascara_de_titulo_eleitor_valida? => # true
"0234.3456..1340".mascara_de_titulo_eleitor_valida? => # false

# Para formatar um número válido de Título de Eleitor:
"023434561340".para_formato_titulo_eleitor => # "0234.3456.1340"

# Para gerar um número de Título de Eleitor a partir de um número candidato de 10 dígitos:
"612873950001".gerar_titulo_eleitor => # "023434561340"

# Para gerar um número de Título de Eleitor formatado a partir de um número candidato de 10 dígitos:
"612873950001".gerar_titulo_eleitor_formatado => # "0234.3456.1340"

# Para saber a qual unidade federativa o Título de Eleitor pertence:
TituloEleitorUtils.uf_do_titulo_eleitor("759026311727") => # "TO"
"759026311727".uf_do_titulo_eleitor => # "TO"
```

## Recomende

Gostou dessa gem? Recomende-me no [Working With Rails](http://www.workingwithrails.com/people/148426)!

## Contribuindo

1. Faça um Fork
2. Crie um branch para a nova funcionalidade (`git checkout -b minha-nova-funcionalidade`)
3. Faça o commit de suas alterações  (`git commit -am 'Adicionada nova funcionalidade'`)
4. Faça um push da sua nova funconalidade (`git push origin minha-nova-funcionalidade`)
5. Submeta uma nova Pull Request
