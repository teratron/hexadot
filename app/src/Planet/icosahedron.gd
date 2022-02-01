class_name Icosahedron, "res://assets/tool/icosahedron.svg" extends Node


const PENTAGON       = 5
const PENTAGON_ANGLE = 72

export(int, 1, 10) var subdivision = 1  # кратность увеличения фрагментации икосаэдра
export(float) var radius = 100          # радиус внешней, описывающей сферы

var vertices:       int   = 12     # вершины
var edges:          int   = 30     # рёбра
var faces:          int   = 20     # грани
var latitudes:      int   = 3      # широты
var parallel_angle: float = 60     # угол широты или угол триугольника
var radius_inner:   float          # радиус внутренней, вписанной сферы
var edge_length:    float          # длина ребра

#var icosahedron: Array
var surface:     Array
var coordinates: Array
#var parallels = [1, 5, 5, 1]


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
	var subdivision:   int
	var id:            int
	var faces_near_id: Array
	var vertices_id:   Array


class Vertex:
	var subdivision: int
	var id:          int
	var faces_id:    Array
	
	var latitude:  float
	var longitude: float
	var x:         float
	var y:         float
	var z:         float
	
	func _init(lat = 0, lon = 0):
		latitude  = lat
		longitude = lon

#0  0 9
#1  4 1  -3
#2  8 3  -5
#3 12 5  -7
#4 16 7  -9

func _init():
	parallel_angle = 180 / float(latitudes)
	edge_length    = radius * 4 / sqrt(2 * (5 + sqrt(5)))
	radius_inner   = edge_length / (4 * sqrt(3)) * (3 + sqrt(5))
	
	surface.resize(faces)
#	for i in faces:
#		surface[i] = Face.new()
#		surface[i].subdivision = subdivision
#		surface[i].id = i
#		#surface[i].faces_near_id = set_faces_near_id(i)
#		surface[i].faces_near_id = set_alt_faces_near_id()
#		surface[i].vertices_id = set_vertices_id(i)
#		prints(i, surface[i].faces_near_id)
	
	var a: int
	var b: int
	var c: int
	var x: int
	var y: int
	var z: int
	var i = 0
	for j in 5:
		for k in 4:
			surface[i] = Face.new()
			surface[i].subdivision = subdivision
			surface[i].id = i
			
			match k:
				0:
					a = i + 1
					if j == 4: b = i - 16; else: b = i + 4
					if j == 0: c = i + 16; else: c = i - 4
					
					x = 0
					if j == 0: y = j + 9; else: y = 2 * j - 1
				1:
					a = i - 1
					if j == 0: b = i + 17; else: b = i - 3
					c = i + 1
				2:
					a = i + 1
					if j == 4: b = i - 17; else: b = i + 3
					c = i - 1
				3:
					a = i - 1
					if j == 0: b = i + 16; else: b = i - 4
					if j == 4: c = i - 16; else: c = i + 4
					
					z = 0
			
			surface[i].faces_near_id = [a, b, c]
			surface[i].vertices_id = [x, y, z]
			
			prints(i, surface[i].faces_near_id)
			i += 1
	
#	var i = 0
#	coordinates.resize(vertices)
#	for j in [1, 5, 5, 1]:
#		for k in j:
#			prints(i, j, k)
#			coordinates[i] = Vertex.new()
#			coordinates[i].subdivision = subdivision
#			coordinates[i].faces_id = []
#			i += 1
	
	
#	var n = vertices - 1
#	coordinates.resize(vertices)
#	coordinates[0] = Vertex.new(0, 0)   # северный полюс
#	coordinates[n] = Vertex.new(180, 0) # южный полюс
#	print(subdivision)
#	for i in range(1, n):
#		coordinates[i] = Vertex.new()
#		coordinates[i].subdivision = subdivision
#		coordinates[i].latitude  = 0
#		coordinates[i].longitude = 0
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


#func set_faces_near_id(index: int) -> Array:
#	var u: int # индекс следующей плоскости
#	var v: int # индекс предыдующей плоскости
#	var w: int # индекс плоскости граничащей с основанием
#
#	# северный и южный полюс
#	if index < 5 || index > 14:
#		if index == 4 || index == 19:
#			u = index - 4
#		else:
#			u = index + 1
#		if index == 0 || index == 15:
#			v = index + 4
#		else:
#			v = index - 1
#		if index < 5:
#			w = index + 5
#		if index > 14:
#			w = index - 5
#
#	# экватор
#	else:
#		if index > 4 && index < 10:
#			u = index + 5
#			if index == 5:
#				v = index + 9
#			else:
#				v = index + 4
#			w = index - 5
#		if index > 9 && index < 15:
#			if index == 14:
#				u = index - 9
#			else:
#				u = index - 4
#			v = index - 5
#			w = index + 5
#
#	return [u, v, w]


#func set_alt_faces_near_id() -> Array:
#	var a: int
#	var b: int
#	var c: int
#	var i = 0
#
#	for j in 5:
#		for k in 4:
#			match k:
#				0:
#					a = i + 1
#					if j == 4: b = i - 16; else: b = i + 4
#					if j == 0: c = i + 16; else: c = i - 4
#				1:
#					a = i - 1
#					if j == 0: b = i + 17; else: b = i - 3
#					c = i + 1
#				2:
#					a = i + 1
#					if j == 4: b = i - 17; else: b = i + 3
#					c = i - 1
#				3:
#					a = i - 1
#					if j == 0: b = i + 16; else: b = i - 4
#					if j == 4: c = i - 16; else: c = i + 4
#			i += 1
#
#	return [a, b, c]

#func set_vertices_id(index: int) -> Array:
#	var u: int # индекс следующей плоскости
#	var v: int # индекс предыдующей плоскости
#	var w: int # индекс плоскости граничащей с основанием
#
#	if index < 5:
#		u = 0
#		if index == 0:
#			v = 5
#		else:
#			v = index
#		w = index + 1
#		if index > 4 && index < 10:
#			u = index + 5
#			if index == 5:
#				v = index + 9
#			else:
#				v = index + 4
#			w = index - 5
#		if index > 9 && index < 15:
#			if index == 14:
#				u = index - 9
#			else:
#				u = index - 4
#			v = index - 5
#			w = index + 5
#
#	return [u, v, w]

#0 0 5 1
#1 0 1 2
#2 0 2 3
#3 0 3 4
#4 0 4 5






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
