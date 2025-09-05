extends Resource

class_name DOTMOVEMENTSYSTEM                                                        #Class name
var globals = preload("res://globals.gd")

static func GETDISTANCE(pos: Vector2, target_pos: Vector2):                         #Outputs the distance between 2 vectors
	var DISTANCE = target_pos - pos                                                 #Calculates distance
	return DISTANCE                                                                 #Outputs distance

func GETNEARESTNODE(pos: Vector2, list_of_nodes: Array):                            #Gets nearest node
	var SMALLESTDISTANCE = null                                                     #Var for smallest distance (changed later)
	var CLOSESTNODE = null                                                          #Var for closest node (changed later)
	for a in list_of_nodes:                                                         #Repeats for length of list_of_distances
		var DISTANCE = GETDISTANCE(pos, a.global_position)                          #Gets the distance
		if DISTANCE < SMALLESTDISTANCE:                                             #If distance is less than smallest distance
			SMALLESTDISTANCE = DISTANCE                                             #Updates smallest distance
			CLOSESTNODE = a                                                         #Updates closest node
	return CLOSESTNODE                                                              #Returns the closest node

func GETATTRACTION(distance: Vector2, colour_to_colour_value: float):
	var ATTRACTION: Vector2 = Vector2(0, 0)
	var RANGE = globals.RANGE
	var RADIUS = globals.RADIUS
	if distance.length() < RANGE:
		ATTRACTION = (distance.normalized() * RANGE) / distance * (distance.normalized() * colour_to_colour_value)
	if ATTRACTION.length() > distance.length():
		ATTRACTION = distance - (RADIUS * distance.normalized())
	return ATTRACTION
