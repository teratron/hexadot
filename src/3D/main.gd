extends Spatial


onready var cam_world = $Camera
onready var cam_player = $InterpolatedCamera
#onready var cam_player = $"Player/Camera"
var current: bool


func _ready():
	if !cam_world.current && !cam_player.current:
		cam_world.current = true
		current = true


func _process(_delta):
	if Input.is_action_just_pressed("ui_camera"):
		if cam_world.current:
			cam_world.current = false
			cam_player.current = true
		else:
			cam_world.current = true
			cam_player.current = false
