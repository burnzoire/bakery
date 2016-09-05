Rails.application.routes.draw do
  shallow do
    resources :items do
      resources :item_packs
    end

    resources :orders do
      resources :order_items do 
        resources :order_item_histories
      end
    end

  end
  
  resources :customers

  root 'orders#index' # for demo purposes
end
