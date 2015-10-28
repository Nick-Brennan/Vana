class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.float :distance
      t.string :monmap
      t.string :monpace
      t.string :monurl
      t.string :tuemap
      t.string :tuepace
      t.string :tueurl
      t.string :wedmap
      t.string :wedpace
      t.string :wedurl
      t.string :thumap
      t.string :thupace
      t.string :thuurl
      t.string :frimap
      t.string :fripace
      t.string :friurl
      t.string :satmap
      t.string :satpace
      t.string :saturl
      t.string :sunmap
      t.string :sunpace
      t.string :sunurl

      t.timestamps null: false
    end
  end
end
