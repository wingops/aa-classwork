class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])

        User.find_by(id: params[:id]) {"id" => params[:id]}
    end
end
