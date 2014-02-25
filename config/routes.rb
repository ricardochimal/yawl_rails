YawlRails::Engine.routes.draw do
  scope as: 'yawl' do
    resources :processes, :only => [:index, :show] do
      member do
        post :restart
        get :steps
      end
      resources :steps, :only => [:show]
    end
  end
end
