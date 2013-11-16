require 'v8'
require 'jsh/error_handler'

module JSH
  class Context < V8::Context
    def eval(*)
      super rescue ErrorHandler.new($!)
    end
  end
end
