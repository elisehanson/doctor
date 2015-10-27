class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|

  		t.string :fname
    	t.string :lname
    	t.string :specialty

      t.timestamps null: false
    end
  end
end
