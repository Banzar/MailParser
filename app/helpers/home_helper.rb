module HomeHelper
	def account_login
		Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)  
		Net::POP3.start('pop.gmail.com', 995, ENV["email"],Env["auth"]) do |pop|  
		unless pop.mails.empty?
		     pop.each_mail do |mail|  
		      email = TMail::Mail.parse(mail.pop)
		      email_obj=EmailedQueries.new
		      email_obj.save_email(email.from,email.subject,email.body_html)        
		      end 
		  end
	 end   
	end
end
