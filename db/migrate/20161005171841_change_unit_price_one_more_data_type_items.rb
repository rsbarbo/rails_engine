class ChangeUnitPriceOneMoreDataTypeItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :unit_price, :integer
  end
end
