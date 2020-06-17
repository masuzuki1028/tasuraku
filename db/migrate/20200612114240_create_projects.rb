class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :agent, foreign_key: true
      t.string :title
      t.text :content
      t.string :status
      t.string :schedule

      t.timestamps
    end
  end
end
