module UsersNotes
  module Entities
    class User < Grape::Entity
      expose :email
      expose :token
    end
  end
end