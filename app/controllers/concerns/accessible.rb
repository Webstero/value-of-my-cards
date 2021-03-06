# frozen_string_literal: true

module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_resource
  end

  protected

  def check_resource
    if current_admin
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(admins_root_path) and return
    elsif current_user
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(root_path) and return
    end
  end
end
