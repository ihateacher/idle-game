extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#透明背景
	get_tree().root.set_transparent_background(true)

	#var points = PackedVector2Array([
	#Vector2(0, 0),
	#Vector2(1000, 0),
	#Vector2(1000, 1000),
	#Vector2(0, 1000)
#])
#
	#DisplayServer.window_set_mouse_passthrough(points)
#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
