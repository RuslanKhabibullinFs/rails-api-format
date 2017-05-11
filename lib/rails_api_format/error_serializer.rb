module RailsApiFormat
  class ErrorSerializer < ActiveModel::Serializer
    attributes :id, :status, :error, :validations

    # Specify root element as `error` instead of auto generated `rails_api_format/error`
    # https://github.com/rails-api/active_model_serializers/pull/1029#issuecomment-131896282
    def json_key
      "error"
    end

    private

    def include_validations?
      validations
    end
  end
end
