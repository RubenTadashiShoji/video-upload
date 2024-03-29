# Preview all emails at http://video-upload-rubenjohne.c9users.io/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://video-upload-rubenjohne.c9users.io/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first 
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at http://video-upload-rubenjohne.c9users.io/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first 
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end


  def general_message
    contact = Contact.new(name: "Contestant", email: "rubenjohne@gmail.com", message: "This is a test Message from the contact form")
    UserMailer.general_message(contact)
  end
  
end
