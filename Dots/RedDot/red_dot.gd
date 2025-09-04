extends StaticBody2D
var globals = preload("res://globals.gd")                                                               #Helps with loading

var MOVES = DOTMOVEMENTSYSTEM.new()
var RNG = RandomNumberGenerator.new()                                                                   #For positioning

func _ready():                                                                                          #When it spawns in
	add_to_group("REDS")                                                                                #Adds to group "REDS"
	var RNDx = RNG.randi_range(0, globals.SCREENSIZE.x)                                                 #Creates random var within screen size
	var RNDy = RNG.randi_range(0, globals.SCREENSIZE.y)                                                 #Creates random var within screen size
	position = Vector2(RNDx, RNDy)                                                                      #Sets the position to the random vars

func _draw():                                                                                           #Overrides original draw func
	draw_circle(Vector2(0, 0), globals.RADIUS, Color(1, 0, 0))                                          #Draws the dot

func _process(delta):
	var REDS = get_tree().get_nodes_in_group("REDS")                                                    #Gets "REDS" group
	var VELOCITY: Vector2 = Vector2(0, 0)
	for a in REDS.size():
		var RED = REDS[0]
		if not RED.position == position:
			var COLOURTOCOLOURVALUE = 1
			var ATTRACTIONTOTAL = MOVES.GETATTRACTION(position, DOTMOVEMENTSYSTEM.GETDISTANCE(position, RED.position), COLOURTOCOLOURVALUE)
			VELOCITY += ATTRACTIONTOTAL * globals.SENSITIVITY * delta
		REDS.pop_at(0)
	position += VELOCITY
