#!/usr/bin/env ruby
require 'pry'

require_relative 'robot.rb'

@robot = Robot.new

def user_input()
  split_input = gets.split(" ")
  action = split_input[0].downcase
  if split_input[1]
    location = split_input[1].split(",")
    coordinates = { x: location[0].to_i, y: location[1].to_i }
    facing = location[2].downcase
  end

  [action, coordinates, facing]
end



puts "Hello, I am a robot.  My name is Robot.  I'm ready to begin."
@action, @coordinates, @facing = user_input

while @action != "exit"
  case @action
  when "place"
    begin
      @robot.place(@coordinates, @facing)
    rescue Exception => e
      puts e.message
    end

  when "left"
    begin
      @robot.turn_left
    rescue Exception => e
      puts e.message
    end

  when "right"
    begin
      @robot.turn_right
    rescue Exception => e
      puts e.message
    end

  when "move"
    begin
      @robot.move
    rescue Exception => e
      puts e.message
    end

  when "report"
    begin
      puts @robot.report
    rescue Exception => e
      puts e.message
    end

  else
    puts "Huh? I don't understand. Try one of the following: 'PLACE X,Y,DIRECTION', 'LEFT', 'RIGHT', 'MOVE' or 'REPORT' "
  end

  @action, @coordinates, @facing = user_input
end

