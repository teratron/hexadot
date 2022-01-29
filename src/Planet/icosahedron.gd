class_name Icosahedron, "res://assets/icosahedron.svg" extends Node


enum POLES {NORTH, SOUTH} # полюса

export(int, 1, 10) var subdivision = 1  # кратность увеличения фрагментации икосаэдра
export(float) var radius = 100          # радиус внешней, описывающей сферы

var vertices:  int = 12  # вершины
var edges:     int = 30  # рёбра
var faces:     int = 20  # грани
var latitudes: int = 3   # широты
var parallels: int = 2   # паралели

var radius_inner: float  # радиус внутренней, вписанной сферы
var edge_length:  float  # длина ребра


func _init():
	pass


func _ready():
	update_all_params(subdivision)
	edge_length = get_length_edge(radius)
	
	#	radius_outer = edge_length /  4 * sqrt(2 * (5 + sqrt(5)))
#	radius_inner = edge_length / (4 * sqrt(3)) * (3 + sqrt(5))
#	print("Icosahedron")
#	print("Radius Outter: ", radius_outer)
#	print("Radius Inner: ",  radius_inner)
	print("edge length: ", edge_length)
	pass


func update_all_params(_subdivision: int):
	vertices  = get_num_vertices(_subdivision)
	edges     = get_num_edges(_subdivision)
	faces     = get_num_faces(_subdivision)
	latitudes = get_num_latitudes(_subdivision)
	parallels = get_num_parallels(_subdivision)
	
	#for i in range(1, _subdivision + 1): print(i, " ",get_num_parallels(i))
	print("%d vertices x%d" % [vertices, _subdivision])
	print("%d edges x%d" % [edges, _subdivision])
	print("%d faces x%d" % [faces, _subdivision])
	print("%d latitudes x%d" % [latitudes, _subdivision])
	print("%d parallels x%d" % [parallels, _subdivision])
	return


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


func get_num_parallels(_subdivision: int) -> int:
	return get_num_latitudes(_subdivision) - 1


func get_length_edge(_radius) -> float:
	return _radius * 4 / sqrt(2 * (5 + sqrt(5)))
