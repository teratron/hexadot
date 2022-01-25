#
class_name MovementCreature


export var Rotate = 2
export var GRAVITY = -10
export var Speed = 500
export var vel = Vector3()


var isLeft:  bool
var isRight: bool
var isUp:    bool
var isDown:  bool


var action = {
	"isLeft":  false,
	"isRight": false,
	"isUp":    false,
	"isDown":  false,
}


func _init():
	pass



func _ready():
	var im = InputMap.new()
	im.add_action("move_left")
	im.add_action("move_right")
	im.add_action("move_forward")
	im.add_action("move_back")
	#var inputEvent = InputEvent.new()
	#InputMap.action_add_event("move_left", InputEvent.button_index(KEY_T))
	pass


#func _process(delta):
#	pass

#func _input(event):
	#if event is InputEventAction:
		#match event.action:
			#"ui_up":
			#	move_and_collide(Vecto3.UP)
			#"ui_down":
			#	move_and_collide(Vecto3.DOWN)
			#"ui_right":
			#	move_and_collide(Vecto2.RIGHT) 
			#"ui_left":
			#	move_and_collide(Vecto2.LEFT)
			#_:
			#	pass


func print_all():
	print("dddddddddddddddddddddd")
