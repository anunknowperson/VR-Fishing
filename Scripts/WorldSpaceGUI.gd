extends MeshInstance

export (NodePath) var gui_viewport_path;

var gui_viewport = null;

var num_fishs = 9

var fishs = []

var texts = [
	"Окунь - cамый яркий и активный хищник. Окуни редко имеют крупные размеры. Они живут стайно, причем чем меньше особи, тем крупнее стая.",
	"Налим - это единственный представитель тресковых видов рыб, который способен жить в пресной воде.",
	"Голавль - рыбы предпочитает жить на каменистом дне и не любит ил, грязь. Питается  личинками, червями и насекомыми, которые падают в воду.",
	"Щука - яркий представитель хищников. Взрослые рыбы вырастают весом до 16 кг, но встречаются и гиганты до 25 кг. Отличительная черта щуки - наличие мелких острых зубов и высоко посаженных глаз. Окраска щуки серая, что позволяет ей оставаться незамеченной в глубине вод. При этом цвет тела тех рыб, что живут на глубине намного темнее, чем у тех, что плавают на поверхности.",
	"Судак- это еще один представитель хищных видов рыб. Он предпочитает жить в одиночестве, и только в молодости сбивается в небольшие стайки ради удачной охоты. Хищник проявляет активность круглосуточно, в любое время года. Днем он предпочитает прятаться в ямах, а ночью подниматься на поверхность.",
	"Окунь- самый яркий и активный хищник. Окуни редко имеют крупные размеры. Они живут стайно, причем чем меньше особи, тем крупнее стая. В еде рыба неприхотлива: хищник не брезгует никакой белковой пищей (червями, личинками или мелкой рыбешкой). Окунь уничтожает мелочь, которая очень часто досаждает рыбакам. Поэтому в некоторые пруды его запускают специально, чтобы избавить водоем от малоценной с точки зрения промысла.",
	"Ерш. Этот хищник является самым прожорливым. Оно охотится круглые сутки и в любое время года. Живет хищник повсеместно даже в тех водоемах, где вода очень грязная. Ерш плохо реагирует на повышение температуры воды и отсутствие в ней достаточного количества кислорода. В таких условиях он быстро погибает.",
	"Сом- это хищные рыбы, которые ведут ночной образ жизни. Они питаются как мелкими, так и крупными рыбешками. Их широкая пасть позволяет им проглотить рыб большого размера.",
	"Пираньи- эти маленькие рыбки проживают в реках Южной Америки и странах с теплым климатом. В России они также могут успешно выживать в водоемах, куда их выбрасывают недобросовестные аквариумисты."
]

#var pic1 :Texture = preload("res://FishPic/1.webp")
#var pic2 :Texture = preload("res://FishPic/2.webp")
#var pic3 :Texture = preload("res://FishPic/3.webp")
#
#var txt1 := "Окунь - cамый яркий и активный хищник. Окуни редко имеют крупные размеры. Они живут стайно, причем чем меньше особи, тем крупнее стая."
#var txt2 := "Налим - это единственный представитель тресковых видов рыб, который способен жить в пресной воде."
#var txt3 := "Голавль - рыбы предпочитает жить на каменистом дне и не любит ил, грязь. Питается  личинками, червями и насекомыми, которые падают в воду."

func _ready():
	
	for i in range(0,num_fishs):
		if i == 9:
			fishs[i] = load("res://FishPic/"+str(i)+".jpeg")
		else:
			fishs[i] = load("res://FishPic/"+str(i)+".webp")
	
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
	var num = int(rand_range(0,num_fishs))
	
	$Viewport/Control/TextureRect.texture = fishs[num]
	$Viewport/Control/Description.text = texts[num]
		
	_ready()
