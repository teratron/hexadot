class_name Icosahedron, "res://assets/icosahedron.svg" extends Node


const VERTICES:  int = 12  # вершины
const EDGES:     int = 30  # рёбра
const FACES:     int = 20  # грани
const LATITUDES: int = 3   # широты
const PARALLELS: int = 2   # паралели
const POLES:     int = 2   # полюса

var vertices  = VERTICES
var edges     = EDGES
var faces     = FACES
var latitudes = LATITUDES
var parallels = PARALLELS

export(int, 1, 10) var subdivision = 2  # кратность увеличения фрагментации икосаэдра
export(float) var radius_outer = 100    # радиус внешней, описывающей сферы

var radius_inner: float = 100         # радиус внутренней, вписанной сферы
var edge_length:  float = 1           # длина ребра


func _init():
	radius_outer = edge_length /  4 * sqrt(2 * (5 + sqrt(5)))
	radius_inner = edge_length / (4 * sqrt(3)) * (3 + sqrt(5))
	edge_length  = radius_outer * 4 / sqrt(2 * (5 + sqrt(5)))
	
	
	print("Icosahedron")
	print("Radius Outter:", radius_outer)
	print("Radius Inner:",  radius_inner)
	print("Edge Length:",   edge_length)
	pass


func _ready():
	update_all_params(subdivision)
	pass


func update_all_params(multiple: int):
	vertices = get_num_vertices(multiple)
	edges    = get_num_edges(multiple)
	faces    = get_num_faces(multiple)
	

#		latitudes = LATITUDES
#		parallels = PARALLELS
	return


func get_num_vertices(multiple: int) -> int:
	var vertex = VERTICES
	var delta = 10
	if multiple > 1:
		for i in range(2, multiple + 1):
			delta *= 4
			print(i," ",pow(4, i - 1)*10," ", delta, " ", delta + 2, " ", FACES * delta / 20 + 2)
		vertex = delta + 2
	print("number of vertices %d for subdivision x%d" % [vertex, multiple])
	return vertex


func get_num_edges(multiple: int) -> int:
	var edge = EDGES
	var delta = 30
	if multiple > 1:
		for _i in range(2, multiple + 1):
			delta *= 4
			#print(i, " ", delta, " ", delta + EDGES)
		edge = delta
	print("number of edges %d for subdivision x%d" % [edge, multiple])
	return edge


func get_num_faces(multiple: int) -> int:
	var face = FACES
	var delta = 1
	if multiple > 1:
		for _i in range(2, multiple + 1):
			delta *= 4
			#print(i, " ", FACES * delta)
		face = FACES * delta
	print("number of faces %d for subdivision x%d" % [face, multiple])
	return face



