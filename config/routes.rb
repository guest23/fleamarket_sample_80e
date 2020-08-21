Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to:'productions#index'


    

  resources :cards do
    collection do
      #payjpでトークン化を行う
      post 'pay', to: 'cards#pay'
    end
  end



  resources :users, only: [:show]

  resources :productions do
    collection do
      get 'category/get_category_children', to: 'productions#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'productions#get_category_grandchildren', defaults: { format: 'json' }
      # get 'update'
    end
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        # get 'done', to: 'purchase#done'
      end
    end
  end

  
end

