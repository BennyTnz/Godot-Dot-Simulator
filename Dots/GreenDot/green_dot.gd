extends RigidBody2D
var globals = preload("res://globals.gd")                                                               #Helps with loading

var MOVES = DOTMOVEMENTSYSTEM.new()
var RNG = RandomNumberGenerator.new()                                                                   #For positioning

func _ready():                                                                                          #When it spawns in
	add_to_group("GREENS")                                                                                #Adds to group "REDS"
	var RNDx = RNG.randi_range(0, globals.SCREENSIZE.x)                                                 #Creates random var within screen size
	var RNDy = RNG.randi_range(0, globals.SCREENSIZE.y)                                                 #Creates random var within screen size
	global_position = Vector2(RNDx, RNDy)                                                               #Sets the position to the random vars

func _draw():                                                                                           #Overrides original draw func
	draw_circle(Vector2(0, 0), globals.RADIUS, Color(0, 0.75, 0))                                          #Draws the dot

func _physics_process(_delta):
	var VELOCITY = Vector2(0, 0)
	
	var REDS = get_tree().get_nodes_in_group("REDS")                                                    #Gets "REDS" group
	var BLUES = get_tree().get_nodes_in_group("BLUES")                                                  #Gets "BLUES" group
	var GREENS = get_tree().get_nodes_in_group("GREENS")
	
	for a in REDS.size():
		var RED = REDS[0]
		var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, RED.global_position)
		var COLOURTOCOLOURVALUE = ATTRACTIONCALCULATOR.GETATTRACTION(2, 0)
		var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
		VELOCITY += ATTRACTIONTOTAL * globals.SENSITIVITY
		REDS.pop_at(0)
	
	for a in BLUES.size():
		var BLUE = BLUES[0]
		var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, BLUE.global_position)
		var COLOURTOCOLOURVALUE = ATTRACTIONCALCULATOR.GETATTRACTION(2, 1)
		var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
		VELOCITY += ATTRACTIONTOTAL * globals.SENSITIVITY
		BLUES.pop_at(0)
	
	for a in GREENS.size():
		var GREEN = GREENS[0]
		if GREEN != self:
			var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, GREEN.global_position)
			var COLOURTOCOLOURVALUE = ATTRACTIONCALCULATOR.GETATTRACTION(2, 1)
			var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
			VELOCITY += ATTRACTIONTOTAL * globals.SENSITIVITY
		GREENS.pop_at(0)
	
	linear_velocity += VELOCITY
	position = position.clamp(Vector2(0, 0), globals.SCREENSIZE)
