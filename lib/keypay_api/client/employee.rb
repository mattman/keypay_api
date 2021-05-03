module KeyPayAPI
  class Client
    module Employee
      def list_employees(businessId)
        get("/business/#{businessId}/employee/unstructured")
      end

      def no_endpoint
        get("business/employee")
      end

      def show_employee(businessId, employeeId)
        get("/business/#{businessId}/employee/unstructured/#{employeeId}")
      end

      def create_employee(businessId,  options)
        post("/business/#{businessId}/employee/unstructured", options.to_json)
      end

      # Onboard an employee using the Onboard self service tool
      #
      # @param base Keypay::Base
      # @param businessId [String] the KeyPay business ID to employ under
      # @param options [Hash] Attributes to use for onboarding, must be in key/value pairs per KeyPay API Docs
      #
      # @return [Hash] the response from the API which should include an employee ID for the new employee
      def onboard_employee(businessId, options)
        post("/business/#{businessId}/employeeonboarding/initiateselfservice", options.to_json)
      end
    end
  end
end
