extends Node
var globals = preload("res://globals.gd")                                           #Helps with loading
var attraction_calculator = preload("res://Classes/attraction_calculator.gd")       #Helps with loading
var red_dot_scene = preload("res://Dots/RedDot/red_dot.tscn")                       #Helps with loading

func _ready():
	ATTRACTIONCALCULATOR.CREATEMATRIX(6)                                           #Creates attractions
	for a in globals.REDNUMBER:                                                    #Repeats for number of reds
		var REDDOT = red_dot_scene.instantiate()                                   #Makes red dots
		add_child(REDDOT)                                                          #Adds them to node tree
