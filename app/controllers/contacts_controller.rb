class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(params[:contact])
  	@contact.request = request
  	if @contact.deliver 
  		flash.now[:notice] = 'Gracias por tu mensaje!' 
  	else render :new 
  	end 
  		
  end

  def faq 
  render :faq
  end
end
