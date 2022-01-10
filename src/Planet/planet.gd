class_name Planet, "res://assets/earth.svg" extends Node


export var _radius: float = 100             # радиус планеты
export var num_hex_equator: int = 360       # количество шестиугольников по экватору
export var is_vertical_hexagon: bool = true # ориентация шестиугольника, вертикальная или горизонтальная


var circumference: float        # длина экватора планеты (длина окружности)
var angle_arc: float            # угол между центрами соседних шестиугольников по экватору
var length_arc: float           # длина дуги между центрами соседних шестиугольников по экватору
var width_hexagon: float        # ширина шестиугольника (длина хорды по экватору)
var height_hexagon: float       # высота шестиугольника
var radius_hexagon_outer: float # радиус внешней, описывающей окружности
var radius_hexagon_inner: float # радиус внутренней, вписанной окружности
var radius_hexagon_delta: float # разница радиусов шестиугольника


var planet_X = 0.0
var planet_Y = 0.0
var planet_Z = 0.0


var grid = []

var hexagon = {
	longitude = 0.0, # долгота
	latitude = 0.0,  # широта
	altitude = 0.0,  # высота
	x = 0.0,
	y = 0.0,
	z = 0.0
}


func _init():
	pass


func _ready():
	angle_arc = 360 / float(num_hex_equator)
	
	circumference = _calc_circumference(_radius)
	length_arc = _calc_length_arc(_radius, angle_arc) 
	width_hexagon = _calc_length_chord(_radius, angle_arc)
	
	if is_vertical_hexagon:
		radius_hexagon_inner = width_hexagon / 2
		radius_hexagon_outer = radius_hexagon_inner / sqrt(.75)
		height_hexagon = 2 * radius_hexagon_outer
	else:
		radius_hexagon_outer = width_hexagon / 2
		radius_hexagon_inner = radius_hexagon_outer * sqrt(.75)
		height_hexagon = 2 * radius_hexagon_inner
	
	radius_hexagon_delta = radius_hexagon_outer - radius_hexagon_inner
	
	grid.resize(num_hex_equator)
	
	
	print_params()


# Вычисляет длину окружности
func _calc_circumference(radius: float) -> float:
	return 2 * PI * radius


# Вычисляет длину дуги окружности
func _calc_length_arc(radius, angle: float) -> float:
	return PI * radius / 180.0 * angle


# Вычисляет длину хорды окружности
func _calc_length_chord(radius, angle: float) -> float:
	return 2 * radius * sin(deg2rad(angle/2))


func print_params() -> void:
	print("angle: ", angle_arc, " ", deg2rad(angle_arc))
	print("length equator: ", circumference)
	print("length arc: ", length_arc)
	print("width_hexagon: ", width_hexagon)
	print("height_hexagon: ", height_hexagon)
	print("radius_hexagon_inner: ", radius_hexagon_inner)
	print("radius_hexagon_outer: ", radius_hexagon_outer)
	print("radius_hexagon_delta: ", radius_hexagon_delta)
	#print(typeof( hexagon))
	#print_this_script_three_times()


#func print_this_script_three_times():
	#print(get_script())
	#print(ResourceLoader.load("res://assets/planet.gd"))
	#print(Planet)


# долгота longitude меридианы meridian
# широта latitude equator parallels паралели
# высота altitude
