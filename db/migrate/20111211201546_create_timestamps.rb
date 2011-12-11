class CreateTimestamps < ActiveRecord::Migration
  def change
    create_table :timestamps do |t|
      t.string :value

      t.timestamps
    end
  end
end
