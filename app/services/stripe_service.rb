require 'stripe'

class StripeService
    def initialize()
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    end

    def find_or_create_customer(customer)
        if customer.stripe_customer_id.present?
            stripe_customer = Stripe::Customer.retrieve(customer.stripe_customer_id)
        else
            stripe_customer = Stripe::Customer.create({
                name: customer.full_name,
                email: customer.email,
                phone: customer.contact_number
            })
            customer.update(stripe_customer_id: stripe_customer.id)
        end
        stripe_customer
    end

    def create_stripe_customer_card(params, stripe_customer)
        
        Stripe::Customer.create_source(
            stripe_customer.id,
            { source: 'tok_mastercard' }
        )
    end
end