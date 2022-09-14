Rails.application.routes.draw do
  root "data#index"
  get "/data", to: "data#index"
  get "/senddata", to: "data#sendData"
end
