class ChangeCampingTripTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :campingtrip, :campingtrips

  end
end
