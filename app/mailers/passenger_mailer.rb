class PassengerMailer < ApplicationMailer
    def confirmation_email(passenger)
        @passenger = passenger
        mail(to: @passenger, subject: 'Flight Booking Confirmation')
    end
end
