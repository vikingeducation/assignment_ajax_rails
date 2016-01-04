# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Destroy old records
if Rails.env == 'development'
  Rake::Task['db:migrate:reset'].invoke
end

# Helpers
MOVIES = [
  {
    :title => "Apollo 13",
    :date => Date.new(1995)
  },
  {
    :title => "The Baker's Wife",
    :date => Date.new(1940)
  },
  {
    :title => "Casablanca",
    :date => Date.new(1942)
  },
  {
    :title => "The Damned",
    :date => Date.new(1969)
  },
  {
    :title => "E.T. the Extra-Terrestrial",
    :date => Date.new(1982)
  },
  {
    :title => "Fargo",
    :date => Date.new(1996)
  },
  {
    :title => "Get Carter",
    :date => Date.new(1971)
  },
  {
    :title => "Heat and Dust",
    :date => Date.new(1983)
  },
  {
    :title => "The Informer",
    :date => Date.new(1935)
  },
  {
    :title => "Ju Dou",
    :date => Date.new(1990)
  },
  {
    :title => "King Kong",
    :date => Date.new(1933)
  },
  {
    :title => "L.A. Confidential",
    :date => Date.new(1997)
  },
  {
    :title => "The Magic Flute",
    :date => Date.new(1975)
  },
  {
    :title => "Nobody's Fool",
    :date => Date.new(1994)
  },
  {
    :title => "One Potato, Two Potato",
    :date => Date.new(1964)
  },
  {
    :title => "The Philadelphia Story",
    :date => Date.new(1940)
  },
  {
    :title => "The Quiet Man",
    :date => Date.new(1952)
  },
  {
    :title => "Repo Man",
    :date => Date.new(1984)
  },
  {
    :title => "Serpico",
    :date => Date.new(1973)
  },
  {
    :title => "Toy Story",
    :date => Date.new(1995)
  },
  {
    :title => "The Usual Suspects",
    :date => Date.new(1995)
  },
  {
    :title => "The Verdict",
    :date => Date.new(1982)
  },
  {
    :title => "The Wizard of Oz",
    :date => Date.new(1939)
  },
  {
    :title => "Young Frankenstein",
    :date => Date.new(1974)
  },
  {
    :title => "Zero for Conduct",
    :date => Date.new(1933)
  }
]

CRITICS = [
  "James Agee (Time, The Nation)",
  "Hollis Alpert (Saturday Review)",
  "David Ansen (Newsweek)",
  "Michael Atkinson",
  "James Berardinelli",
  "Peter Biskind",
  "Peter Bradshaw (The Guardian)",
  "Tom Brook (BBC)",
  "Ty Burr (The Boston Globe)",
  "Ernest Callenbach",
  "Vincent Canby (The New York Times)",
  "Charles Champlin (The Los Angeles Times)",
  "Jay Cocks (Time)",
  "Robbie Collin (The Daily Telegraph)",
  "Pat Collins (WWOR-TV)",
  "Richard Corliss (Time Magazine)",
  "Bosley Crowther (The New York Times)",
  "Mike D'Angelo (Esquire)",
  "Manohla Dargis (The New York Times)"
]

ADJECTIVES = [
"abandoned",
"able",
"absolute",
"adorable",
"adventurous",
"academic",
"acceptable",
"acclaimed",
"accomplished",
"accurate",
"aching",
"acidic",
"acrobatic",

"babyish",
"bad",
"back",
"baggy",
"bare",
"barren",
"basic",
"beautiful",
"belated",
"beloved",

"calculating",
"calm",
"candid",
"canine",
"capital",
"carefree",
"careful",
"careless",
"caring",
"cautious",
"cavernous",
"celebrated",
"charming",

"damaged",
"damp",
"dangerous",
"dapper",
"daring",
"darling",
"dark",
"dazzling",
"dead",
"deadly",
"deafening",
"dear",
"dearest",

"elaborate",
"elastic",
"elated",
"elderly",
"electric",
"elegant",
"elementary",
"elliptical",
"embarrassed",

"filthy",
"fine",
"finished",
"firm",
"first",
"firsthand",
"fitting",
"fixed",
"flaky",
"flamboyant",
"flashy",
"flat",
"flawed",
"flawless",
"flickering",

"gloomy",
"glorious",
"glossy",
"glum",
"golden",
"good",
"good-natured",
"gorgeous",
"graceful",

"hidden",
"hideous",
"high",
"high-level",
"hilarious",
"hoarse",
"hollow",
"homely",

"impeccable",
"impartial",
"imperfect",
"imperturbable",
"impish",
"impolite",
"important",
"impossible",
"impractical",
"impressionable",
"impressive",
"improbable",

"joyful",
"joyous",
"jubilant",

"knotty",
"knowledgeable",
"knowing",

"lame",
"lanky",
"large",
"last",
"lasting",
"late",
"lavish",
"lawful",

"masculine",
"massive",
"mature",
"meager",
"mealy",
"mean",
"measly",
"meaty",
"medical",
"mediocre",

"nocturnal",
"noisy",
"nonstop",
"normal",
"notable",
"noted",

"orange",
"orderly",
"organic",
"ornate",
"ornery",
"ordinary",

"periodic",
"perky",
"personal",
"pertinent",
"pesky",
"pessimistic",
"petty",
"phony",
"physical",
"piercing",
"pink",
"pitiful",
"plain",

"queasy",
"querulous",

"repulsive",
"revolving",
"rewarding",
"rich",
"rigid",
"right",
"ringed",
"ripe",

"silly",
"silver",
"similar",
"simple",
"simplistic",
"sinful",
"single",
"sizzling",
"skeletal",
"skinny",
"sleepy",
"slight",
"slim",
"slimy",
"slippery",
"slow",
"slushy",
"small",
"smart",
"smoggy",
"smooth",
"smug",
"snappy",
"snarling",
"sneaky",
"sniveling",
"snoopy",

"thick",
"thin",
"third",
"thirsty",
"this",
"thorough",
"thorny",
"those",
"thoughtful",
"threadbare",

"ugly",
"ultimate",
"unacceptable",
"unaware",
"uncomfortable",
"uncommon",
"unconscious",
"understated",
"unequaled",

"victorious",
"vigilant",
"vigorous",
"villainous",
"violet",

"wan",
"warlike",
"warm",
"warmhearted",
"warped",
"wary",
"wasteful",
"watchful",
"waterlogged",
"watery",
"wavy",

"yawning",
"yearly",

"zany",
"zealous",
"zesty"
]

def random_adjective
  ADJECTIVES.shuffle.sample
end

REVIEWS = [
  "#{random_adjective.capitalize} in the beginning, but #{random_adjective} in the end. It is #{random_adjective} that the directors were able to do such #{random_adjective} work on this #{random_adjective} film.",

  "The writers of this movie did a #{random_adjective} job of telling the #{random_adjective} story of the characters' #{random_adjective} journey. We have come to expect such #{random_adjective} work from these writers and they really show their #{random_adjective} skills in this movie. I give it two #{random_adjective} thumbs up.",

  "The #{random_adjective} actors in this movie were clearly at the pique of their #{random_adjective} careers. It is #{random_adjective} to see them give such #{random_adjective} performances. The director has a #{random_adjective} eye for #{random_adjective} talent. The #{random_adjective} movie would not be the same without these professionals doing their #{random_adjective} jobs."
]

def random_review
  REVIEWS.shuffle.sample
end

def random_critic
  CRITICS.shuffle.sample
end

def random_title(movie)
  [
    "#{movie.title} is a #{random_adjective} hit!",
    "The crowd gives a #{random_adjective} ovation for #{movie.title}!",
    "#{movie.title} is #{random_adjective} and #{random_adjective}."
  ].shuffle.sample
end


# Create movies
puts 'Creating movies'
Movie.create(MOVIES)
movies = Movie.all

# Create reviews
puts 'Creating reviews'
reviews = []
movies.each do |movie|
  5.times do |i|
    reviews << {
      :title => random_title(movie),
      :body => random_review,
      :date => movie.date + rand(1..365),
      :reviewer => random_critic,
      :movie_id => movie.id
    }
  end
end
Review.create(reviews)




