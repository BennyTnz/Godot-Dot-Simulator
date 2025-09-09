extends Node
var globals = preload("res://globals.gd")                                           #Helps with loading
var attraction_calculator = preload("res://Classes/attraction_calculator.gd")       #Helps with loading
var blue_dot_scene = preload("res://Dots/BlueDot/blue_dot.tscn")
var green_dot_scene = preload("res://Dots/GreenDot/green_dot.tscn")
var red_dot_scene = preload("res://Dots/RedDot/red_dot.tscn")                       #Helps with loading
var purple_dot_scene = preload("res://Dots/PurpleDot/purple_dot.tscn")
var yellow_dot_scene = preload("res://Dots/YellowDot/yellow_dot.tscn")
var orange_dot_scene = preload("res://Dots/OrangeDot/orange_dot.tscn")

func _ready():
	ATTRACTIONCALCULATOR.CREATEMATRIX(6)                                           #Creates attractions
	for a in globals.REDNUMBER:                                                    #Repeats for number of reds
		var DOT = red_dot_scene.instantiate()                                   #Makes red dots
		add_child(DOT)                                                          #Adds them to node tree
	for a in globals.BLUENUMBER:                                                   #Repeats for number of blues
		var DOT = blue_dot_scene.instantiate()                                 #Makes blue dots
		add_child(DOT)                                                         #Adds them to node tree
	for a in globals.GREENNUMBER:                                                   #Repeats for number of greens
		var DOT = green_dot_scene.instantiate()                                 #Makes green dots
		add_child(DOT)                                                         #Adds them to node tree
	for a in globals.PURPLENUMBER:
		var DOT = purple_dot_scene.instantiate()
		add_child(DOT)
	for a in globals.ORANGENUMBER:
		var DOT = orange_dot_scene.instantiate()
		add_child(DOT)
	for a in globals.YELLOWNUMBER:
		var DOT = yellow_dot_scene.instantiate()
		add_child(DOT)
