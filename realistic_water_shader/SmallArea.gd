extends Area

onready var fakefish = preload("res://Scenes/FakeFish.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SmallArea_body_entered(body):
	if body.has_method('OnMeDeceived'):
		var f = fakefish.instance()
		body.get_parent().add_child(f)
		f.translation = body.translation
		
		var vect = ($"../../../Boat/ARVROrigin/ARVRController".get_global_transform().origin - f.translation).normalized() * 10
		
		vect.y *= 1.3
		
		f.linear_velocity = vect
		
		body.queue_free()
