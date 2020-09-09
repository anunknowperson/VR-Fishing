extends ARVRController


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_object :RigidBody
var is_holding = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if is_holding and current_object != null:
		current_object.transform = get_global_transform()
		current_object.scale = Vector3(0.5, 0.5, 0.5)
		current_object.linear_velocity = Vector3()

func _on_Area_body_entered(body):
	if !body.has_method("imfish"):
		return
	
	current_object = body

func _on_ARVRController_button_pressed(button):
	if button == 2:
		is_holding = true


func _on_ARVRController_button_release(button):
	if button == 2:
		is_holding = false
