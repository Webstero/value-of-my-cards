# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions'}
  
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions'}, :skip => :registration

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        get 'dashboard/index', as: :root
      end
    end
  end

  root to: "home#index"

end
