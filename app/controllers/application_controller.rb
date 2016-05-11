class ApplicationController < ActionController::Base
  before_filter :add_or_increase_entry
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def add_or_increase_entry
      ip = request.ip
      if Entry.exists?(entry_ip: ip)
        Entry.find_by_entry_ip(ip).increment!(:entry_counter)
      else
        Entry.create({entry_ip: ip})
      end
    end
end
