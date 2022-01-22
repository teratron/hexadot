extends InterpolatedCamera


func _ready():
	target = NodePath("../Player/Position3D")
	enabled = true
