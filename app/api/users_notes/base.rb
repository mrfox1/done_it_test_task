module UsersNotes
  class Base < Grape::API
    prefix :api
    version 'v1', using: :path
    format :json

    mount UsersNotes::V1::Users
  end
end
