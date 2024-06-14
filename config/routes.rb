Rails.application.routes.draw do
  resources :blog_posts
  devise_for :users
  root to: "blog_posts#index" 
end
