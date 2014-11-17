#require "pry"
require "json"
movie_data = JSON.parse(File.read("in_theaters.json"))

final_array = []
actor_array = []
final_line = ""
puts "In Theaters Now:\n "

movie_data["movies"].each do |movie| ## goes to the array "movies" and does each element
  avg_score = (movie["ratings"]["critics_score"] + movie["ratings"]["audience_score"])/2 ## finds the audience score and critic score and divides it by two
  movie_title = movie["title"].to_s  ### goes to the "movies" array and finds the title
  mpaa_score = movie["mpaa_rating"] ### goes to the "movies array and finds the mpaa_rating"
  final_line = "" ## we add a string called final_string which will push the final line for the output
  actor_count = movie["abridged_cast"].length #finds how many indexes are in the array "abridged_cast"
  count = 0 ###counter so that only 3 characters names come out as an output.
  final_line << "#{avg_score} - #{movie_title} (#{mpaa_score}) starring " #interpolates the different variables we found and pushes it as a string to final_line

    if actor_count == 1 ###loops through the actor count to see if theres just one actor.
    final_line << movie["abridged_cast"][count]["name"] ###if there is a actor_count length of one it will push it to the final_line
    else
      while count <= 3 #will loop through the characters and only push in upto the 3rd character as the count increases everytime it goes through this loop.
    actor_array <<  movie["abridged_cast"][count]["name"] ### finds the character name and pushes it into the final line.
    count += 1
      end
    end
    final_line << actor_array[0..2].join(", ").to_s
    final_array << final_line ### everything that we pushed into the final line
end


puts final_array.sort.reverse ###the array of strings will then get arranged by average score by lowest to highest. then reversed so that the highest rating comes first.









# "name": "Chris Evans",
# "id": "162652784",
# "characters": ["Captain America/Steve Rogers"]
# }, {
# "name": "Anthony Mackie",
# "id": "162653786",
# "characters": ["Sam Wilson/Falcon"]
# }, {
# "name": "Sebastian Stan",

# outputArray = []
#
# movie_data["movies"].each do |movie|
# avg_score = (movie["ratings"]["critics_score"].to_i + movie["ratings"]["audience_score"].to_i)/2
# outputLine = " "
# outputLine << "#{avg_score} - #{movie["title"]} (#{movie["mpaa_rating"]}) starring "
# outputArray << outputLine
# end
#
# puts outputArray

# puts "In Theaters Now:\n "
# listed_movies.each do |x|
#   if x["year"] == 2014
#     then
#     puts x["ratings"]["critics_score"].to_s +
#     " - " + x["title"] +
#     " (" + x["mpaa_rating"] +
#     ") " + x["abridged_cast"][0]["name"]
#     end
#   end


# listed_movies.each do |x|
#   if x["year"] == 2014
#     then
#   title = x["title"]
#   end
# end
#
#   listed_movies.each do |movie|
#     rating = movie["mpaa_rating"]
#   end
