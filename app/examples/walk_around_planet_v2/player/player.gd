extends RigidBody


var gravity_direction = Vector3()
var move_force = 3000
var jump_force = 2000
#planets will set this value for you (check the planet script)
var planet_name = "Space"


func _ready():
	_calc_gravity_direction("Earth")


func _physics_process(delta):
	if planet_name != "Space":
		_calc_gravity_direction(planet_name)
	_move(delta)


func _integrate_forces(state):
	_walk_around_planet(state)


func _calc_gravity_direction(planet):
	gravity_direction = (get_parent().get_node(planet).global_transform.origin - global_transform.origin).normalized()


func _walk_around_planet(state):
	# allign the players y-axis (up and down) with the planet's gravity direciton:
	state.transform.basis.y = -gravity_direction


func _move(delta):
	#handles all input and logic related to character movement
	#move
	if Input.is_action_pressed("movement_forward"):
		add_central_force(delta * move_force * global_transform.basis.z)
	
	if Input.is_action_pressed("movement_backward"):
		add_central_force(delta * move_force * -global_transform.basis.z)
	
	if Input.is_action_pressed("movement_left"):
		add_central_force(delta * move_force * global_transform.basis.x)
	
	if Input.is_action_pressed("movement_right"):
		add_central_force(delta * move_force * -global_transform.basis.x)
	
	#jump:
	if Input.is_action_just_pressed("movement_jump"):
		apply_impulse(Vector3.UP, delta * jump_force * global_transform.basis.y)


func set_planet_name(n):
	print ("setting new planet: ", n)
	planet_name = n
