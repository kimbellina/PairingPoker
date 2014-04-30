class AddUserRefToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :owner, index: true
  end
end
