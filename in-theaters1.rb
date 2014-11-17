require 'pry'
require 'json'

movie_data = JSON.parse(File.read("in_theaters.json"))

movies = movie_data["movies"] ###array of hashes

puts "In Theaters Now:\n "

def get_title(movie)
  ###returns movie title
  return movie["title"]
end

def get_mpaa(movie)
  ###returns mpaa rating
  return movie["mpaa_rating"]
end

def avg_score(movie)
  ###return the average score
  average = (movie["ratings"]["critics_score"] + movie["ratings"]["audience_score"]) / 2
  return average
end

def top_cast(movie)
  ###returns the top 3 cast members
  array = []
  cast = movie["abridged_cast"].take(3)
  cast.each do |member|
    array << member["name"]
  end
  array.join(", ")
end

output = []

movies.each do |movie|
  output << [avg_score(movie), " - " + get_title(movie) + " (" + get_mpaa(movie) + ") " + "starring " + top_cast(movie)]
  end


output.sort!.reverse!

output.each do |movie|
puts  movie.join
end
