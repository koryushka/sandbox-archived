class AddDataToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :data, :jsonb
  end
end
