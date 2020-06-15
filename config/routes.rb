Rails.application.routes.draw do
  mount UsersNotes::Base, at: "/"
end
