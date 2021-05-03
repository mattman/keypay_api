module KeyPayAPI
  class Client
    module Connection

      def get(path, options = {})
        request :get, path, options
      end

      def post(path, options = {})
        request :post, path, options
      end

      def put(path, options = {})
        request :put, path, options
      end

      def delete(path, options = {})
        request :delete, path, options
      end

      private

      def request(http_method, path, options)
        response = self.class.send(http_method, path, { body: options })
        puts response
        raise KeyPayAPI::Error.new response.message if !response.success?
        data = response.parsed_response
        parse_data(data)
      end

      def parse_data(original_data)
        return unless original_data

        data = original_data.length == 1 ? original_data.first : original_data  

        case data
        when Hash  then Resource.new(self, data)
        when Array then ResourceCollection.new(self, data)
        when nil   then nil
        else data
        end
      end

    end
  end
end
