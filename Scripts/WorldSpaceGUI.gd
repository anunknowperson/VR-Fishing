extends MeshInstance

# An exported NodePath to the Viewport node to use for the VR GUI.
# (NOTE: because this NodePath is exported, you will need to set it in the Godot editor!)
export (NodePath) var gui_viewport_path;
# A variable to hold a reference to the Viewport used for the VR GUI.
var gui_viewport = null;

var pic1 :Texture = preload("res://FishPic/1.webp")
var pic2 :Texture = preload("res://FishPic/2.webp")
var pic3 :Texture = preload("res://FishPic/3.webp")

var txt1 := "Окунь - cамый яркий и активный хищник. Окуни редко имеют крупные размеры. Они живут стайно, причем чем меньше особи, тем крупнее стая."
var txt2 := "Налим - это единственный представитель тресковых видов рыб, который способен жить в пресной воде."
var txt3 := "Голавль - рыбы предпочитает жить на каменистом дне и не любит ил, грязь. Питается  личинками, червями и насекомыми, которые падают в воду."

func _ready():
	# Get the viewport at the exported NodePath and assign it to gui_viewport
	gui_viewport = get_node(gui_viewport_path)
	# Wait two frames so the Viewport node has time to initialize and render to a texture
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	
	# Create a new SpatialMaterial
	var material = SpatialMaterial.new()
	# Tell the material to render unshaded
	material.flags_unshaded = true
	# Get the Viewport texture from the Viewport node and assign as as the albedo texture
	# in the SpatialMaterial
	material.albedo_texture = gui_viewport.get_texture()
	# Tell the material to use transparency
	material.flags_transparent = true
	# Finally, set the material of the MeshInstance to the newly created SpatialMaterial so the
	# contents of the Viewport are visible
	set_surface_material(0, material)



func _on_Area_body_entered(body):
	var num = int(rand_range(0, 2))
	
	if num == 0:
		$Viewport/Control/TextureRect.texture = pic1
		$Viewport/Control/Description.text = txt1
	elif num == 1:
		$Viewport/Control/TextureRect.texture = pic2
		$Viewport/Control/Description.text = txt2
	elif num == 2:
		$Viewport/Control/TextureRect.texture = pic3
		$Viewport/Control/Description.text = txt3
		
	_ready()
