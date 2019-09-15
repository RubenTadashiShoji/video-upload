class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      UserMailer.general_message(@contact).deliver_now
      render :thanks
    else
      render :new
    end
    
  end

  def thanks
  end
  
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
  
  
end
