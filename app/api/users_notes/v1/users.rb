module UsersNotes
  module V1
    class Users < Grape::API
      resources :users do
        desc "Create user"
        params do
          requires :user, type: Hash do
            requires :email, type: String
            requires :password, type: String
          end
        end
        post do
          user = User.create!(params[:user])
          present user
        end

        desc "Login on service"
        params do
          requires :user, type: Hash do
            requires :email, type: String
            requires :password, type: String
          end
        end
        post "/login" do
          user = User.find_by(email: params[:user][:email].downcase)
          if user && user.authenticate(params[:user][:password])
            user.regenerate_token
            present user
          else
            error!(:not_found, 404)
          end
        end
      end
    end
  end
end