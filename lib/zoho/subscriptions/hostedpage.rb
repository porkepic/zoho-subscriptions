module Zoho
  module Subscriptions
    class Hostedpage < ResourceBase
      resource_attributes :hostedpage_id,
                          :status,
                          :url,
                          :action,
                          :expiring_time,
                          :created_time

      class << self
        def update_card(attributes)

          response = Client.post "#{resource_path}/updatecard", body: attributes.to_json

          case response.code
          when 201
            new response[resource_name].slice(*attribute_names.map(&:to_s))
          else
            unexpected_response response
          end
        end

        def new_subscription(attributes)

          response = Client.post "#{resource_path}/newsubscription", body: attributes.to_json

          case response.code
          when 201
            new response[resource_name].slice(*attribute_names.map(&:to_s))
          else
            unexpected_response response
          end
        end

      end
    end
  end
end
