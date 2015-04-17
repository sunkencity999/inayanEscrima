class Contact < MailForm::Base
  
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
 
  def headers
    {
      :subject => "Contact Request From Inayan-Eskrima.com",
      :to => "your_email@example.org",
      :from => %("#{name}" <#{email}>)
    }
  end

end