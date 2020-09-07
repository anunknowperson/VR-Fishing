extends KinematicBody

const SPEED = 0.5

var beckon_pos = Vector3(0,0,0)

func _ready():
	randomize()
	
	beckon_pos.x = rand_range(-5, 5)
	beckon_pos.z = rand_range(-5, 5)

func beckon(point):

	if translation.x > point.x:
		move_and_slide(Vector3(SPEED*-1,0,0))
	elif translation.x < point.x:
		move_and_slide(Vector3(SPEED,0,0))

	if translation.z > point.z:
		move_and_slide(Vector3(0,0,SPEED*-1))
	elif translation.z < point.z:
		move_and_slide(Vector3(0,0,SPEED))

func _physics_process(delta):
	if translation.distance_to(beckon_pos) > 0.5:
		beckon(beckon_pos)
	else:
		beckon_pos.x = rand_range(-5, 5)
		beckon_pos.z = rand_range(-5, 5)
