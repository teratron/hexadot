extends Camera


const MOUSE_SENSITIVITY = 0.002
const MOVE_SPEED = 0.6

var action        = preload("res://src/World/action.gd").new()
#var move_forward  = action.new("move_forward",  [KEY_W, KEY_UP])
#var move_backword = action.new("move_backword", [KEY_S, KEY_DOWN])
#var move_left     = action.new("move_left",     [KEY_A, KEY_LEFT])
#var move_right    = action.new("move_right",    [KEY_D, KEY_RIGHT])
var move_forward  = action.add_action("move_forward",  [KEY_W, KEY_UP])
var move_backword = action.add_action("move_backword", [KEY_S, KEY_DOWN])
var move_left     = action.add_action("move_left",     [KEY_A, KEY_LEFT])
var move_right    = action.add_action("move_right",    [KEY_D, KEY_RIGHT])
var move_up       = action.add_action("move_up",       [KEY_SPACE])
var move_down     = action.add_action("move_down",     [KEY_SHIFT])

var rotate         = Vector3()
var velocity       = Vector3() 


func _ready():
	print(action)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	# Mouse look (only if the mouse is captured).
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# Horizontal mouse look.
		rotate.y -= event.relative.x * MOUSE_SENSITIVITY
		# Vertical mouse look.
		rotate.x = clamp(rotate.x - event.relative.y * MOUSE_SENSITIVITY, -1.57, 1.57)
		transform.basis = Basis(rotate)

	if event.is_action_pressed("toggle_mouse_capture"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta):
	var motion = Vector3(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_up") - Input.get_action_strength("move_down"),
		Input.get_action_strength("move_backword") - Input.get_action_strength("move_forward")
	)

	# Normalize motion to prevent diagonal movement from being
	# `sqrt(2)` times faster than straight movement.
	motion = motion.normalized()

	velocity += MOVE_SPEED * delta * transform.basis.xform(motion)
	velocity *= 0.85
	translation += velocity
