class AddSynposisToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :synopsis, :string
  end
end
