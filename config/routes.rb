RPD12::Application.routes.draw do
	
  get "sessions/new"

	post "speeches/create_entry_form"
	
	get "pages/home"
  match '/home', :to => 'posts#news_page'
  get "pages/home"
	match '/home', :to => 'posts#news_page'
  get "pages/about"
	match '/about', :to => 'pages#about'
  get "pages/org_committee"
	match '/org_committee', :to => 'pages#org_committee'
  get "pages/thesis_rules"
	match '/thesis_rules', :to => 'pages#thesis_rules'
  get "pages/contacts"
	match '/contacts', :to => 'pages#contacts'
  get "pages/signup"
  match '/signup', :to => 'users#new'
  get "pages/tasks"
  match '/tasks', :to => 'pages#tasks'
  
  match '/registration', :to => 'speeches#new_entry_form'

  scope "(:locale)", :locale => /ru|en/ do
    resources :users
    resources :pages
    resources :posts
    resources :speeches
    resources :sessions, :only => [:new, :create, :destroy]
  end

  match "/signin" => "sessions#new", :as => "signin"
  match "/signout" => "sessions#destroy", :as => "signout"

  match '/:locale' => 'posts#news_page'
  root :to => "posts#news_page"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
