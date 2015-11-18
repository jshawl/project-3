class AddResponseIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :response_id, :integer
  end
end
