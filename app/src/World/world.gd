extends Spatial


onready var icosahedron = $Icosahedron
onready var vertex = preload("res://src/World/vertex_ball.tscn")


func _ready():
	for v in icosahedron.vertex_array:
		var ball = vertex.instance(1)
		ball.translation.x = v.x
		ball.translation.y = v.y
		ball.translation.z = v.z
		ball.setText(String(v.id))
		add_child(ball)

