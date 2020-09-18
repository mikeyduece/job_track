class CreateFollowUps < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_ups, id: :uuid do |t|
      t.integer :number, null: false, index: true
      t.string :interval, null: false, index: true
      t.references :job_application, null: false, index: true, type: :uuid

      t.timestamps
    end

    add_index :follow_ups, %i[number interval]
  end
end
