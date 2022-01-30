class_name Icosahedron, "res://assets/icosahedron.svg" extends Node


const PENTAGON_ANGLE = 72

export(int, 1, 10) var subdivision = 1  # кратность увеличения фрагментации икосаэдра
export(float) var radius = 100          # радиус внешней, описывающей сферы

#var vertices:  int = 12       # вершины
#var edges:     int = 30       # рёбра
#var faces:     int = 20       # грани
#var latitudes: int = 3        # широты
#var parallels: Array = [5, 5] # паралели

#var parallel_angle: float
var radius_inner:   float     # радиус внутренней, вписанной сферы
#var edge_length:    float     # длина ребра
var icosahedron = []
var coords = []

class Figure:
	var subdivision:    int
	var vertices:       int       # вершины
	var edges:          int       # рёбра
	var faces:          int       # грани
	var latitudes:      int       # широты
	var edge_length:    float     # длина ребра
	var parallel_angle: float
	
	func _init(lat = 0, lon = 0):
		latitude  = lat
		longitude = lon


class Vertex:
	var subdivision: int
	var latitude:  float
	var longitude: float
	var x: float
	var y: float
	var z: float
	
	func _init(lat = 0, lon = 0):
		latitude  = lat
		longitude = lon


func _init():
	pass


func _ready():
	vertices    = get_num_vertices(subdivision)
	edges       = get_num_edges(subdivision)
	faces       = get_num_faces(subdivision)
	latitudes   = get_num_latitudes(subdivision)
	#parallels   = get_num_parallels(parallels, subdivision)
	edge_length = get_length_edge(radius)
	parallel_angle = 180 / float(latitudes)
	
	
	
	var n = vertices - 1
	coords.resize(vertices)
	coords[0] = Vertex.new(0, 0)   # северный полюс
	coords[n] = Vertex.new(180, 0) # южный полюс
	
	for i in range(1, n):
		#for j in range(1, n):
			coords[i] = Vertex.new()
			
			
	#print(coords[0].longitude)
	
	
#	radius_outer = edge_length /  4 * sqrt(2 * (5 + sqrt(5)))
#	radius_inner = edge_length / (4 * sqrt(3)) * (3 + sqrt(5))
#	print("Icosahedron")
#	print("Radius Outter: ", radius_outer)
#	print("Radius Inner: ",  radius_inner)
	#for i in range(1, _subdivision + 1): print(i, " ",get_num_parallels(i))
	print("%d vertices x%d" % [vertices, subdivision])
	print("%d edges x%d" % [edges, subdivision])
	print("%d faces x%d" % [faces, subdivision])
	print("%d latitudes x%d" % [latitudes, subdivision])
	#print("%a parallels x%d" % [parallels, subdivision])
	print("edge length: ", edge_length)
	print("latitude angle: ", parallel_angle)
	pass


func get_delta(_subdivision: int) -> int:
	return int(pow(4, _subdivision - 1))


func get_num_vertices(_subdivision: int) -> int:
	return 10 * get_delta(_subdivision) + 2


func get_num_edges(_subdivision: int) -> int:
	return 30 * get_delta(_subdivision)


func get_num_faces(_subdivision: int) -> int:
	return 20 * get_delta(_subdivision)


func get_num_latitudes(_subdivision: int) -> int:
	return 3 * int(pow(2, _subdivision - 1))


#func get_num_parallels(_parallels: Array, _subdivision: int) -> Array:
#	var delta = 5
#	var n = get_num_latitudes(_subdivision) - 1
#	_parallels.resize(n)
#	#print(len(_parallels))
#	#print(ceil(n / 2.0
#	for i in ceil(n / 2.0):
#		_parallels[i] = delta
#		var j = n - i - 1
#		if i < j:
#			_parallels[j] = delta
#		delta = i * 5
#		# 2 5  / 5 10   10   10 5
#		# 3 11 / 5 10 15 20 20   20   20 20 15 10 5
#		# 4 23 / 5 10 15 20 30 30 40 40 40 40 40   40   40 40 40 40 40 30 30 20 15 10 5
#		#        1  2  3  4  6  6  8  8  8  8  8
#
#	print(_parallels)
#
#	return _parallels


func get_length_edge(_radius) -> float:
	return _radius * 4 / sqrt(2 * (5 + sqrt(5)))
