module KeyPayAPI
  class Resource
    attr_reader :data

    def initialize(client, data)
      data = {} unless data.is_a?(Hash)

      @client = client

      data = data.with_indifferent_access

      @data   = OpenStruct.new(data.with_indifferent_access)

    end

    def method_missing(method_sym, *arguments, &block)
      if @data.respond_to?(method_sym)
        @data.send(method_sym)
      else
        super
      end
    end

  end
end
