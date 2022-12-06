require 'stripe'

# Stripe.api_key = Rails.application.secrets.stripe_secret_key
Stripe.api_key = Rails.application.credentials[Rails.env.to_sym][:stripe_secret_key]

