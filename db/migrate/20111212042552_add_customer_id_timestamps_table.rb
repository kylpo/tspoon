class AddCustomerIdTimestampsTable < ActiveRecord::Migration
  def up
    add_column :timestamps, :user_id, :integer
  end

  def down
    remove_column :timestamps, :user_id
  end
end
