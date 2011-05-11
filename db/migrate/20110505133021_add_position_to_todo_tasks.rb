class AddPositionToTodoTasks < ActiveRecord::Migration
  def self.up
    add_column :todo_tasks, :position, :integer
  end

  def self.down
    remove_column :todo_tasks, :position
  end
end
