class CreateEventUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :event_users do |t|
      # t.references :event_attendee, null: false, foreign_key: true
      # t.references :attended_event, null: false, foreign_key: true
      t.belongs_to :event_attendee, index: true
      t.belongs_to :attended_event, index: true
      t.timestamps
    end
  end
end
