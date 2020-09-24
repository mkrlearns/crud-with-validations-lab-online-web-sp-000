class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {
    scope: [:artist_name, :release_year],
    message: 'Cannot be repeated by the same artist in the same year.',
  }
  validates :released, inclusion: {
    in: [true, false],
    message: 'Must be true or false.',
  }
  validates :release_year, presence: true, if: :released?, numericality: {
    less_than_or_equal_to: Time.now.year,
  }
  validates :artist_name, presence: true

  def released?
    released
  end

end
