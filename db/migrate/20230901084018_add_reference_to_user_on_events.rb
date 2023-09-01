class AddReferenceToUserOnEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_on_events, :user, null: false, foreign_key: true
  end
end
