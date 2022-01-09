extends Node

class_name Planet, "res://assets/earth.svg"

export var radius: float = 100
export var num_hex_equator: int = 360 # количество шестиугольников по экватору

var circumference: float # длина окружности
var length_arc_equator: float # length of the circle segment, the arc of the circle
var length_hex_equator: float
var angle_hex_equator: float # угол дуги шестиугольника


func _ready():
	angle_hex_equator = 360 / float(num_hex_equator)
	print("angle: ", angle_hex_equator)
	
	circumference = 2 * PI * radius
	print("length equator: ", circumference)
	
	length_arc_equator = PI * radius / 180.0 * angle_hex_equator
	print("arc: ", length_arc_equator)
	
#	print_this_script_three_times()


#func print_health():
	#print(health)


#func print_this_script_three_times():
	#print(get_script())
	#print(ResourceLoader.load("res://assets/planet.gd"))
	#print(Planet)


# долгота longitude меридианы meridian
# широта latitude equator parallels паралели
# высота altitude
