# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready( ->
	# File/hash input togglin
	$("#file_input").hide()
	$("#hash_button").hide()
	$(".swap_button").click( ->
		$("#hash_input").toggle()
		$("#file_input").toggle()
		$(".input_swap_container").toggle()
	)

	# Other stuff
)	
