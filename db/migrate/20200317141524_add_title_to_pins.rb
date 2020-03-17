class AddTitleToPins < ActiveRecord::Migration[5.2]
  def change
    add_column :pins, :title, :string
  end
end
