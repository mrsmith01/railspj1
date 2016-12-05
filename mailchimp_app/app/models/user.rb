class User < ApplicationRecord

validates :email, presence: true
validates :email, length: {minimum: 5}

before_save :downcase_email
after_save :subscribe

def downcase_email
  self.email = email.downcase
end

def subscribe
  gibbon = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
  list_id = Rails.application.secrets.list_id

  begin
    gibbon.lists(list_id).members.create(
    body: {
      email_address: self.email,
      status: "subscribed"
      })
  rescue Gibbon::MailChimpError => e
    puts "Try Again: #{e.message} - #{e.raw_body}"
  end
end
end