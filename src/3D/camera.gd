extends Camera


func _process(delta):
	look_at($'../Player'.translation, Vector3(0,1,0))
