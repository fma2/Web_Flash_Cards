class AddColumnToCards < ActiveRecord::Migration
  def up
  	add_column :cards, :question, :text
  end

  def down
  	remove_column :cards, :question, :text  	
  end
end
