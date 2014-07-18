class ChangeColumnCards < ActiveRecord::Migration
  def up
  	remove_column :cards, :question, :string
  end

  def down
  	add_column :cards, :question, :string  	
  end
end
