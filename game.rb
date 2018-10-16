require "./player"
require "./board"

require "colorize"

class Game

  def initialize

    puts "What is the name of Player 1 ?".colorize(:red)
    name_player_1 = gets.chomp
    puts "#{name_player_1} You got the mark X".colorize(:purple)
    player_color_1 = "X"
    @player_1 = Player.new(name_player_1, player_color_1)
    puts "What is the name of Player 2 ?".colorize(:green)
    name_player_2 = gets.chomp
    puts "#{name_player_2} You got the mark O".colorize(:green)
    player_color_2 = "O"
    @player_2 = Player.new(name_player_2, player_color_2)
    @players = [@player_1, @player_2]
    @object_board = Board.new

  end

  def go


    puts "=======> How to play ? <=============".colorize(:red)

    puts "You have to choose a number between".colorize(:blue)
    puts "1 and 9 in order to place your mark:".colorize(:blue)

    puts "=====================================".colorize(:blue)
    puts "       Are you Ready ???     ".colorize(:blue)
    puts "Let's go for the Tic-Tac-Toe Game !".colorize(:blue)
    puts "=====================================\n\n".colorize(:blue)    

    self.turn
  end

  def turn

    turns = 0
    while @object_board.victory? == false do # Ici, on dit que tant que les conditions de la victoire 
      @players.each{ |player| # ne sont pas atteintes, on réalise une itération sur chaque joueur placé 
                              # dans l'array @players
        @object_board.display_board # On affiche le tableau
        
        print "================= TURN #{turns + 1} =================".colorize(:green) # On affiche le tour
        print "#{player.name} ! Where do you want to insert your mark ?".colorize(:blue)   # On demande une case au player 1
        print "Give me a number between 1 and 9 :".colorize(:blue)
        n = gets.chomp.to_i   # On enregistre la case dans la variable n
         # On lui soustrait 1 pour qu'elle corresponde à un index
          until n > 0 && n < 10
            puts "Please give a right number".colorize(:red)
            puts "Choose a new number:".colorize(:red)
            n = gets.chomp.to_i
          end
          n = n - 1
        @info_player = [player.name, player.player_color, n]
        @object_board.play(@info_player)
        if @object_board.victory?
          @object_board.display_board
          puts "\n============================================="
          puts "    Congratulations #{player.name},you win !     ".colorize(:green)
          puts "============================================="
          puts "Do you want to play again ? (Y or N)".colorize(:blue)
          answer = gets.chomp.upcase
          if answer == "Y"
            Game.new.go
          else
            puts "Bye !"
          end
          break # on sort de la boucle each seulement si le joueur a gagné.
        end
      turns += 1 # On lance une incrémentation sur turns ici
      if turns == 9 # on sort de la boucle each si turns atteint 9 et on annonce le match nul.
        @object_board.display_board
        puts "============================================="
        puts "            It's a draw :(             ".colorize(:red)
        puts "=============================================\n\n"
        puts "Do you want to play again ? (Y or N)".colorize(:red)
        answer = gets.chomp.upcase
        if answer == "Y"
          Game.new.go
        else
          puts "Bye and hope we will see you again !"
        end
        break
      end
      }
    end #Fin de While loop
  end
end

Game.new.go



