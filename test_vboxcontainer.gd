extends Control
var texture_size
var texture_size2 
var tex1
var tex2
var tex3
var tex4
var info1
var score1
var info2
var score2
var info3
var score3
var info4
var score4
#@export var punto1 = Vector2(20, 20) # Coordenadas del punto
#@export var punto2 = Vector2(1000, 495) # Coordenadas del punto
#@export var punto3 = Vector2(982, 313) # Coordenadas del punto

func _ready() -> void:
	draw_avatars()
	get_viewport().size_changed.connect(_on_window_size_changed)

#func _draw():
#	draw_circle(punto1, 5, Color(1, 0, 0)) # Radio 5, color amarillo
#	draw_circle(punto2, 5, Color(1, 1, 0)) # Radio 5, color amarillo
	#draw_circle(punto3, 5, Color(1, 1, 0)) # Radio 5, color amarillo

func draw_avatars() -> void:
	tex1 = $Avatar1
	tex2 = $Avatar2
	tex3 = $Avatar3
	tex4 = $Avatar4
	info1 = $info1
	score1 = $score1
	info2 = $info2
	score2 = $score2
	info3 = $info3
	score3 = $score3
	info4 = $info4
	score4 = $score4
	
	var window = get_window()
	#var size1=info1.size
	var label_size=Vector2(100.0, 100.0)
	
	#info1.size=Vector2(100.0, 100.0)
	var labels=[info1,score1,info2,score2,info3,score3,info4,score4]
	for label in labels:
		label.set_size(label_size)
		label.add_theme_font_size_override("font_size", 20*window.size.length()/1000)
	#score1.add_theme_font_size_override("font_size", 20*window.size.length()/1000)
	print(score1.size,score2.size)
	texture_size = tex1.texture.get_size()
	
	var texs=[tex1,tex2,tex3,tex4]
	for tex in texs:
		tex.size.y = window.size.y/4
		tex.size.x = texture_size.x*tex.size.y/texture_size.y
	
	tex1.position = Vector2(20, 20) 
	tex2.position = Vector2(window.size.x-tex2.size.x-20, 20) 
	
	var bottom_center = tex1.position + Vector2(tex1.size.x / 2, tex1.size.y)
		
	var offset_i = Vector2(0,20*window.size.length()/1000)
	var offset_s = Vector2(0,60*window.size.length()/1000)
	info1.position= bottom_center+offset_i-info1.size/2
	score1.position= bottom_center+offset_s-score1.size/2
	
	var bottom_center2 = tex2.position + Vector2(tex2.size.x / 2, tex2.size.y)
	#print(tex1.position,tex2.position)
	#print(bottom_center,bottom_center2)
	#print(info2.size/2,info1.size/2)
	info2.position= bottom_center2+offset_i-info2.size/2
	score2.position= bottom_center2+offset_s-score2.size/2
	#var j=0
	#for i in range(2):
		#var tex=texs[i]
		#var info_label=labels[j]
		#var score_label=labels[j+1]
		#info_label.position = bottom_center + offset_i - info_label.size / 2
		#score_label.position = bottom_center + offset_s - score_label.size / 2
		#j+=2
	
	
	#var offset_i3 = Vector2(0,-60*window.size.length()/1000)
	#var offset_s3 = Vector2(0,-20*window.size.length()/1000)
	score3.position=Vector2(score2.position.x,window.size.y-score3.size.y/2-20*window.size.length()/1000)
	info3.position=Vector2(score2.position.x,score3.position.y-score3.size.y/2-20*window.size.length()/1000)
	tex3.position = Vector2(tex2.position.x,info3.position.y+info3.size.y/2-tex3.size.y-20*window.size.length()/1000)#-20*window.size.length()/1000
	
	score4.position=Vector2(score1.position.x+score1.size.x/2-score4.size.x/2,score3.position.y)
	info4.position=Vector2(score1.position.x+score1.size.x/2-info4.size.x/2,info3.position.y)
	tex4.position = Vector2(tex1.position.x,tex3.position.y)
	
	#var point = Vector2(200, 150)
	#draw_circle(point, 5, Color(1, 1, 0))
	#$Node2D.mydraw(Vector2(200,200))
	#print(score1.position,score2.position)
	#print(window.size.y," ",tex3.position.y," ",info3.position.y," ",info3.size.y/2," ",tex3.size.y/2," ",-20*window.size.length()/1000)
	print(info3.position," | ",tex3.position)
	#punto1=info4.position
	#punto2=tex3.position
	#_draw()
	#compare_all_properties($score1,$score2)
	
	#for i in range(2,4):
		#var tex=texs[i]
		#var bottom_center = tex.position + Vector2(tex.size.x / 2, tex.size.y)
		#var info_label=labels[j]
		#var score_label=labels[j+1]
		#info_label.position = bottom_center + offset_i - info_label.size / 2
		#score_label.position = bottom_center + offset_s - score_label.size / 2
		#j+=2
	#tex3.position = Vector2(window.size.x-tex2.size.x-20, window.size.y-tex2.size.y-20) 
	#tex4.position = Vector2(20, window.size.y-tex2.size.y-20 ) 
	
func _on_window_size_changed():
	draw_avatars()
