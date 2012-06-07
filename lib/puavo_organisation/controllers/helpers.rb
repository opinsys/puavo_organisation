module PuavoOrganisation
  module Controllers
    module Helpers

      def set_organisation_to_session
          session[:organisation] = current_organisation
          assert_organisation current_organisation
      end

      def current_organisation
        return @current_organisation if @current_organisation

        begin
          if credentials = oauth_credentials
            if organisation = Puavo::Organisation.find(credentials[:host])
              logger.debug "Got organisation #{ organisation_name } from OAuth"
              return @current_organisation = organisation
            end
          end
        rescue AccessToken::Expired
        end

        @current_organisation = Puavo::Organisation.find_by_host(request.host)
        @current_organisation = Puavo::Organisation.find_by_host("*") unless @current_organisation
        return @current_organisation

      end

      def assert_organisation(organisation)
        # TODO fix for oauth?
        unless organisation.host == request.host || organisation.host == "*"
          # This is a serious problem. Some one trying to hack this system.
          raise "die"
        end
      end


      def set_locale
        I18n.locale = current_organisation.value_by_key('locale') ?
        current_organisation.value_by_key('locale') : :en
      end

      def theme
        # session[:theme] ? session[:theme] : "tea"
        "gray"
      end
    end
  end
end
