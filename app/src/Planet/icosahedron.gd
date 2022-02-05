class_name Icosahedron, "res://assets/tool/icosahedron.svg" extends Node


const PENTAGON_ANGLE = 72

export(int, 1, 10) var subdivision = 1 # кратность увеличения фрагментации икосаэдра
export(float) var radius = 1           # радиус внешней, описывающей сферы

var vertices:       int   = 12     # вершины
var edges:          int   = 30     # рёбра
var faces:          int   = 20     # грани
var latitudes:      int   = 3      # широты
var parallel_angle: float = 60     # угол широты или угол треугольника
var radius_inner:   float          # радиус внутренней, вписанной сферы
var edge_length:    float          # длина ребра
var face_array:     Array
var vertex_array:   Array


class Surface:
	var subdivision:    int
	var vertices:       int       # вершины
	var edges:          int       # рёбра
	var faces:          int       # грани
	var latitudes:      int       # широты
	var edge_length:    float     # длина ребра
	var parallel_angle: float
	var vertex_array:   Array
	
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
		vertex_array.resize(vertices)


class FaceClass:
	var subdivision: int
	var id:          int
	var faces_id:    Array = [null, null, null]
	var vertices_id: Array = [null, null, null]


class VertexClass:
	var subdivision: int
	var id:          int
	var vertices_id: Array = [null, null, null, null, null]
	var faces_id:    Array = [null, null, null, null, null]
	
	var latitude:    float
	var longitude:   float
	var x:           float
	var y:           float
	var z:           float


const icosahedron = {
	vertex_vertices = [
		[ 1,  2,  3,  4,  5],
		[ 0,  5,  6,  7,  2],
		[ 0,  1,  7,  8,  3],
		[ 0,  2,  8,  9,  4],
		[ 0,  3,  9, 10,  5],
		[ 0,  4, 10,  6,  1],
		[11, 10,  5,  1,  7],
		[11,  6,  1,  2,  8],
		[11,  7,  2,  3,  9],
		[11,  8,  3,  4, 10],
		[11,  9,  4,  5,  6],
		[ 6,  7,  8,  9, 10]
	],
	vertex_faces = [
		[ 1,  2,  3,  4,  5],
		[ 0,  5,  6,  7,  2],
		[ 0,  1,  7,  8,  3],
		[ 0,  2,  8,  9,  4],
		[ 0,  3,  9, 10,  5],
		[ 0,  4, 10,  6,  1],
		[11, 10,  5,  1,  7],
		[11,  6,  1,  2,  8],
		[11,  7,  2,  3,  9],
		[11,  8,  3,  4, 10],
		[11,  9,  4,  5,  6],
		[ 6,  7,  8,  9, 10]
	]
}


func _init():
	edge_length  = radius * 4 / sqrt(2 * (5 + sqrt(5)))
	radius_inner = edge_length / (4 * sqrt(3)) * (3 + sqrt(5))
	
	init_vertices()
	init_surface()
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
#	vertex_array.resize(vertices)
#	vertex_array[0] = VertexClass.new(0, 0)   # северный полюс
#	vertex_array[n] = VertexClass.new(180, 0) # южный полюс

#	for i in range(1, n):
#		#for j in range(1, n):
#			vertex_array[i] = VertexClass.new()
			
			
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


func init_vertices() -> void:
	vertex_array.resize(vertices)
	
	for i in vertices:
		vertex_array[i] = VertexClass.new()
		vertex_array[i].subdivision = subdivision
		vertex_array[i].id = i
		
		vertex_array[i].vertices_id = icosahedron.vertex_vertices[i]
		
		if i == 0:
			vertex_array[i].latitude  = 0
			vertex_array[i].longitude = 0
		elif i == 11:
			vertex_array[i].latitude  = 180
			vertex_array[i].longitude = 0
		else:
			vertex_array[i].latitude  = parallel_angle
			vertex_array[i].longitude = PENTAGON_ANGLE * (i - 1)
			if i > 5:
				vertex_array[i].latitude  *= 2
				vertex_array[i].longitude -= PENTAGON_ANGLE * .5
			
			if vertex_array[i].longitude > 360:
				vertex_array[i].longitude -= 360
		
		#prints(i, vertex_array[i].vertices_id)
		#prints(i, vertex_array[i].latitude, vertex_array[i].longitude)
		
	vertex_array[1].x = radius * sin(deg2rad(vertex_array[1].latitude))
	vertex_array[1].y = radius * sin(deg2rad(90 - vertex_array[1].latitude))
	vertex_array[1].z = 0
	
	prints(1, vertex_array[1].x, vertex_array[1].y, vertex_array[1].z)
		#[ 0, -1,  5,  6, 1]
		#[11, -1, -6, -5, 1]
#		for j in 5:
#			if i == 0:
#				vertex_array[0].vertices_id[j] = j + 1
#			elif i == 11:
#				vertex_array[11].vertices_id[j] = j + 6
#			else:
#				if i < 6:
#					if j == 0:
#						vertex_array[i].vertices_id[0] = 0
#					else:
#						vertex_array[11].vertices_id[j] = 2 * j - 1
#				else:
#					if j == 0:
#						vertex_array[i].vertices_id[0] = 11
#					else:
#						vertex_array[11].vertices_id[j] = j + 6
#		var k = 0
#		if i < 6:
#			for j in [-i, -1, 5, 6, 1]:
#				vertex_array[i].vertices_id[k] = i + j
#				if vertex_array[i].vertices_id[k] > 10: vertex_array[i].vertices_id[k] -= 5
#				#if vertex_array[i].vertices_id[k] >  5: vertex_array[i].vertices_id[k] -= 5
#				k += 1
#
#		else:
#			k = 0
#			for j in [11, -1, -6, -5, 1]:
#				vertex_array[i].vertices_id[k] = i + j
#				k += 1
		
		


func init_vertices2() -> void:
	vertex_array.resize(vertices)
	
	for i in vertices:
		vertex_array[i] = VertexClass.new()
		vertex_array[i].subdivision = subdivision
		vertex_array[i].id = i
		
		for j in 5:
			if i == 0:
				vertex_array[0].vertices_id[j] = 2 * j + 1
				vertex_array[0].faces_id[j]    = 4 * j
			elif i == 11:
				vertex_array[11].vertices_id[j] = 2 * j + 2
				vertex_array[11].faces_id[j]    = 4 * j + 3
			else:
				if j == 0:
					if i%2 > 0: # нечётное
						vertex_array[i].vertices_id[0] = 0
					else: # чётное
						vertex_array[i].vertices_id[0] = 11
				else:
					if j < 3:
						vertex_array[i].vertices_id[j] = i + j - 3
						if vertex_array[i].vertices_id[j] < 1:
							vertex_array[i].vertices_id[j] += 10
					else:
						vertex_array[i].vertices_id[j] = i + j - 2
						if vertex_array[i].vertices_id[j] > 10:
							vertex_array[i].vertices_id[j] -= 10
				
				if (i%2 > 0 && j < 3) || (i%2 == 0 && j < 2):
					vertex_array[i].faces_id[j] = 2 * i + j - 2
				else:
					vertex_array[i].faces_id[j] = 2 * i + j - 1
				
				if vertex_array[i].faces_id[j] > 19:
					vertex_array[i].faces_id[j] -= 20
		
		#prints(i, vertex_array[i].vertices_id)
		#prints(i, vertex_array[i].faces_id)
	return


func init_surface() -> void:
	face_array.resize(faces)
	var i = 0
	var a: int
	var b: int
	var c: int
	var d: int
	
	for j in 5:
		a = 2 * j
		b = a - 1
		c = a + 1
		d = a + 2
		
		if j == 0:
			if a == 0: a  = 10
			if b  < 0: b += 10
		
		for k in 4:
			face_array[i] = FaceClass.new()
			face_array[i].subdivision = subdivision
			face_array[i].id = i
			
			match k:
				0:
					face_array[i].faces_id    = [i-4, i+1, i+4]
					face_array[i].vertices_id = [0, b, c]
				1:
					face_array[i].faces_id    = [i-3, i-1, i+1]
					face_array[i].vertices_id = [b, a, c]
				2:
					face_array[i].faces_id    = [i-1, i+1, i+3]
					face_array[i].vertices_id = [a, c, d]
				3:
					face_array[i].faces_id    = [i-4, i-1, i+4]
					face_array[i].vertices_id = [a, d, 11]
			
			if face_array[i].faces_id[0] <  0: face_array[i].faces_id[0] += 20
			if face_array[i].faces_id[2] > 19: face_array[i].faces_id[2] -= 20
			
			#prints(i, face_array[i].faces_id)
			#prints(i, face_array[i].vertices_id)
			i += 1
	return


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
