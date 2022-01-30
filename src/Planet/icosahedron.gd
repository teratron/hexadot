class_name Icosahedron, "res://assets/icosahedron.svg" extends Node


const PENTAGON_ANGLE = 72

export(int, 1, 10) var subdivision = 1  # кратность увеличения фрагментации икосаэдра
export(float) var radius = 100          # радиус внешней, описывающей сферы

var vertices:       int = 12       # вершины
var edges:          int = 30       # рёбра
var faces:          int = 20       # грани
var latitudes:      int = 3        # широты
var parallel_angle: float = 60     # 
var radius_inner:   float          # радиус внутренней, вписанной сферы
var edge_length:    float          # длина ребра
var icosahedron:    Array
var coordinates:    Array


class Figure:
	var subdivision:    int
	var vertices:       int       # вершины
	var edges:          int       # рёбра
	var faces:          int       # грани
	var latitudes:      int       # широты
	var edge_length:    float     # длина ребра
	var parallel_angle: float
	var coordinates:    Array
	
	func _init(subdiv = 1, radius = 1):
		var n = int(pow(4, subdiv - 1))
		subdivision = subdiv
		vertices    = 10 * n + 2
		edges       = 30 * n
		faces       = 20 * n
		latitudes   = 3 * int(pow(2, subdivision - 1))
		edge_length = radius * 4 / sqrt(2 * (5 + sqrt(5)))
		parallel_angle = 180 / float(latitudes)
		
		print("x", subdivision)
		print("%d vertices" % vertices)
		print("%d edges" % edges)
		print("%d faces" % faces)
		print("%d latitudes" % latitudes)
		print("edge length: ", edge_length)
		print("latitude angle: ", parallel_angle)
		
		n = vertices - 1
		coordinates.resize(vertices)
		coordinates[0] = Vertex.new(0, 0)   # северный полюс
		coordinates[n] = Vertex.new(180, 0) # южный полюс


class Face:
	var vertices:    int = 3   # вершины
	var edges:       int = 3   # рёбра
	var faces:       int = 4   # грани
	var edge_length: float     # длина ребра
	var coordinates: Array


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
	var n = vertices - 1
	coordinates.resize(vertices)
	coordinates[0] = Vertex.new(0, 0)   # северный полюс
	coordinates[n] = Vertex.new(180, 0) # южный полюс
	print(subdivision)
	for i in range(1, n):
		coordinates[i] = Vertex.new()
		coordinates[i].subdivision = subdivision
		coordinates[i].latitude  = 0
		coordinates[i].longitude = 0
	pass


func _ready():
#	vertices    = get_num_vertices(subdivision)
#	edges       = get_num_edges(subdivision)
#	faces       = get_num_faces(subdivision)
#	latitudes   = get_num_latitudes(subdivision)
#	#parallels   = get_num_parallels(parallels, subdivision)
#	edge_length = get_length_edge(radius)
#	parallel_angle = 180 / float(latitudes)
	
	
#	icosahedron.resize(subdivision)
#	for i in range(0, subdivision):
#		#print(i)
#		icosahedron[i] = Figure.new(i + 1, radius)



#	var n = vertices - 1
#	coordinates.resize(vertices)
#	coordinates[0] = Vertex.new(0, 0)   # северный полюс
#	coordinates[n] = Vertex.new(180, 0) # южный полюс

#	for i in range(1, n):
#		#for j in range(1, n):
#			coordinates[i] = Vertex.new()
			
			
	#print(coords[0].longitude)
	
	
#	radius_outer = edge_length /  4 * sqrt(2 * (5 + sqrt(5)))
#	radius_inner = edge_length / (4 * sqrt(3)) * (3 + sqrt(5))
#	print("Icosahedron")
#	print("Radius Outter: ", radius_outer)
#	print("Radius Inner: ",  radius_inner)
	#for i in range(1, _subdivision + 1): print(i, " ",get_num_parallels(i))
#	print("%d vertices x%d" % [vertices, subdivision])
#	print("%d edges x%d" % [edges, subdivision])
#	print("%d faces x%d" % [faces, subdivision])
#	print("%d latitudes x%d" % [latitudes, subdivision])
#	#print("%a parallels x%d" % [parallels, subdivision])
#	print("edge length: ", edge_length)
#	print("latitude angle: ", parallel_angle)
	pass


#func get_delta(_subdivision: int) -> int:
#	return int(pow(4, _subdivision - 1))
#
#
#func get_num_vertices(_subdivision: int) -> int:
#	return 10 * get_delta(_subdivision) + 2
#
#
#func get_num_edges(_subdivision: int) -> int:
#	return 30 * get_delta(_subdivision)
#
#
#func get_num_faces(_subdivision: int) -> int:
#	return 20 * get_delta(_subdivision)
#
#
#func get_num_latitudes(_subdivision: int) -> int:
#	return 3 * int(pow(2, _subdivision - 1))
#
#
#func get_length_edge(_radius) -> float:
#	return _radius * 4 / sqrt(2 * (5 + sqrt(5)))
