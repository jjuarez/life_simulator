require 'choice'


Choice.options do
  
  header ''
  header ' options:'

  option :config, :required=>true do
    short "-c"
    long  "--config"
    desc  "The config file in yaml format"
  end 

  separator ""
  separator " help:"
  
  option :help do
    short "-h"
    long  "--help"
    desc  "Show this help screen"
  end

  separator ""
end