class Phrase < ApplicationRecord

  # def init (phrase)
  #       @phrase = phrase # takes Phrase object
  #       @running = False 
  #       super(PhraseThread, self).init() # use parent Thread class initializer
  #   # starts the thread
  # end

  # def start 
  #       @running = True
  #       super(PhraseThread, self).start() # use parent start method
  #   # how thread operates on the fly, can pause execution using while loops
  # end

  # def run do |awesome| 
  # 				@running
  #           @phrase.timer-=1
  #           sleep(1) # wait a second to subtract from the timer
  #           print 'Timer Change {}'.format(self.phrase.phrase_foreign)
	    
	 #        do @phrase.timer == 0
		#           @phrase.times_seen+=1
		#           sleep(5)
		#           @phrase.timer = 5
	 #  		end

	# Thread.new do 
	# 			@phrases = Phrase.last
 #      	puts @phrases
 #  end

#TODO create new Phrase class to hold timer and other instance information


def start_phrase_thread(phrase)
	# TODO Create new PhraseObj here, and then pass to new Thread to be managed
	arr = []
  arr[i] = Thread.new {
     edit_timer(phrase)
      
   }
end

def edit_timer(phrase)

		#TODO while Phrase_obj.is_running 
				# Phrase_obj.timer-=1
				#sleep(1)
		#TODO
		#while Phrase_obj.timer==0
				#puts gofuckyomomma
				#weouthere
				#Phrase_obj.times_seen+=1
				#Phrase_obj.update_timer()

	end


end


arr.each {|t| t.join; print t["mycount"], ", " }
puts "count = #{count}"


end
