BreakthroughForMen::Application.routes.draw do
  root to: 'welcome#index'

  namespace :admin do
    root to: 'base#index'
    resources :intro_meetings, only: [:new, :create]
  end
end
