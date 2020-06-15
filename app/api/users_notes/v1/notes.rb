module UsersNotes
  module V1
    class Notes < Grape::API
      helpers do
        def current_user
          @current_user ||= User.try(:find_by, token: request.headers['Authorization'])
        end

        def user_signed_in?
          current_user.present?
        end

        def auth_with_token!
          error!('Unauthorized. Invalid or expired token.', 401) unless user_signed_in?
        end
      end

      before do
        auth_with_token!
      end

      resources :notes do
        desc "Create note"
        params do
          requires :note, type: Hash do
            requires :body, type: String
            requires :note_time, type: DateTime
          end
        end
        post do
          note = Note.new(params[:note])
          note.user = current_user
          note.save!
          present note
        end
      end
    end
  end
end