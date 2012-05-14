class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_locale

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
    locale = TLD_LOCALE_MAP[request.host.split('.').last.to_sym]
    I18n.available_locales.include?(locale) ? locale  : nil
  end
end
