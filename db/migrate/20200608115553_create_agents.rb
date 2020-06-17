class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :company
      t.string :name
      t.string :phone
      t.string :email
      t.string :url

      t.timestamps
    end
  end
end
