require "rails_helper"

describe "Viewing the list of movies" do

    it "shows the movies" do
        movie1 = Movie.create(movie_attributes)

        movie2 = Movie.create(movie_attributes(title: 'Iron Man 2'))

        movie3 = Movie.create(movie_attributes(title: 'Iron Man 3'))

        visit movies_url

        expect(page).to have_text('3 Movies')
        expect(page).to have_text(movie1.title)
        expect(page).to have_text(movie2.title)
        expect(page).to have_text(movie3.title)

        expect(page).to have_text(movie1.rating)
        expect(page).to have_text(movie1.description[0..10])
        expect(page).to have_text(movie1.released_on)
    end

    it "does not show a movie that hasn't yet been released" do
        movie = Movie.create(movie_attributes(released_on: 1.month.from_now))

        visit movies_url

        expect(page).not_to have_text(movie.title)
    end
end