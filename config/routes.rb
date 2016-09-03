Rails.application.routes.draw do

  resources :items do
    resources :item_packs
  end

  shallow do
    resources :orders do
      resources :order_items do 
        resources :order_item_histories
      end
    end
  end

  resources :customers
end
