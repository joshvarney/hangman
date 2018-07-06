def get_word?(secret_word)
	if $secret_word.class == String
		true
	else 
		false
	end
end

def set_display_word(secret_word)
	$display_word = [ ] #sets the varaible equal to an empty array
	get_secret_word_length(secret_word).times do #this runs this function as many times as there are letters in the secrect word
		$display_word << "_" #it pushes blank spaces into the array equal to the number of spaces that we need
	end
	$display_word
end
def update_display_word(secret_word, letter)
	$display_word = set_display_word(secret_word) #this displays the word as blanks
	$secret_word_array = $secret_word.split ("") #this breaks the secret word into an array of individual letters
	counter = 0
	found = false
	$secret_word_array.each do |index| #we used the .each so that each letter in the secret word gets compared to the letter (index); the input within the bars in another variable which allows us to pass the letters into the do loop. Technically, it indexes each letter
		if index == $letter
			$display_word[counter] = $letter
			found = true
		end
		counter = counter + 1
	end
	wrong_guesses_count = 0
	if found == false
		$wrong_guesses_count = $wrong_guesses_count + 1
	end
	$display_word
end
def all_guessed_letters(letter)
	guessed_letters = [ ]
	guessed_letters = push_incorrect_letter_into(letter)|push_correct_letter_into(letter) #the bar means to "set union" which combines the 2 arrays and removes duplicates (although not needed here)
end
def push_correct_letter_into(letter)
    correct_letter = [ ]
    correct_letter.push letter
    correct_letter #this calls the array so it is the last step in the function
end
def push_incorrect_letter_into(letter)
	wrong_letter = [ ]
	wrong_letter.push letter
	wrong_letter
end
def get_secret_word_length(secret_word)
	$number_of_letters_in_secrect_word = $secret_word.length
end
#def check_letter?(secret_word, letter)
#	if secret_word.include? letter
#		true
#	else
#		false
#	end
#end
def check_winner(display_word, secret_word_array)
	if $display_word == $secret_word_array
		$solved = true
	end
end
def you_lost()
	"Uh oh!"
end
def one_player()
	word_bank = ["chicken", "puppy", "baseball", "yeti", "racecar"]
	$secret_word = word_bank.shuffle.first
end
def two_player
	p "Enter your secret word."
	$secret_word = gets.chomp
end
def input_secret_word()
	puts "Would you like to play one player or two? Please type one or two."
	$answer = gets.chomp
	if $answer == "two"
		two_player
	else
		one_player
	end
end
def input_letter()
	p "Input letter."
	$letter = gets.chomp
	if $all_guesses.include? ($letter)
		 puts "You have already guessed #{$letter}!"
	else
		$all_guesses << $letter
	end
end
def play_hangman(secret_word, letter)
	if $secret_word.include? $letter
		check_letter?(secret_word, letter) == true
		push_correct_letter_into(letter)
	else
		push_incorrect_letter_into(letter)
	end
end 
def run_program() #calling funtions in order
 	input_secret_word()
 	set_display_word($secret_word)
 	p "Player 2: Choose a letter."
 	$solved = false
 	$wrong_guesses_count = 0
 	$all_guesses = [ ]
 	while $solved == false && $wrong_guesses_count < 10
 		input_letter()
 		update_display_word($secret_word, $letter)
 		check_winner($display_word, $secret_word_array)
 	end
end
run_program