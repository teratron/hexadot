extends Spatial


# Declare member variables here. Examples:
# var a = 2
#var cam := Camera.new()


func _init():
	#cam = Node.new($Camera)
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	#self.add_child(cam, false)
	print(add_camera("Camera 1"))
	print(add_interpolated_camera("InterpolatedCamera 4", true))


func add_camera(name: String = "Camera", current: bool = false) -> Camera:
	var camera = Camera.new()
	
	camera.name = name
	camera.current = current
	
	self.add_child(camera, true)
	return camera


func add_interpolated_camera(name: String = "InterpolatedCamera", current: bool = false) -> InterpolatedCamera:
	var camera = InterpolatedCamera.new()
	
	camera.name = name
	camera.target = NodePath("")
	camera.speed = 1
	camera.enabled = true
	camera.current = current
	
	self.add_child(camera, true)
	return camera


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _ready():
#func _init():
#func _process(delta):
#	pass
