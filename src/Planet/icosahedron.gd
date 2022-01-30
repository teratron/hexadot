class_name Icosahedron, "res://assets/icosahedron.svg" extends Node


export(int, 1, 10) var subdivision = 1  # кратность увеличения фрагментации икосаэдра
export(float) var radius = 100          # радиус внешней, описывающей сферы

var vertices:  int = 12  # вершины
var edges:     int = 30  # рёбра
var faces:     int = 20  # грани
var latitudes: int = 3   # широты
var parallels: Array = [5, 5] # паралели

var latitude_angle: float
var radius_inner:   float    # радиус внутренней, вписанной сферы
var edge_length:    float    # длина ребра

var coords = []


class Vertex:
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
	parallels   = get_num_parallels(parallels, subdivision)
	edge_length = get_length_edge(radius)
	latitude_angle = 180 / float(latitudes)
	
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
	print("latitude angle: ", latitude_angle)
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


func get_num_parallels(_parallels: Array, _subdivision: int) -> Array:
	var n = get_num_latitudes(_subdivision) - 1
	_parallels.resize(n)
	print(len(_parallels))
	##for i in n:
		#print(i)#_parallels[]
	return _parallels


func get_length_edge(_radius) -> float:
	return _radius * 4 / sqrt(2 * (5 + sqrt(5)))
