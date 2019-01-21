require_relative '../lib/event'


describe Event do

  before(:each) do
  	# ligne trouvée ici : https://geminstallthat.wordpress.com/2008/08/11/reloading-classes-in-rspec/
  	# qui permet de remettre à zéro la classe. Pratique pour la méthode count, mais pas obligatoire.
    	Object.send(:remove_const, 'Event')
    	load 'event.rb'
  	end
	describe 'initializer' do
		it 'creates an user' do
      event = Event.new("2019-01-13 09:00", 10, "standup quotidien", ["julie@julie.com", "jean@jean.com"])
      expect(event.class).to eq(Event)
		end
		it 'saves @start_date as instance variable' do
			start_date_1 = "2019-01-13 09:00"
			event = Event.new(start_date_1, 10, "standup quotidien", ["julie@julie.com", "jean@jean.com"])
			expect(event.start_date).to eq(Time.parse(start_date_1))
		end
	end

	describe 'instance variables' do
		describe '@length' do
			it 'can be read' do 
				length_1 = 20
				event = Event.new("2019-01-13 09:00", length_1, "standup quotidien", ["julie@julie.com", "jean@jean.com"])
				expect(event.length).to eq(length_1)
			end

			it 'can be written' do 
				length_1 = 20
				event = Event.new("2019-01-13 09:00", length_1, "standup quotidien", ["julie@julie.com", "jean@jean.com"])
				length_2 = 30
				event.length = length_2
				expect(event.length).not_to eq(length_1)
				expect(event.length).to eq(length_2)
			end
		end
	end

	# describe 'instance methods' do

	# 	describe 'show_itself' do
	# 		it "shows itself" do
 #      			event = Event.new("2019-01-13 09:00", 10, "standup quotidien", ["julie@julie.com", "jean@jean.com"])
	# 			event.show_itself
	# 			expect do
	# 				event.show_itself
	# 			end.to output("#{event}\n").to_stdout
	# 			# OK celle là est super hard, mais en même temps c'est pas des méthodes que l'on utilise souvent. Solution trouvée ici : https://stackoverflow.com/a/38377720
	# 		end
	# 	end
	# end
	
	describe 'class methods' do

		describe 'is_past' do
			it 'return true if in the past' do 
				event = Event.new("2018-01-13 09:00", 30, "standup quotidien", ["julie@julie.com", "jean@jean.com"])
				expect(event.is_past).to eq(true)
			end
		end
		describe 'ending date' do
			it 'return the ending date' do 
				event = Event.new("2018-01-13 09:00", 30, "standup quotidien", ["julie@julie.com", "jean@jean.com"])
				expect(event.end_date).to eq(Time.parse("2018-01-13 09:30:00 +0100"))
			end
		end		
		describe 'is_soon' do
			it 'return true if event is in less than 30 minutes' do 
				start_date = (Time.now + 10*60).to_s
				event = Event.new(start_date, 10, "standup quotidien", ["julie@julie.com", "jean@jean.com"])
				expect(event.is_soon).to eq(true)
			end
		end
	end

end