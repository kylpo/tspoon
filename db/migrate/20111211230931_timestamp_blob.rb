class TimestampBlob < ActiveRecord::Migration
  def up
    change_column :timestamps, :value, :binary
  end

  def down
    change_column :timestamps, :value, :string
  end
end
