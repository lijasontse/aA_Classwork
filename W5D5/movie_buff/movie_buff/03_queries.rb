def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .select('((movies.yr / 10) * 10)')
    .group('((movies.yr / 10) * 10)')
    .order('AVG(movies.score) DESC')
    .limit(1)
    .pluck('((movies.yr / 10) * 10)').first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  Actor
    .select('actors.name').distinct
    .joins(:castings)
    .where('actors.name != (?)', name)
    .where('castings.movie_id IN (:this_actors_movie)', 
      this_actors_movie: Actor
      .select('castings.movie_id')
      .joins(:castings)
      .where('actors.name = (?)', name)
    )
    .pluck('actors.name')



end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .select('COUNT(actors.id)')
    .left_outer_joins(:castings)
    .group('actors.id')
    .having('COUNT(castings.movie_id) = 0')
    .pluck('COUNT(actors.id)').count

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  new_str = "%"
  whazzername.each_char do |char|
    new_str += char + "%"
  end

  Movie
    .joins(:actors)
    .where('UPPER(actors.name) LIKE UPPER(?)', new_str)
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

  Actor
    .select('actors.id, actors.name, MAX(movies.yr) - MIN(movies.yr) as career')
    .joins(:movies)
    .group('actors.id')
    .order('career DESC')
    .limit(3)
    .order('actors.name ASC')

end
