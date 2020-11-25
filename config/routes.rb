Rails.application.routes.draw do
  get 'hello', to: 'welcome#index'
  get 'reverse', to: 'welcome#reverse'
end
