require 'puavo/organisation'
require 'puavo_organisation/controllers/helpers'

ActionController::Base.send :include, PuavoOrganisation::Controllers::Helpers
