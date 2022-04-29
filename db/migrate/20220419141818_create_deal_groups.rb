class CreateDealGroups < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :deals do |t|      
      t.index [:deal_id, :group_id]
    end
  end
end
