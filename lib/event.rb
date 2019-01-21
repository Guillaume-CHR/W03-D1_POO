#! /usr/bin/env ruby
##****************************************************************************
# RUBY - Class Event
#****************************************************************************
#   Ruby's Program - Event
#   Written by: Guillaume CHRISTE
# 	Date: 21-Jan-2019
#   
#   Description:
# 		- Create an event of class Event
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
	require 'time'
#
#****************************************************************************
class Event
  attr_accessor :start_date, :length, :title, :tbl_attendees
  
  
  def initialize(start_date, length, title, tbl_attendees)
  	@title = title
  	@start_date = Time.parse(start_date)
  	@length = length.to_i
  	@tbl_attendees = tbl_attendees
  end
  
  def show_itself
    puts self
  end

  def postpone_event(delay_in_hour)
  	@start_date += delay_in_hour.to_i * 86400
  end

  def end_date
  	 return @start_date + (@length.to_i * 60)
  end

  def is_past
  	(Time.now > @start_date) ? true : false
  end

  def is_future
  	!self.is_past
  end

  def is_soon
  	if (@start_date < Time.now + 30 * 60) && @start_date > Time.now 
  		true
  	else
  		false
  	end
  end

  def to_s
  	puts "Title: #{@title}"
  	puts "Starting date: #{@start_date}"
  	puts "Length: #{@length} minutes"
  	puts "Invitees: #{@tbl_attendees.join(', ')}"
  end
end

# End of Event ...............................................................
#.............................................................................
#.............................................................................