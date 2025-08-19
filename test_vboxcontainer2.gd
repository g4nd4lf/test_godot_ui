extends Control
var texture_size
var texture_size2 
var tex
var tex2

var info1
var score1
var info2
var score2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#tex = $VBoxContainer  # referencia a tu TextureRect
	#tex2 = $VBoxContainer2
	draw_avatars()
	get_viewport().size_changed.connect(_on_window_size_changed)

	pass # Replace with function body.

func draw_avatars() -> void:
	tex = $TextureRect
	tex2 = $TextureRect2
	info1 = $info1
	score1 = $score1
	info2 = $info2
	score2 = $score2
	var window = get_window()
	var mode=window.mode
	#var screen_usable = DisplayServer.screen_get_usable_rect()
	#var window_size = window.size
	var window_size = window.size
	texture_size = tex.texture.get_size()
	texture_size2 = tex2.texture.get_size()
	
	tex.size.y = window.size.y/4
	tex.size.x = texture_size.x*tex.size.y/texture_size.y
	
	tex2.size.y = window.size.y/4
	tex2.size.x = texture_size2.x*tex2.size.y/texture_size2.y
	print(tex.size)
	print(tex2.size)
	
	# Anclar a la esquina superior izquierda
	tex.anchor_left = 0.0
	tex.anchor_top = 0.0
	tex.anchor_right = 0.0
	tex.anchor_bottom = 0.0
	
	# Anclar a la esquina superior izquierda
	#tex2.anchor_left = 0.0
	#tex2.anchor_top = 0.0
	#tex2.anchor_right =0.0
	#tex2.anchor_bottom = 0.0
	
	# Posición relativa a su padre (un nodo Control)
	tex.offset_left = 20
	tex.offset_top = 20
	tex2.position = Vector2(window.size.x-tex2.size.x-20, 20) 
	
	var bottom_center = tex.position + Vector2(tex.size.x / 2, tex.size.y)
	var bottom_center2 = tex2.position + Vector2(tex2.size.x / 2, tex2.size.y)
	var offset_i1 = Vector2(0,20*window.size.length()/1000)
	var offset_s1 = Vector2(0,60*window.size.length()/1000)
	
	info1.add_theme_font_size_override("font_size", 20*window.size.length()/1000)
	score1.add_theme_font_size_override("font_size", 20*window.size.length()/1000)
	
	info1.position = bottom_center + offset_i1 - info1.size / 2
	score1.position = bottom_center + offset_s1 - score1.size / 2
	info2.position = bottom_center2 + offset_i1 - info2.size / 2
	score2.position = bottom_center2 + offset_s1 - score2.size / 2
	
	#info1.position.x = bottom_center.x
	#info1.position.y = bottom_center.y+20
	#tex2.offset_left = 100
	#tex2.offset_top = 100
	#tex.position = Vector2(20, 20)  # X=100, Y=50
	# Tamaño
	#tex.size.y = tex.size.y/5
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_window_size_changed():
	
	draw_avatars()
	## Detectar "maximización" por tamaño
	#var is_large = (window_size.x >= screen_usable.size.x * 0.8 and 
				   #window_size.y >= screen_usable.size.y * 0.8)
	##var modes=[Window.MODE_MAXIMIZED,Window.MODE_FULLSCREEN]
	#if is_large:
		#print("Ventana maximizada!")
		## Hacer algo cuando se maximiza
		#_on_maximized()
	#else:
		#print("Ventana no está maximizada")
		#_on_not_maximized()
		
func _on_maximized():
	pass	
func _on_not_maximized():
	pass
