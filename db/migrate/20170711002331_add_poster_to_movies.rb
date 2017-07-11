class AddPosterToMovies < ActiveRecord::Migration[5.0]
  def up
    add_attachment :movies, :poster
  end

  def down
    remove_attachment :movies, :poster
  end
end
