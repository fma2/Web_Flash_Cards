class CreateTables < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :email
  		t.string :password
  		t.timestamps
  	end

  	create_table :rounds do |t|
  		t.references :user
  		t.timestamps
  		
  	end
  	
  	create_table :guesses do |t|
  		t.references :round
  		t.references :card
  		t.boolean :correct, :default => false
  	end
  	
  	create_table :cards do |t|
  		t.references :deck
  		t.string :question
  		t.string :choice1
  		t.string :choice2
  		t.string :choice3
  		t.string :answer
  		t.timestamps
  	end
  	
  	create_table :decks do |t|
  		t.string :name
  		t.references :user
  	end
  	
  end
end
