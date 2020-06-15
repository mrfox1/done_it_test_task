Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount UsersNotes::Base, at: "/"
  mount GrapeSwaggerRails::Engine => '/swagger'
end
