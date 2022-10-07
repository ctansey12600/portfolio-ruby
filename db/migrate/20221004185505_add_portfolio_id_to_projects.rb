class AddPortfolioIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :portfolio_id, :integer
  end
end
