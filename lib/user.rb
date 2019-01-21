#! /usr/bin/env ruby
##****************************************************************************
# RUBY - @NameOfTheProgram
#****************************************************************************
#   Ruby's Program - Name of the program
#   Written by: Guillaume CHRISTE
# 	Date: 21-Jan-2019
#   
#   Description:
# 		- 
# 		- 
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
class User
  attr_accessor :name, :email
  @@tbl_user = []
  
  def initialize(email)
	@email = email
	@@tbl_user << self
  end
  
  def show_itself
    puts self
  end
  
  def self.all
	@@tbl_user.count
  end

  def self.find_by_email(email)
    @@tbl_user.each do |user|
      return user if user.email == email
    end
  end

end
# End of Program's name
#.............................................................................
#.............................................................................