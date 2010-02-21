# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gatecamper_session',
  :secret      => 'f7a27a66f16a4f67fe9e87ff0994875c6b814a5e8be34e9912b58db8f5f5bb542345c4dafede5e61058a119728bdff90e14d4678527bd97c5dc2b5488259251f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
