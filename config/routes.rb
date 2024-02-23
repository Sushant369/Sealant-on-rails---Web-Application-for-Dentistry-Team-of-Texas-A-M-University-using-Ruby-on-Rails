# frozen_string_literal: true

Rails.application.routes.draw do
  get '/export_event_details', to: 'excel_exports#export_event_details'
  get '/export_child_level_details_with_patient_info', to: 'excel_exports#export_child_level_details'
  resources :child_level_details
  get 'statistics/index'
  get 'statistics/school'
  get 'statistics/event'
  get 'statistics/schoolStats'
  resources :child_details
  resources :patient_details, param: :PID

  resources :event_details

  root 'application#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/child_data' => 'child_level_details#child_data'
  get '/screening' => 'child_details#screening'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/patient_details/:PID', to: 'patient_details#show', as: 'patient_detail_show'
end
