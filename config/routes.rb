Rails.application.routes.draw do
  # show our todo index page for as root page
  root 'todos#index'

  resources :todos
end
