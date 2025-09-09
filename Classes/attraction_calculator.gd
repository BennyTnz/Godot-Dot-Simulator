extends Resource

class_name ATTRACTIONCALCULATOR                                     #The class

static var ATTRACTIONMATRIX = []                                    #2-dimensional array (matrix)

static func CREATEMATRIX(size):                                     #Creates matrix
	var rng = RandomNumberGenerator.new()                           #Creates random number generator
	for a in range(size):                                           #Repeats
		ATTRACTIONMATRIX.append([])                                 #Adds another array inside of the original array
		for b in range(size):                                       #Repeats
			ATTRACTIONMATRIX[a].append(rng.randf_range(-1.0001, 1.0))  #Adds random number between -1 and 1

static func GETATTRACTION(from: int, to: int):                      #Gets an attraction
	return ATTRACTIONMATRIX[from][to]                               #Returns attraction

static func CHANGEATTRACTION(from: int, to: int, new_value: float): #Changes an attraction
	ATTRACTIONMATRIX[from].pop_at(to)                               #Takes one away
	ATTRACTIONMATRIX[from].insert(to, new_value)                    #Adds new one in
