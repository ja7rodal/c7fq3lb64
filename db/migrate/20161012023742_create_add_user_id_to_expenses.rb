class CreateAddUserIdToExpenses < ActiveRecord::Migration
  def change
      add_column :expenses, :user_id, :integer

  end
end
