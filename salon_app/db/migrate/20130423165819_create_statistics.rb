class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
    	t.float :rebooks
    	t.integer :lost
    	
      t.timestamps
    end
  end
end
