extends MeshInstance


const SPEED = 10


func _ready():
	pass


func _process(delta):
	#rotation.y += 0.1
	#rotate(Vector3(0,1,0), 0.1)
	#rotate_x(0.2)
	#rotate_y(0.1)
	#rotate_z(0.05)
	
	#translation.z -= 0.05
	#translate(Vector3(0,0,-0.05))
	
	var dir = Vector3()
	
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	elif Input.is_action_pressed("ui_right"):
		dir.x = 1
	
	if Input.is_action_pressed("ui_up"):
		dir.z = -1
	elif Input.is_action_pressed("ui_down"):
		dir.z = 1
		
	if dir:
		translate(SPEED * dir * delta)
		
		
		
