class Song < ApplicationRecord
   validates :artist_name, presence: true
   validates :title, presence: true
   validates :title, uniqueness: {
      scope: %i[release_year artist_name], message: "cannot be released by the same artist in the same year." }
   validates :released, inclusion: { in: [true, false] } 
   validates :release_year, presence: true, if: :released
   validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
   
   
   # validate :valid_release_year
   
   
   # def valid_release_year
   #    if self.released == true && self.release_year == nil
   #       errors.add(release_year: "Release year cannot be empty")
   #    elsif self.released == true && self.release_year > Date.today.year
   #       errors.add(release_year: "Release year cannot be future year")
   #    end
   # end

end
