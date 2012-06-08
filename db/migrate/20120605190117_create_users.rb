class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      
      t.timestamps
    end
  end
end

#My understanding of this is that the |t| is a block variable 
#linked to the :user, so everythime the user changes something
#it automatically changes the nature of each string 
#e.g. name, email etc.
