# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  google_credentials = Rails.application.credentials.google
  provider :google_oauth2, google_credentials[:client_id], google_credentials[:client_secret],
           {
             scope: 'email, profile', # This will allow us to get the user's email address and profile picture.
             prompt: 'select_account', # This will allow the user to select which account they want to login with.
             image_aspect_ratio: 'square', # This will make sure that the profile picture is a square.
             image_size: 50 # This will make sure that the profile picture is 50x50 pixels.
           }
end
