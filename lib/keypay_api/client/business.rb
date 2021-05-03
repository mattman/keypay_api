module KeyPayAPI
  class Client
    module Business
      def list_businesses
        get("/business")
      end
    end
  end
end
