class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :job
      t.text :bio
      t.string :gender
      t.date :birthdate
      t.string :picture

      t.timestamps
    end
  end
end
