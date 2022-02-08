class_name ActionMapClass #extends InputMap


#var _action: String
#var _code = []
#var _input_event_key = [null, null]
#var _input_event_action = [null, null]

#var _input_event = {
#	"key":    InputEventKey,
#	"action": InputEventAction
#}


#func _init(action=null, deadzone=0.5, code=[]).(action, deadzone):
#func _init():
	#._init()
	#pass
#	_action = action
#	_code = code
#	var input_event_key    = [null, null]
#	var input_event_action = [null, null]
#
#	InputMap.add_action(action)
#
#	for i in len(code):
#		#InputEventJoypadButton
#		input_event_action[i] = InputEventAction.new()
#		input_event_action[i].action = action
#
#		input_event_key[i] = InputEventKey.new()
#		input_event_key[i].scancode = code[i]
#
#		InputMap.action_add_event(action, input_event_key[i])


func add_action(action: String, code=[]) -> void:
	#.add_action(action)
	var input_event_key    = [null, null]
	var input_event_action = [null, null]
	
	if !InputMap.has_action(action):
		InputMap.add_action(action)
	
	for i in len(code):
		#InputEventJoypadButton
		input_event_action[i] = InputEventAction.new()
		input_event_action[i].action = action
		
		input_event_key[i] = InputEventKey.new()
		input_event_key[i].scancode = code[i]
		
		InputMap.action_add_event(action, input_event_key[i])
	
	return
	#.add_action(action)
	
#move_forward={
#"deadzone": 0.5,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":87,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":90,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777232,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":12,"pressure":0.0,"pressed":false,"script":null)
#, Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":0,"axis":1,"axis_value":-1.0,"script":null)
# ]
#}
#move_back={
#"deadzone": 0.5,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":83,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777234,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":13,"pressure":0.0,"pressed":false,"script":null)
#, Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":0,"axis":1,"axis_value":1.0,"script":null)
# ]
#}
#move_left={
#"deadzone": 0.51,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":65,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":81,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777231,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":14,"pressure":0.0,"pressed":false,"script":null)
#, Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":0,"axis":0,"axis_value":-1.0,"script":null)
# ]
#}
#move_right={
#"deadzone": 0.5,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":68,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777233,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":15,"pressure":0.0,"pressed":false,"script":null)
#, Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":0,"axis":0,"axis_value":1.0,"script":null)
# ]
#}
#toggle_mouse_capture={
#"deadzone": 0.5,
#"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777253,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
#, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777217,"physical_scancode":0,"unicode":0,"echo":false,"script":null)
# ]
#}
