class FixUserAndMovie < ActiveRecord::Migration[6.0]
  def change
    remove_reference :movies, :user
    remove
  end
end
