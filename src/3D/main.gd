extends Spatial



onready var cam_world = $Camera
onready var cam_player = $InterpolatedCamera
#onready var cam_player = $"Player/Camera"
var current: bool


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_T:
			print("T was pressed")

func _init():
	pass

func _ready():
	var Character = load("res://src/Movement/creature.gd")
	var character_node = Character.new()
	character_node.print_all()
	
	if !cam_world.current && !cam_player.current:
		cam_world.current = true
		current = true


func _process(_delta):
	if Input.is_action_pressed("move_left"):
		print("T was pressed move_left")
		
	if Input.is_action_just_pressed("ui_camera"):
		if cam_world.current:
			cam_world.current = false
			cam_player.current = true
		else:
			cam_world.current = true
			cam_player.current = false
