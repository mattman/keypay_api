module KeyPayAPI
  class ResourceCollection < Resource
    include Enumerable

    attr_reader :options

    def initialize(client, data, options = {})
      @client = client

      collection = Array(data).map do |item|
        Resource.new(client, item)
      end

      @data = OpenStruct.new(collection: collection)
      @options = options.with_indifferent_access
    end

    def each
      return enum_for(:each) unless block_given?

      collection.each { |item| yield item }

      return self
    end

  end
end
