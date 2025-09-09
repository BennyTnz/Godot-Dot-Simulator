extends RigidBody2D
var globals = preload("res://globals.gd")                                                               #Helps with loading

var MOVES = DOTMOVEMENTSYSTEM.new()
var RNG = RandomNumberGenerator.new()                                                                   #For positioning

func _ready():                                                                                          #When it spawns in
	add_to_group("BLUES")                                                                                #Adds to group "REDS"
	var RNDx = RNG.randi_range(0, globals.SCREENSIZE.x)                                                 #Creates random var within screen size
	var RNDy = RNG.randi_range(0, globals.SCREENSIZE.y)                                                 #Creates random var within screen size
	global_position = Vector2(RNDx, RNDy)                                                               #Sets the position to the random vars

func _draw():                                                                                           #Overrides original draw func
	draw_circle(Vector2(0, 0), globals.RADIUS, Color(0, 0, 1, 1))                                          #Draws the dot

func _physics_process(_delta):
	var VELOCITY = Vector2(0, 0)
	
	var REDS = get_tree().get_nodes_in_group("REDS")                                                    #Gets "REDS" group
	var BLUES = get_tree().get_nodes_in_group("BLUES")                                                  #Gets "BLUES" group
	var GREENS = get_tree().get_nodes_in_group("GREENS")
	var ORANGES = get_tree().get_nodes_in_group("ORANGES")
	var PURPLES = get_tree().get_nodes_in_group("PURPLES")
	var YELLOWS = get_tree().get_nodes_in_group("YELLOWS")
	
	if global_position.x > globals.SCREENSIZE.x:
		global_position.x -= globals.SCREENSIZE.x
	if global_position.x < 0:
		global_position.x += globals.SCREENSIZE.x
	if global_position.y > globals.SCREENSIZE.y:
		global_position.y -= globals.SCREENSIZE.y
	if global_position.y < 0:
		global_position.y += globals.SCREENSIZE.y
	
	for a in REDS.size():
		var RED = REDS[0]
		var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, RED.global_position)
		var dis1: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, RED.global_position + globals.SCREENSIZE)
		var dis2: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, RED.global_position - globals.SCREENSIZE)
		if dis1.x < dis.x:
			dis.x = dis1.x
		elif dis2.x > dis.x:
			dis.x = dis2.x
		if dis1.y < dis.y:
			dis.y = dis1.y
		elif dis2.y > dis.y:
			dis.y = dis2.y
		var COLOURTOCOLOURVALUE = ATTRACTIONCALCULATOR.GETATTRACTION(1, 0)
		var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
		linear_velocity += ATTRACTIONTOTAL * globals.SENSITIVITY
		REDS.pop_at(0)
	
	for a in BLUES.size():
		var BLUE = BLUES[0]
		if BLUE != self:
			var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, BLUE.global_position)
			var dis1: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, BLUE.global_position + globals.SCREENSIZE)
			var dis2: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, BLUE.global_position - globals.SCREENSIZE)
			if dis1.x < dis.x:
				dis.x = dis1.x
			elif dis2.x > dis.x:
				dis.x = dis2.x
			if dis1.y < dis.y:
				dis.y = dis1.y
			elif dis2.y > dis.y:
				dis.y = dis2.y
			var COLOURTOCOLOURVALUE =  ATTRACTIONCALCULATOR.GETATTRACTION(1, 1)
			var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
			linear_velocity += ATTRACTIONTOTAL * globals.SENSITIVITY
		BLUES.pop_at(0)
	
	for a in GREENS.size():
		var GREEN = GREENS[0]
		var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, GREEN.global_position)
		var dis1: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, GREEN.global_position + globals.SCREENSIZE)
		var dis2: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, GREEN.global_position - globals.SCREENSIZE)
		if dis1.x < dis.x:
			dis.x = dis1.x
		elif dis2.x > dis.x:
			dis.x = dis2.x
		if dis1.y < dis.y:
			dis.y = dis1.y
		elif dis2.y > dis.y:
			dis.y = dis2.y
		var COLOURTOCOLOURVALUE = ATTRACTIONCALCULATOR.GETATTRACTION(1, 2)
		var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
		VELOCITY += ATTRACTIONTOTAL * globals.SENSITIVITY
		GREENS.pop_at(0)
	
	for a in ORANGES.size():
		var ORANGE = ORANGES[0]
		var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, ORANGE.global_position)
		var dis1: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, ORANGE.global_position + globals.SCREENSIZE)
		var dis2: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, ORANGE.global_position - globals.SCREENSIZE)
		if dis1.x < dis.x:
			dis.x = dis1.x
		elif dis2.x > dis.x:
			dis.x = dis2.x
		if dis1.y < dis.y:
			dis.y = dis1.y
		elif dis2.y > dis.y:
			dis.y = dis2.y
		var COLOURTOCOLOURVALUE = ATTRACTIONCALCULATOR.GETATTRACTION(1, 3)
		var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
		linear_velocity += ATTRACTIONTOTAL * globals.SENSITIVITY
		ORANGES.pop_at(0)
	
	for a in PURPLES.size():
		var PURPLE = PURPLES[0]
		var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, PURPLE.global_position)
		var dis1: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, PURPLE.global_position + globals.SCREENSIZE)
		var dis2: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, PURPLE.global_position - globals.SCREENSIZE)
		if dis1.x < dis.x:
			dis.x = dis1.x
		elif dis2.x > dis.x:
			dis.x = dis2.x
		if dis1.y < dis.y:
			dis.y = dis1.y
		elif dis2.y > dis.y:
			dis.y = dis2.y
		var COLOURTOCOLOURVALUE = ATTRACTIONCALCULATOR.GETATTRACTION(1, 4)
		var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
		linear_velocity += ATTRACTIONTOTAL * globals.SENSITIVITY
		PURPLES.pop_at(0)
	
	for a in YELLOWS.size():
		var YELLOW = YELLOWS[0]
		var dis = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, YELLOW.global_position)
		var dis1: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, YELLOW.global_position + globals.SCREENSIZE)
		var dis2: Vector2 = DOTMOVEMENTSYSTEM.GETDISTANCE(global_position, YELLOW.global_position - globals.SCREENSIZE)
		if dis1.x < dis.x:
			dis.x = dis1.x
		elif dis2.x > dis.x:
			dis.x = dis2.x
		if dis1.y < dis.y:
			dis.y = dis1.y
		elif dis2.y > dis.y:
			dis.y = dis2.y
		var COLOURTOCOLOURVALUE = ATTRACTIONCALCULATOR.GETATTRACTION(1, 5)
		var ATTRACTIONTOTAL = MOVES.GETATTRACTION(dis, COLOURTOCOLOURVALUE)
		linear_velocity += ATTRACTIONTOTAL * globals.SENSITIVITY
		YELLOWS.pop_at(0)
	
	linear_velocity += VELOCITY
	position = position.clamp(Vector2(0, 0), globals.SCREENSIZE)
