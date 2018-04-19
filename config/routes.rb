Rails.application.routes.draw do
  resources :locations, only: %i[index show]
end
