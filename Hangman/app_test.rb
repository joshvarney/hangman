require "minitest/autorun"
require_relative "app.rb"
class TestHangman < Minitest::Test 

	def test_assert_that_1_equals_1
		assert_equal(1, 1)
	end
	def test_assert_that_empty_string_returns_true
		secret_word = " "
		assert_equal(true, get_word?(secret_word))
	end 
	def test_assert_string_returns_true
		secret_word = "cat"
		assert_equal(true, get_word?(secret_word))
	end
	def test_assert_integer_returns_false
		secret_word = 17
		assert_equal(false, get_word?(secret_word))
	end
	def test_assert_array_returns_false
		secret_word = [ ]
		assert_equal(false, get_word?(secret_word))
	end
	def test_assert_that_length_for_fox_is_3
		secret_word = "fox"
		assert_equal(3, get_secret_word_length(secret_word))
	end
	def test_assert_that_f_is_in_fox
		secret_word = "fox"
		letter = "f"
		assert_equal(true, check_letter?(secret_word, letter))
	end
	def test_assert_that_t_is_in_fox
		secret_word = "fox"
		letter = "t"
		assert_equal(false, check_letter?(secret_word, letter))
	end
	def test_assert_that_f_for_fox_playing_hangman
		secret_word = "fox"
		letter = "f"
		assert_equal(["f"], play_hangman(secret_word, letter))
	end
	def test_assert_that_t_for_fox_playing_hangman
		secret_word = "fox"
		letter = "t"
		assert_equal(["t"], play_hangman(secret_word, letter))
	    #we are using the fuction instead of the array to return the value in the array. This works because if it was putting the "t" into the wrong array, the result would be [ft]
	end
	def test_assert_that_display_word_length_equals_secret_word
		secret_word = "fox"
		assert_equal(["_", "_", "_"], set_display_word(secret_word))
	end
	def test_assert_that_display_word_length_equals_secret_word_with_corwell
		secret_word = "corwell"
		assert_equal(["_", "_", "_", "_", "_", "_", "_"], set_display_word(secret_word))
	end
	def test_assert_that_array_has_all_guessed_letters
		letter = "r"
		assert_equal(["r"], all_guessed_letters(letter))
	end
	def test_assert_that_secret_word_is_fox_display_word_becomes_array_with_string_with_f_dash_dash
		letter = "f"
		secret_word = "fox"
		assert_equal(["f", "_", "_"], update_display_word(secret_word, letter))
	end
	def test_assert_that_secret_word_is_fox_display_word_becomes_array_with_string_dash_o_dash
		letter = "o"
		secret_word = "fox"
		assert_equal(["_", "o", "_"], update_display_word(secret_word, letter))
	end
	def test_assert_t_is_not_in_fox
		letter = "t"
		secret_word = "fox"
		assert_equal(["_", "_", "_"], update_display_word(secret_word, letter))
	end
	def test_assert_that_secret_word_is_book_display_word_becomes_array_with_string_with_dash_o_o_dash
		letter = "o"
		secret_word = "book"
		assert_equal(["_", "o", "o", "_"], update_display_word(secret_word, letter))
	end
	def test_assert_winner_winner_chicken_dinner
		secret_word = "book"
		display_word = "book"
		assert_equal(true, check_winner(display_word, secret_word))
	end
	def test_assert_check_for_loser
		assert_equal("Uh oh!", you_lost())
	end
	def test_assert_user_can_input_secret_word
		assert_equal("wombat", input_secret_word())
	end
	def test_assert_user_can_input_letter
		assert_equal("a", input_letter())
	end

end