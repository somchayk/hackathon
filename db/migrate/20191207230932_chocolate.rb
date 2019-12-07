class Chocolate < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :user, index: true
  end
end
