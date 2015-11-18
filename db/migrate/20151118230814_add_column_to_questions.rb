class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :color, :string
  end
end
