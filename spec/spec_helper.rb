# Require Code Climate Test Reporter
require "codeclimate-test-reporter"

# Starts Code Climate Test Reporter
CodeClimate::TestReporter.start

# Require Coveralls for Test cover
require 'coveralls'

# Starts Coderalls
Coveralls.wear!

# Require other files of project
require "titulo_eleitor_utils"
require_relative "../lib/titulo_eleitor_utils/titulo_eleitor"
