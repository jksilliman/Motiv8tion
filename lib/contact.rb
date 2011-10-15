class Contact
  def self.sms(number, message)
    @client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_TOKEN)
    @account = @client.account
    @message = @account.sms.messages.create({:from => TWILIO_NUMBER, :to => number, :body => message})
  end
end
