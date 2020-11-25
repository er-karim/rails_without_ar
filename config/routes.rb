Rails.application.routes.draw do
  get 'hello/:name', to: 'welcome#index'
end
