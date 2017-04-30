class AddTopicToPosts < ActiveRecord::Migration
  def change
    
    #the name of the class is important it says we will add table whose id we want to add to table we want to add the foreign key to
    add_column :posts, :topic_id, :integer
    
    #At #6, we created an index on topic_id with the generator. An index improves the speed of operations on a database table.
    add_index :posts, :topic_id
  end
end


#instructed the generator to create a migration that adds a topic_id column to the posts table