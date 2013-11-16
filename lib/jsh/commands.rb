require 'jsh/pair'

module JSH
  class Commands < Pair
    DEFAULT_COMMANDS = {}

    alias commands data

    def default_data
      DEFAULT_COMMANDS
    end

    def self.register(key, &block)
      DEFAULT_COMMANDS[key] = block
    end
  end
end

exit_lambda = lambda { throw :halt }
%w[quit exit].each{|key| JSH::Commands.register(key.to_sym, &exit_lambda) }
