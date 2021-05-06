module KeyPayAPI
  class Client
    module Business
      # List businesses attached to current KeyPay account
      #
      # @return [ResourceCollection, Resource] either single resource object if one business, else collection
      def list_businesses
        get("/business")
      end
    end
  end
end
