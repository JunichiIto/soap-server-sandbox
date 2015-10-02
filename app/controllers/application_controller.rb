class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  def authenticate
    head :status => 403 and return unless current_user
  end

  helper_method :current_user
  def current_user
    client_cert = request.env['SSL_CLIENT_CERT']
    return nil if client_cert.nil? || client_cert.blank?
    logger.info "[INFO] SSL_CLIENT_CERT: #{client_cert}"
    pubkey = saved_pubkey
    logger.info "[INFO] saved pubkey: #{pubkey}"

    client_cert == pubkey
  end

  def saved_pubkey
    file_path = File.join(Rails.root, 'ssl/user.pubkey')
    File.read(file_path)
  end
end
