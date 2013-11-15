# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Spek::Application.config.secret_token = '352975c96936a493bacadd7cd24ed4392874bba6605da7c6798175a6aeeb927acd74daa4d6e0301b66308026989717efd77c8d8a1edc57a4d0ee51f973faae19'
Spek::Application.config.encrypt_key = Digest::SHA1.hexdigest("imjustAsubstitue")