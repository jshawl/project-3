class AddUserToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :user, :user
  end
end
