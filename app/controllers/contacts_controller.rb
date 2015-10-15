class ContactsController < ApplicationController
	before_action :find_contact, only: [:edit, :update, :destroy]
	def index
		@contacts = Contact.all.order("created_at DESC")
	end
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			flash[:notice] = "Contact created"
			redirect_to(:action=>'index', :contact_id => @contact.id)
		else
			@contacts = Contacts.order()
			render('new')
		end
	end

	def destroy
		@contact.destroy
		redirect_to contacts_path
	end

	private
	def find_contact
		@contact=Contact.find(params[:id])
	end
	def contact_params
		params.require(:contact).permit(:name, :clink)
	end
end