class Api::ContactsController < ApplicationController
  def single_contact
    @contact = Contact.first
    render "single_contact.json.jb"
  end

  def all_contacts
    @all_contacts = Contact.all
    render "all_contacts.json.jb"
  end
end
