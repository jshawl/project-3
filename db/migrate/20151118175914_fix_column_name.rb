class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :questions, :question, :body
  end
end
