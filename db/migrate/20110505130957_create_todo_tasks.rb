class CreateTodoTasks < ActiveRecord::Migration
  def self.up
    create_table :todo_tasks do |t|
      t.string :title
      t.text :body
      t.boolean :done
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :todo_tasks
  end
end
