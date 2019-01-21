#! /usr/bin/env ruby
##****************************************************************************
# RUBY - Main Procedure 
#****************************************************************************
#   Ruby's Program - Main Application
#   Written by: Guillaume CHRISTE
# 	Date: 21-Jan-2019
#   
#   Description:
# 		- Create an event using class User & Event
# 		
# 	Gems:
  		require 'rubygems'
  		require 'dotenv'
  		Dotenv.load 
  		require 'rubocop'
  		require 'nokogiri'
  		require 'open-uri'
  		require 'pry'
#
#****************************************************************************
# event.rb
# user.rb
require './lib/event.rb'
require './lib/user'

User.new("julie@julie.com")
User.new("jean@jean.com")

julie =User.find_by_email("julie@julie.com")
jean = User.find_by_email("jean@jean.com")

puts julie
puts jean

e = Event.new("2019-01-13 09:00", 10, "standup quotidien", [julie, jean])
puts "Voici l'email du premier attendee de l'événement : #{e.tbl_attendees.first.email}"
# End of Main Application ....................................................
#.............................................................................
#.............................................................................