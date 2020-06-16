# Write your code below game_hash
require 'pry'
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

def num_points_scored(player)
  search_player_stats(player)[:points]
end

def shoe_size(player)
  search_player_stats(player)[:shoe]
end

def team_colors(team)
  search_teams(team)[:colors]

end

def team_names

  game_hash.each_with_object([]) { |(key,value),teams| teams << value[:team_name]}

end

def player_numbers(team)
  search_teams(team)[:players].each_with_object([]) do |player_data,jersey_numbers|
    jersey_numbers << player_data[:number]
  end
end

def player_stats(player)
  search_player_stats(player)
end


def big_shoe_rebounds
  search_most_1_symbol_metric(:shoe ,:rebounds)
end

def most_points_scored
  search_most_1_symbol_metric(:points,:player_name)
end

def long_name_steals_a_ton
  answer= Hash.new
   game_hash.each do |home_or_away, team_data|
    team_data[:players].each do |player_data|
      if answer.empty?
        answer[:player_name] = player_data[:player_name]
      end
      if player_data[:player_name].length > answer[:player_name].length
        answer[:player_name] = player_data[:player_name]
      end
    end
   end
  puts answer[:player_name] == search_most_1_symbol_metric(:steals,:player_name)
end
#helper methods to help me specify some information
def search_player_stats(name_of_player)
  if game_hash[:home][:players].find_index {|i| i[:player_name]== name_of_player}
    player_index = game_hash[:home][:players].find_index {|i| i[:player_name]== name_of_player}
  else
    player_index = game_hash[:away][:players].find_index {|i| i[:player_name]== name_of_player}
  end

  if game_hash[:home][:players][player_index][:player_name]==name_of_player
    game_hash[:home][:players][player_index]
  else
    game_hash[:away][:players][player_index]
  end
end


def search_teams(team)

  if game_hash.any?{|key,value| value[:team_name]==team}
    game_hash[:home][:team_name]==team ? game_hash[:home] : game_hash[:away]
  else
    return "Sorry, but the team doesn't exist yet."
  end
end



def search_most_1_symbol_metric (metric_searched_by,result)
  answer= Hash.new
   game_hash.each do |home_or_away, team_data|
    team_data[:players].each do |player_data|
      if answer.empty?
        answer[:player_name] = player_data[:player_name]
        answer[metric_searched_by] = player_data[metric_searched_by]
        answer[result] = player_data[result]
      end
      if player_data[metric_searched_by] > answer[metric_searched_by]
        answer[:player_name] = player_data[:player_name]
        answer[metric_searched_by] = player_data[metric_searched_by]
        answer[result] = player_data[result]
      end
    end
  end
  answer[result]
end
long_name_steals_a_ton
