class UserMailer < ActionMailer::Base
  default :from => "TESTE DE EMAIL<teste@korewa.com.br>"
  
  def send_email_password_reset(user)
    @user = user
		mail(:to => user.email, :subject => "Instruções para trocar a senha")
	end
	
	def send_contact(sitecontact)
    @sitecontact = sitecontact
		mail(:to => "equipevaldomiro@gmail.com", :reply_to => sitecontact.email, :subject => "Nova mensagem através do FB - Contact Form")
	end
	
end
