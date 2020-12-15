require 'pry'

# def get_first_name(name)
#   name.split(' ')[0]
# end

# def all_stati(season_data)
#   season_data.map do |contestant|
#     contestant["status"]
#   end
# end
def all_contestants(data)
  data.values.flatten
end

def get_first_name_of_season_winner data, season
  season_data = data[season]
  contestant = season_data.find do |contestant|
    contestant ["status"] == "Winner"
  end
  contestant["name"].split(" ").first
end

def get_contestant_name data, occupation
  all_contestants(data).find do |contestant|
    occupation == contestant["occupation"]
  end ["name"]
end

def count_contestants_by_hometown data, hometown
  all_contestants(data).count do |contestant|
    hometown == contestant["hometown"]
  end
end

def get_occupation data, hometown
  all_contestants(data).find do |contestant|
    hometown == contestant["hometown"]
  end ["occupation"]
end

def get_average_age_for_season(data, season)
  season_data = data[season]
  sum = season_data.reduce(0) do |total, contestant|
    total+contestant["age"].to_f
  end
  (average = sum / season_data.length).to_f.round
end
