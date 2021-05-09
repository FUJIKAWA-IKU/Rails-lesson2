class AddColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :start, :date
    add_column :reservations, :end, :date
    add_column :reservations, :people, :integer
  end
end
