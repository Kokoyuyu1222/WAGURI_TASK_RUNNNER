Rails.application.routes.draw do
  root 'homes#top'
  get '/search' => 'homes#search'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :consumers, controllers: {
    sessions:      'consumers/sessions',
    passwords:     'consumers/passwords',
    registrations: 'consumers/registrations'
  }

  devise_for :fermers, controllers: {
    sessions:      'fermers/sessions',
    passwords:     'fermers/passwords',
    registrations: 'fermers/registrations'
  }

    namespace :consumers do
      get 'consumers/withdraw'=> 'consumers#withdraw'
      patch 'consumers/change' => 'consumers#change'
      put 'consumers/change' => 'consumers#change'
      get '/search' => 'searches#search'
      resources :searches,only: [:index]
      resources :consumers,only: [:edit,:update,:show]
      resources :cards,only: [:create,:destroy]
      resources :fermers do
        resources :fermer_reviews,only: [:index,:show,:create,:destroy]
        resource :book_marks,only: [:create,:destroy]
      end
      resources :columns do
        resource :column_comments,only: [:index,:show,:create,:destroy], shallow: true
        resource :column_favorites,only: [:create,:destroy], shallow: true
      end
      resources :cart_products,only: [:index,:create,:update,:destroy]
      resources :destinations ,only: [:show,:index,:edit,:update,:create,:destroy]
      resources :products ,only: [:show,:index] do
        resource :product_comment,only: [:show,:create,:destroy], shallow: true
        resource :product_favorite,only: [:create,:destroy], shallow: true
      end
      get 'orders/confirm' => 'orders#confirm'
      post 'orders/pay' => 'orders#pay'
      get 'orders/finish' => 'orders#finish'
      resources :orders ,only: [:new,:create,:index,:show]
      delete 'consumers/cart_products/destroy_all'  => 'cart_products#destroy_all'
    end


    namespace :fermers do
      resources :fermers,only:[:show,:edit,:update]
      get '/search' => 'searches#search'
      get 'fermers/withdraw'=> 'fermers#withdraw'
      patch 'fermers/change' => 'fermers#change'
      put 'fermers/change' => 'fermers#change'
      resources :searches,only: [:index]
      post 'products/filter_brand' => 'products#filter_brand'
      resources :columns
      resources :columns_comments,only: [:index,:show], shallow: true
      resources :columns_favorites,only: [:index], shallow: true
      resources :products
      resources :products_comments,only: [:index,:show], shallow: true
      resources :products_favorites,only: [:index], shallow: true
      resources :order_products,only: [:update]
      resources :orders,only: [:show,:index,:update]
      resources :consumers,only: [:show,:index]
      resources :addresses ,only: [:show,:index,:edit,:update,:create,:destroy]
    end


    namespace :admins do
      get 'homes/top'
      get '/search' => 'searches#search'
      resources :searches,only: [:index]
      resources :consumers,only: [:show,:index,:destroy]
      resources :fermers,only: [:index,:show,:destroy]
      resources :categories,only: [:index,:create,:edit,:update,:destroy]
      resources :brands,only: [:index,:create,:edit,:update,:destroy]
      resources :products,only: [:index,:show,:destroy]
      resources :orders,only: [:show,:index,:destroy]
      resources :columns,only: [:index,:show,:destroy]
      resources :column_comments,only: [:index,:show]
      resources :products_comments,only: [:index,:show]
    end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
