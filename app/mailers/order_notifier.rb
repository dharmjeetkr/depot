class OrderNotifier < ApplicationMailer

   default from: 'dharmjeet <dharmjeetkr18@gmail.com>' # sender name and mail id

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  
   def received(order)
	@order = order
	mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
   end

 
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  #def shipped
    #@greeting = "Hi"

    #mail to: "to@example.org"
  #end

   def shipped(order)
	@order = order
	mail to: order.email, subject: 'Pragmatic Store Order Shipped'
   end


end
