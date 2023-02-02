class CustomerMailer < ApplicationMailer
  default from: 'bonjour.feedtruck@yopmail.com'

  def welcome_email(customer)
    @customer = customer
    # @url = 'https://feedtruck.herokuapp.com/customers/sign_in'
    @url = 'http://localhost:3000/customers/sign_in'
    mail(to: @customer.email, subject: 'Bienvenue sur FeedTruck')
  end
  
  def order_email(customer)
    @customer = customer
    @order = @customer.orders.last
    @foodtruck = @order.foodtruck
    @order_contents = @order.order_contents   
    @total_price = @order.total_price
    # @url = 'https://feedtruck.herokuapp.com/customer/orders'
    @url = 'http://localhost:3000/customer/orders'
    mail(to: @customer.email, subject: 'Confirmation de votre commande')
  end

  def order_ready_email(customer)
    @customer = customer
    @order = @customer.orders.where(is_ready: true).where("updated_at > ?", Time.now - 3).last
    @foodtruck = @order.foodtruck
    mail(to: @customer.email, subject: 'Votre commande est prête')
  end
end
