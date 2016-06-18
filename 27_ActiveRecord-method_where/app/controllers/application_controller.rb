class ApplicationController < ActionController::Base # все методы отсюда будут дуступны в контроллерах
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private # привтатные методы досупны в классе  ItemsController < ApplicationController

    def render_403
      render file: "public/403.html", status: 403
    end

    def render_404
      render file: "public/404.html", status: 404
    end


  def check_if_admin
    # render text: "Access denied", status: 403 unless params[:admin]
    render_403 unless params[:admin]
  end
end
