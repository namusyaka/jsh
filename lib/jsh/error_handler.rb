module JSH
  class ErrorHandler
    def initialize(error)
      @error = error
    end

    def to_s
      @error.message
    end
  end
end
