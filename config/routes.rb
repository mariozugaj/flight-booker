Rails.application.routes.draw do
  get 'bookings/new'

  root 'flights#index'
  get '/flights', to: 'flights#index'
end
