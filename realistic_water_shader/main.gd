extends Node

onready var fakefish = preload("res://Scenes/FakeFish.tscn")

var catched := true
var body

func _ready():
	randomize()
	
	var VR = ARVRServer.find_interface("OpenVR")
	if VR and VR.initialize():
		get_viewport().arvr = true

		OS.vsync_enabled = false
		Engine.target_fps = 90
		# Also, the physics FPS in the project settings is also 90 FPS. This makes the physics
		# run at the same frame rate as the display, which makes things look smoother in VR!

func _on_SmallArea_onFish(body):
	self.body = body
	$LoseTimer.start()
	catched = false
	$Boat/ARVROrigin/ARVRController2.set_rumble(1.0)


func _on_Spatial_CATCH():
	if catched:
		return
	
	catched = true
	
	var f = fakefish.instance()
	add_child(f)
		
	f.get_child(1).material_override = body.get_child(1).material_override
		
	f.translation = body.translation
		
	var vect = ($Boat/ARVROrigin/ARVRController.get_global_transform().origin - f.translation).normalized() * 2.5
		
	vect.y *= 6
		
	f.linear_velocity = vect
	
	body.queue_free()
	
	$Boat/ARVROrigin/ARVRController2.set_rumble(0)
	
	$GetFishSound.play()
	$GetFishSound/DisableTimer.start()


func _on_LoseTimer_timeout():
	catched = true
	$Boat/ARVROrigin/ARVRController2.set_rumble(0)


func _on_DisableTimer_timeout():
	$GetFishSound.playing = false
