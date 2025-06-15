extends Area2D

@export var mouse_test : bool = false
@export var is_mouse_in :bool = false
@onready var label: Label = $Label

var dragging = false


# 监听全局输入事件
func _input(event: InputEvent):

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_mouse_in:
				dragging = true

		# 鼠标左键释放
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			dragging = false

func _physics_process(delta: float) -> void:
	if dragging:
		#var mouse_position :Vector2= DisplayServer.mouse_get_position()
		#mouse_position.x += 0.5 * get_viewport_rect.
		#+ 1/2 * get_viewport_rect().
		DisplayServer.window_set_position(DisplayServer.mouse_get_position() - Vector2i(0.5*get_viewport_rect().size))
		
		#print("Mouse Position:%s \n Window Position" % [get_global_mouse_position(), DisplayServer.window_get_position()])
		#get_parent().global_position = get_global_mouse_position()



func _on_mouse_entered() -> void:
	if mouse_test:
		label.show()
		is_mouse_in = true
		print(is_mouse_in)
		


func _on_mouse_exited() -> void:
	if mouse_test:
		is_mouse_in = false
		label.hide()
		print(is_mouse_in)
