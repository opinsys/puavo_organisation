module Puavo
  class Organisation
    @@configurations = YAML.load_file("#{RAILS_ROOT}/config/organisations.yml")
    @@key_by_host = {}
    @@configurations.each do |key, value|
      @@key_by_host[ value["host"] ] = key
    end

    cattr_accessor :configurations, :key_by_host
    attr_accessor :organisation_key

    def schools
      School.all
    end

    def value_by_key(key)
      @@configurations[organisation_key][key]
    end

    def method_missing(method, *args)
      if @@configurations[organisation_key].has_key?(method.to_s)
        @@configurations[organisation_key][method.to_s]
      else
        super
      end
    end

    class << self
      def find(key)
        if self.configurations.has_key?(key)
          organisation = Organisation.new
          organisation.organisation_key = key
          organisation
        else
          logger.info "Can not find configuration key: #{key}"
          false
        end
      end

      def find_by_host(host)
        if @@key_by_host.has_key?(host)
          organisation = Organisation.new
          organisation.organisation_key = @@key_by_host[host]
          organisation
        else
          logger.info "Can not find organisation by host: #{host}"
          false
        end
      end

      def logger
        RAILS_DEFAULT_LOGGER
      end
    end
  end
end
