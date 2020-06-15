require 'grape-swagger'

module UsersNotes
  class Base < Grape::API
    prefix :api
    version 'v1', using: :path
    format :json

    mount UsersNotes::V1::Users
    mount UsersNotes::V1::Notes

    add_swagger_documentation hide_documentation_path: true,
                              api_version: 'v1',
                              info: {
                                  title: 'Horses and Hussars',
                                  description: 'Demo app for dev of grape swagger 2.0'
                              }
  end
end
