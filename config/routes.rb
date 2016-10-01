Rails.application.routes.draw do
  get 'static/home'

  get 'static/help'

  get 'static/faq'

  get 'static/contact'

  get 'static/terms'

  resources :words
  resources :phrases
  root 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
