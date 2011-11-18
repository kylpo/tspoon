# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready( ->
	# File/hash input toggle
	input_state = "hash"
	$(".swap_button").click( ->
		if input_state == "hash"
			$("#hash_input").fadeToggle( ->
				$("#file_input").fadeToggle())
			$("#file_button_div").fadeToggle( ->
				$("#hash_button_div").fadeToggle())
			input_state = "file"
		else
			$("#file_input").fadeToggle( ->
				$("#hash_input").fadeToggle())
			$("#hash_button_div").fadeToggle( ->
				$("#file_button_div").fadeToggle())
			input_state = "hash"
	)

	# Other stuff
)	
