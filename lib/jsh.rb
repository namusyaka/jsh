require 'jsh/base'
require 'jsh/repl'

module JSH
  def self.start(options = {})
    REPL.start(options)
  end
end
