# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def get_players team_location = "all"
  player_data = []
  game_hash.each do |location, team_data|
    if team_location == :home
      game_hash[:home].each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            player_data << data_item
          end
        end
      end
    elsif team_location == :away
      game_hash[:away].each do |attribute, data|

        if attribute == :players
          data.each do |data_item|
            player_data << data_item
          end
        end
      end
    # binding.pry
    else
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            player_data << data_item
          end
        end
      end
    end
  end
  return player_data
end


def num_points_scored player_name
  data = get_players
  data.each do |data_item|
    if data_item[:player_name] == player_name
      return data_item[:points]
    end
  end
end

def shoe_size player_name
  players = get_players
  players.each do |player|
    if player[:player_name] == player_name
      return player[:shoe]
    end
  end
end

def team_colors team_name
  game_hash.each do |location, team_data|
    team_data.each do | attribute, data |
      if data == team_name
       return team_data[:colors]
      end
    end
  end
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    names << team_data[:team_name]
  end
  return names
end

def player_numbers team_name
  jerseys = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            jerseys << data_item[:number]
          end
        end
      end
    end
  end
  return jerseys
end

def player_stats player_name
  players = get_players
  players.each do |player|
    if player[:player_name] == player_name
      return player
    end
  end
end

def get_max attr
  largest = 0
  players = get_players
  players.each do |player|
    if attr == :player_name
      if player[:player_name].size > largest
        largest = player[:player_name].size
      end
    else
      if player[attr] > largest
        largest = player[attr]
      end
    end
  end
  return largest
end

def big_shoe_rebounds
  largest_shoe = get_max :shoe
  players = get_players
  players.each do |player|
    if player[:shoe] == largest_shoe
      return player[:rebounds]
    end
  end
end

def most_points_scored
  max_points = get_max :points
  players = get_players
  players.each do |player|
    if player[:points] == max_points
      return player[:player_name]
    end
  end
end

def winning_team
  away_players = get_players :away
  home_players = get_players :home
  away_points = 0
  home_points = 0

  away_players.each do |player|
    away_points += player[:points]
  end
  home_players.each do |player|
    home_points += player[:points]
  end
  if home_points > away_points
    return team_names[0]
  else
    return team_names[1]
  end
end

def player_with_longest_name
  players = get_players
  longest = get_max :player_name
  players.each do |player|
    if player[:player_name].size == longest
      return player[:player_name]
    end
  end
end

def long_name_steals_a_ton?
  max_steals = get_max :steals
  longest_name = player_with_longest_name
  players = get_players
  players.each do |player|
    if player[:player_name] == longest_name and player[:steals] == max_steals
      return true
    end
  end
  return false
end
