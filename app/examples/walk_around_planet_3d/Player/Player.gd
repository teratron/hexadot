extends KinematicBody


var vel = Vector3()
const MAX_SLOPE_ANGLE = 40
var planet
var speed = 500


func _ready():
	planet = get_parent().get_node("Planet")


func _process(delta):
#Movement:
	vel = Vector3()	
	if Input.is_action_pressed("movement_forward"):
		vel -= transform.basis.y
	if Input.is_action_pressed("movement_backward"):
		vel += transform.basis.y
	if Input.is_action_pressed("movement_left"):
		vel += transform.basis.x
	if Input.is_action_pressed("movement_right"):
		vel -= transform.basis.x 
	
	vel *= speed * delta
	vel  = move_and_slide(vel, get_gravity_dir_vector(), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE), false)
	
	#Rotation!
	#Main robust solution
	transform = transform.orthonormalized()
	if transform.basis.y.normalized().cross(get_gravity_dir_vector()) != Vector3():
		look_at(planet.global_transform.origin, transform.basis.y)
	elif transform.basis.x.normalized().cross(get_gravity_dir_vector()) != Vector3():
		look_at(planet.global_transform.origin, transform.basis.x)
	
	# One line solution, this works too:
#	look_at(planet.global_transform.origin, transform.basis.x)


func get_gravity_dir_vector():
	
	return (planet.transform.origin - transform.origin).normalized()
