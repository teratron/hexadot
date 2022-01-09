class_name Planet, "res://assets/earth.svg" extends Node


export var radius: float = 100
export var num_hex_equator: int = 360 # количество шестиугольников по экватору
export var position_hex_edge: bool = false


var circumference: float # длина окружности по экватору
var angle_hex_equator: float # угол дуги шестиугольника по экватору
var length_chord_equator: float # chord of a circle
var length_arc_equator: float # length of the circle segment, the arc of the circle


var hexagon = {
	"x": 0.0,
	"y": 0.0
}


func _init():
	pass


func _ready():
	angle_hex_equator = 360 / float(num_hex_equator)
	print("angle: ", angle_hex_equator, " ", deg2rad(angle_hex_equator))
	
	circumference = 2 * PI * radius
	print("length equator: ", circumference)
	
	# length_arc_equator = circumference / num_hex_equator
	length_arc_equator = PI * radius / 180.0 * angle_hex_equator
	print("length arc: ", length_arc_equator)
	
	length_chord_equator = 2 * radius * sin(deg2rad(angle_hex_equator/2))
	print("length chord: ", length_chord_equator)
	#print_this_script_three_times()
	
	if !position_hex_edge:
		var h =

#func print_health():
	#print(health)


#func print_this_script_three_times():
	#print(get_script())
	#print(ResourceLoader.load("res://assets/planet.gd"))
	#print(Planet)


# долгота longitude меридианы meridian
# широта latitude equator parallels паралели
# высота altitude
