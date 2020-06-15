Rails.application.routes.draw do
  mount UsersNotes::Base, at: "/"
  mount GrapeSwaggerRails::Engine => '/swagger'
end
