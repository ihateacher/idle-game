extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#透明背景
	get_tree().root.set_transparent_background(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
