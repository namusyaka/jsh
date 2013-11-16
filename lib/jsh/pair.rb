module JSH
  class Pair
    attr_accessor :data

    def initialize(data = nil)
      @data = data || default_data
    end

    def [](key)
      @data[key]
    end

    def []=(key, value)
      @data[key] = value
    end

    def all
      @data
    end

    private

    def default_data
      {}
    end
  end
end
