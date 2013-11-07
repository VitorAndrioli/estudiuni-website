class ContactsController < ApplicationController
  def index
    @designers = Designer.all
  end
end
