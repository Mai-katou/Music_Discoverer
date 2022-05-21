Rails.application.routes.draw do

  root to: "homes#top"
  get "homes/about" => "homes#about", as: 'about_path'

  namespace :admin do
    get 'top' => 'homes#top'
  end

  devise_for :admin,controllers:{
    sessions:"admin/sessions"
  }
  devise_for :users, controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
