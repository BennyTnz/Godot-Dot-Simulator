extends RigidBody2D
var globals = preload("res://globals.gd")                                                               #Helps with loading

var MOVES = DOTMOVEMENTSYSTEM.new()
var RNG = RandomNumberGenerator.new()                                                                   #For positioning

func _ready():                                                                                          #When it spawns in
	add_to_group("REDS")                                                                                #Adds to group "REDS"
	var RNDx = RNG.randi_range(0, globals.SCREENSIZE.x)                                                 #Creates random var within screen size
	var RNDy = RNG.randi_range(0, globals.SCREENSIZE.y)                                                 #Creates random var within screen size
	global_position = Vector2(RNDx, RNDy)                                                               #Sets the position to the random vars

func _draw():                                                                                           #Overrides original draw func
	draw_circle(Vector2(0, 0), globals.RADIUS, Color(1, 0, 0))                                          #Draws the dot

func _physics_process(_delta):
	var REDS = get_tree().get_nodes_in_group("REDS")                                                    #Gets "REDS" group
	for a in REDS.size():
		var RED = REDS[0]
		if RED != self:
			var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, RED.global_position)
			var COLOURTOCOLOURVALUE = 1
			var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
			linear_velocity += ATTRACTIONTOTAL * globals.SENSITIVITY
		REDS.pop_at(0)
