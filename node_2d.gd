extends Node2D

@export var punto = Vector2(200, 150) # Coordenadas del punto
func mydraw(point):
	draw_circle(point, 5, Color(1, 1, 0))
func _draw():
	draw_circle(punto, 5, Color(1, 1, 0)) # Radio 5, color amarillo

func _ready():
	queue_redraw() # Fuerza que se llame a _draw()
