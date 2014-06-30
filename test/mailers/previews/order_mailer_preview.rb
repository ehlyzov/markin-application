# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def created
    OrderMailer.created(Order.completed.last)
  end
end
