require 'jsh/context'
require 'jsh/commands'
require 'jsh/hooks'
require 'jsh/version'

module JSH
  class Base
    def context
      @context ||= Context.new
    end

    def output
      STDOUT
    end

    def commands
      @commands ||= Commands.new
    end

    def hooks
      @hooks ||= Hooks.new
    end
  end
end
