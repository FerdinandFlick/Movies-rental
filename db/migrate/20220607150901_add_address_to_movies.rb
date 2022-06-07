class AddAddressToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :address, :string
  end
end
