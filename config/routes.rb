Rails.application.routes.draw do
	
  get 'sections/index'

  get 'sections/show'

  get 'sections/new'

  get 'sections/edit'

  get 'sections/delete'

  get 'pages/index'

  get 'pages/show'

  get 'pages/new'

  get 'pages/edit'

  get 'pages/delete'

  root "demo#index"

  #get 'demo/index'
  match ':controller(/:action(/:id))', :via => [:get, :post]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
