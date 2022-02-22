extends Spatial


onready var icosahedron = $Icosahedron
onready var vertex = preload("res://src/world/vertex_ball.tscn")


func _ready():
	for v in icosahedron.vertex_array:
		var ball = vertex.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
		ball.translation.x = v.x
		ball.translation.y = v.y
		ball.translation.z = v.z
		ball.setText(String(v.id))
		add_child(ball)

