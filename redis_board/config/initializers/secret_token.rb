# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
RedisBoard::Application.config.secret_key_base = 'f004f373eb271531d68d2345de4dcc518712a67030afbe561bf407fa006b2c939f5c58ad5eba9280909283987a5706833ad6ed68eaa5969f9cf4efb2b751cd0c'
