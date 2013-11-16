require 'jsh/base'
require 'readline'

module JSH
  class REPL
    DEFAULT_PROMPT = "[{:number_of_times:}] jsh) "
    PROMPT_SYNTAX  = /\{:(.+?):\}/

    attr_accessor :base, :prompt

    def self.start(options)
      new(Base.new, options).start
    end

    def initialize(base, options = {})
      @base = base
      @noprompt = options.fetch(:noprompt, false)
      @readline = options.fetch(:readline, true)
      @options = options
      config[:number_of_times] = 0
    end

    def start
      call_hook(:before)
      repl
      call_hook(:after)
    end

    def repl
      catch :halt do
        loop do
          input = read
          if command = commands[input.to_sym]
            command.arity != 0 ? command.call(base) : command.call
          else
            output.puts((input.nil? or input.empty?) ? "" : base.context.eval(input))
          end
          config[:number_of_times] += 1
        end
      end
    end

    def noprompt?
      @noprompt
    end

    def readline?
      @readline
    end

    private

    def setup_prompt
      (self.prompt ||= DEFAULT_PROMPT).gsub(PROMPT_SYNTAX){ config[$1.to_sym] || key }
    end

    def read
      if readline?
        Readline.readline(noprompt? ? "" : setup_prompt, true)
      else
        print setup_prompt unless noprompt?
        gets.chomp
      end
    end

    def config
      @config ||= {}
    end

    def output
      @output ||= base.output
    end

    def commands
      @commands ||= base.commands
    end

    def call_hook(key)
      base.hooks[key].map(&:call)
    end
  end
end
