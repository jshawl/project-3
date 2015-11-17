class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.value :string
      t.reference :question

      t.timestamps null: false
    end
  end
end
