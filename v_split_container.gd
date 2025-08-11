extends VSplitContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var window_size = get_viewport().get_visible_rect().size
	custom_minimum_size.y=window_size.y/3
	pass
