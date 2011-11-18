# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready( ->

	# Init ##################################################
	hash_field_default = $("#hash_input").prop("value")	#Grab the initial value of the hash field
	# Possible state of the input form. Used for toggling between file input and hash input.
	input_state_map = {hash: 1, file: 2}
	input_state = input_state_map.hash # Starts in hash input state

	# Pretty up the form: ###################################
	# File/hash input toggle
	$(".swap_button").click( ->
		if input_state == input_state_map.hash
			$(".hash_input_component").fadeOut( ->
				$(".file_input_component").fadeIn())
			input_state = input_state_map.file
		else
			$(".file_input_component").fadeOut( ->
				$(".hash_input_component").fadeIn())
			input_state = input_state_map.hash
	)

	# Clearing and restoring the default value to the hash field
	$("#hash_input").focus( ->
		if $(this).prop("value") == hash_field_default
			$(this).prop("value", "")
	)
	$("#hash_input").blur( ->
		if $(this).prop("value") == ""
			$(this).prop("value", hash_field_default)
	)

)	
