extends KinematicBody

export (float) var SPEED = 2.5
export (float) var VIEW  = 50

var beckon_pos = Vector3(0,0,0)
var direction = Vector3(0,0,0)

func _ready():
	var clone = $Body.material_override.duplicate()
	clone.albedo_color=Color(rand_range(0,255)/255,rand_range(0,255)/255,rand_range(0,255)/255)
	$Body.material_override = clone
	# scale = Vector3(rand_range(0.2, 2), rand_range(0.2, 2), rand_range(0.2, 2))
	
	$AnimationPlayer.play("Fish")
	
	randomPoint()

func _physics_process(delta):
	if translation.x > 15:
		queue_free()
	if translation.z > 15:
		queue_free()

	if translation.distance_to(beckon_pos) > SPEED*0.5:
		beckon(direction)
	else:
		randomPoint()
		
func beckon(point):
	move_and_slide(point)
		
func randomPoint():
	beckon_pos.x = rand_range(VIEW*-1, VIEW)
	beckon_pos.z = rand_range(VIEW*-1, VIEW)
	beckon_pos.y = -2.894
	
	direction = (beckon_pos-translation).normalized() * SPEED
	look_at(beckon_pos, Vector3(0, 1, 0))

func OnMeDeceived(pos):
	beckon_pos = pos
	beckon_pos.y = -2.894
	direction = (beckon_pos-translation).normalized() * SPEED
	look_at(beckon_pos, Vector3(0, 1, 0))
