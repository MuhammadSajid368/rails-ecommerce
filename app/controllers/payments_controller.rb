class PaymentsController < ApplicationController
  def new
    @amount = 5000
    
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'Your Product Name',
        amount: @amount,
        currency: 'usd',
        quantity: 1
      }],
      mode: 'payment',
      success_url: payment_success_url,
      cancel_url: payment_cancel_url
    )
    
    @session_id = session.id
  end

  def create
    @event = Stripe::Event.construct_from(
      params.permit!.to_h
    )
    
    case @event.type
    when 'checkout.session.completed'
      session = @event.data.object
      handle_successful_payment(session)
    else
      render status: 400, json: { error: 'Unhandled event type' }
    end

    render status: 200, json: { received: true }
  end

  def success
    redirect_to root_path, notice: 'Payment was successful!'
  end

  def cancel
    redirect_to root_path, alert: 'Payment was canceled.'
  end

  private

  def handle_successful_payment(session)
    order = Order.find_by(checkout_session_id: session.id)
    if order
      order.update(status: 'paid')
        OrderMailer.confirmation_email(order).deliver_now
    end
  end
end
