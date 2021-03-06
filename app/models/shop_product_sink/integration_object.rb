module ShopProductSink
  class IntegrationObject < ActiveRecord::Base
    class Error < StandardError; end
    include ApiCreatable
    has_many :integration_object_relations

    def save(*args)
      unless Rails.env.test?
        raise Error, "Cannot use IntegrationObject in non-test environment"
      end
      super
    end
  end
end
