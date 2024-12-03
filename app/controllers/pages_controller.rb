class PagesController < ApplicationController
    def index
    end
  
    def contact
      @contact = Contact.new
    end
  
    def about
    end
  end