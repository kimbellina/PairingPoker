class AddUserRefToPartnerships < ActiveRecord::Migration
  def change
    add_reference :partnerships, :user, index: true
    add_reference :partnerships, :partner, index: true
  end
end
