class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :value
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
