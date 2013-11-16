require 'jsh/pair'

module JSH
  class Hooks < Pair
    DEFAULT_HOOKS = {
      :before => [],
      :after  => []
    }

    alias hooks data

    def default_data
      DEFAULT_HOOKS
    end

    def self.register(key, &block)
      (DEFAULT_HOOKS[key] ||= []) << block
    end
  end
end

JSH::Hooks.register(:before) do
  puts "JSH ver #{JSH::VERSION}"
  puts "If you want to stop, exec `exit` or `quit`"
end
