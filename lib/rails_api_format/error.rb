require "securerandom"

module RailsApiFormat
  class Error
    include ActiveModel::Model
    include ActiveModel::Serialization

    attr_accessor :id, :status, :error, :validations

    def attributes
      {
        id: id,
        status: status,
        error: error,
        validations: validations
      }.with_indifferent_access
    end

    def to_json(options = {})
      ActiveModel::SerializableResource.new(self, options).to_json
    end

    def status
      Rack::Utils.status_code(@status)
    end

    def id
      @id || ENV.fetch("ACTION_DISPATCH_REQUEST_ID", SecureRandom.uuid)
    end
  end
end
