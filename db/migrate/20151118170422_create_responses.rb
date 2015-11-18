class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.question_id :integer
      t.user_id :integer
      t.string :color

      t.timestamps null: false
    end
  end
end
