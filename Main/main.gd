extends Node
var globals = preload("res://globals.gd")                                           #Helps with loading
var attraction_calculator = preload("res://Classes/attraction_calculator.gd")       #Helps with loading
var blue_dot_scene = preload("res://Dots/BlueDot/blue_dot.tscn")
var green_dot_scene = preload("res://Dots/GreenDot/green_dot.tscn")
var red_dot_scene = preload("res://Dots/RedDot/red_dot.tscn")                       #Helps with loading

func _ready():
	ATTRACTIONCALCULATOR.CREATEMATRIX(3)                                           #Creates attractions
	for a in globals.REDNUMBER:                                                    #Repeats for number of reds
		var REDDOT = red_dot_scene.instantiate()                                   #Makes red dots
		add_child(REDDOT)                                                          #Adds them to node tree
	for a in globals.BLUENUMBER:                                                   #Repeats for number of blues
		var BLUEDOT = blue_dot_scene.instantiate()                                 #Makes blue dots
		add_child(BLUEDOT)                                                         #Adds them to node tree
	for a in globals.GREENNUMBER:                                                   #Repeats for number of greens
		var GREENDOT = green_dot_scene.instantiate()                                 #Makes green dots
		add_child(GREENDOT)                                                         #Adds them to node tree
