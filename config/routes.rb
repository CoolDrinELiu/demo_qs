Rails.application.routes.draw do
  
  namespace :admin do
    root 'home#index'
    devise_for :users, path: "/admin", path_names: { sign_in: "login", sign_out: "logout" }, controllers: { sessions: "admin/users/sessions", passwords: "admin/passwords" }
  end
end
