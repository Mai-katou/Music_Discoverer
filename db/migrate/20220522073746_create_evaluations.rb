class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :user_id, null: false
      t.string :music_title, null: false
      t.integer :point, null: false
      t.string :evaluation, null: false
      t.timestamps
    end
  end
end
