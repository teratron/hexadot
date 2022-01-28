class_name Planet, "res://assets/earth.svg" extends Node


export(float) var _radius = 100             # радиус планеты
export(int) var num_hex_equator = 360       # количество шестиугольников по экватору
export(bool) var is_vertical_hexagon = true # ориентация шестиугольника, вертикальная или горизонтальная

var circumference: float        # длина экватора планеты (длина окружности)
var angle_arc: float            # угол между центрами соседних шестиугольников по экватору
var length_arc: float           # длина дуги между центрами соседних шестиугольников по экватору
var _hexagon_width: float        # ширина шестиугольника (длина хорды по экватору)
var _hexagon_height: float       # высота шестиугольника
var _hexagon_radius_outer: float # радиус внешней, описывающей окружности
var _hexagon_radius_inner: float # радиус внутренней, вписанной окружности
var _hexagon_radius_delta: float # разница радиусов шестиугольника

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
	_hexagon_width = _calc_length_chord(_radius, angle_arc)
	
	if is_vertical_hexagon:
		_hexagon_radius_inner = _hexagon_width / 2
		_hexagon_radius_outer = _hexagon_radius_inner / sqrt(.75)
		_hexagon_height = 2 * _hexagon_radius_outer
	else:
		_hexagon_radius_outer = _hexagon_width / 2
		_hexagon_radius_inner = _hexagon_radius_outer * sqrt(.75)
		_hexagon_height = 2 * _hexagon_radius_inner
	
	_hexagon_radius_delta = _hexagon_radius_outer - _hexagon_radius_inner
	
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
	print("_hexagon_width: ", _hexagon_width)
	print("_hexagon_height: ", _hexagon_height)
	print("_hexagon_radius_inner: ", _hexagon_radius_inner)
	print("_hexagon_radius_outer: ", _hexagon_radius_outer)
	print("_hexagon_radius_delta: ", _hexagon_radius_delta)
	#print(typeof( hexagon))
	#print_this_script_three_times()


#func print_this_script_three_times():
	#print(get_script())
	#print(ResourceLoader.load("res://assets/planet.gd"))
	#print(Planet)


# долгота longitude меридианы meridian
# широта latitude equator parallels паралели
# высота altitude
