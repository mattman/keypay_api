module KeyPayAPI
  class Client
    module Employee
      # List employees attached to business
      #
      # @param businessId [String] the KeyPay business ID
      # @return [ResourceCollection] list of employees
      def list_employees(businessId)
        get("/business/#{businessId}/employee/unstructured")
      end
      
      # Get a specific employee using their KeyPay employee ID
      #
      # @param businessId [String] the KeyPay business ID employee is working for
      # @param employeeId [String] the KeyPay employee ID you want to return
      # @return [Resource] a Resource object with the employee data
      def get_employee(businessId, employeeId)
        get("/business/#{businessId}/employee/unstructured/#{employeeId}")
      end
      
      # Get a specific employee using their external ID
      #
      # @param businessId [String] the KeyPay business ID employee is working for
      # @param externalId [String] the external ID of the employee you want to return
      # @return [Resource] a Resource object with the employee data
      def get_employee_external_id(businessId, externalId)
        get("/business/#{businessId}/employee/unstructured/externalid/#{externalId}")
      end      

      # Create a new employee in KeyPay
      #
      # @param businessId [String] the business you want to employ them under's KeyPay id
      # @param options [Hash] a hash of all relevant fields to create the employee (as per the KeyPay API docs), minimum list below to create an "Incomplete" employee
      # @option options [String] :taxFileNumber An Australian Tax File Number, can be '000000000' if you don't have it
      # @option options [String] :firstName The employee's first name
      # @option options [String] :surname The employee's surname / family name
      # @option options [String] :startDate Start date for the employment
      # @option options [String] :employmentType The employee's employment type, e.g. 'Casual'
      def create_employee(businessId,  options)
        post("/business/#{businessId}/employee/unstructured", options.to_json)
      end

      # Onboard an employee using the Onboard self service tool
      #
      # @param base Keypay::Base
      # @param businessId [String] the KeyPay business ID to employ under
      # @param options [Hash] Attributes to use for onboarding, must be in key/value pairs per KeyPay API Docs
      # @option options [String] :email The email address the employee has on file (or will update record if id supplied)
      # @option options [Boolean] :emergencyContactDetailsRequired
      # @option options [String] :firstName The employee's first name
      # @option options [String] :id The employee's existing KeyPay employeeId if already in system and just wanting to trigger onboard, otherwise ''
      # @option options [String] :mobile The employee's mobile phone number
      # @option options [Boolean] :qualificationsRequired
      # @option options [String] :surname The employee's surname / family name
      #
      # @return [nil] the API currently returns nothing if the employee is onboarded successfully
      def onboard_employee(businessId, options)
        post("/business/#{businessId}/employeeonboarding/initiateselfservice", options.to_json)
      end
    end
  end
end
