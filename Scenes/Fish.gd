extends KinematicBody

export (float) var SPEED = 2
export (float) var VIEW  = 10

var beckon_pos = Vector3(0,0,0)
var direction = Vector3(0,0,0)

func _ready():
	var clone = $Body.material_override.duplicate()
	clone.albedo_color=Color(rand_range(0,255)/255,rand_range(0,255)/255,rand_range(0,255)/255)
	$Body.material_override = clone
	
	$AnimationPlayer.play("Fish")

func _physics_process(delta):
	if translation.distance_to(beckon_pos) > SPEED*2:
		beckon(direction)
	else:
		randomPoint()
		
func beckon(point):
	move_and_slide(point)
		
func randomPoint():
	beckon_pos.x = rand_range(VIEW*-1, VIEW)
	beckon_pos.z = rand_range(VIEW*-1, VIEW)
	direction = (beckon_pos-translation).normalized() * SPEED
	look_at(beckon_pos, Vector3(0, 1, 0))
