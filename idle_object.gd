extends Node2D


@export var min_distance = 350
@export var max_distance = 600
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var pivot: Marker2D = $Pivot
@export var move_speed = 600
@onready var chasing_timer: Timer = $ChasingTimer

const DEFUALT_DELTA = 1/60

#func _on_chasing_timer_timeout() -> void:
	#var mouse_position = DisplayServer.mouse_get_position()
	#var viewport_center = DisplayServer.window_get_position() + Vector2i(get_viewport_rect().size / 2)
	#var distance_from_mouse :Vector2 = mouse_position - viewport_center
	#var length = distance_from_mouse.length()
	#
	#print(length)
	#
	#if length >= distance:
		#animation_player.play("move")
		#move_toward_mouse(DEFUALT_DELTA)
	#else:
		#animation_player.stop()

@onready var drag_area_2d: Area2D = $DragArea2D

func _physics_process(delta: float) -> void:
	var mouse_position = DisplayServer.mouse_get_position()
	var viewport_center = DisplayServer.window_get_position() + Vector2i(get_viewport_rect().size / 2)
	var distance_from_mouse :Vector2 = mouse_position - viewport_center
	var length = distance_from_mouse.length()
	
	#print(length)
	
	if drag_area_2d.dragging:
		animation_player.play("shake")
		return

	
	if length >= max_distance:
		animation_player.play("move")
		move_toward_mouse(delta)
	elif length <= min_distance:
		animation_player.play("move")
		move_against_mouse(delta)
	else:
		animation_player.play("move_tantacle")
		
		#animation_player.stop()



func move_toward_mouse(delta):
	var mouse_position = DisplayServer.mouse_get_position()
	var viewport_center = DisplayServer.window_get_position() + Vector2i(get_viewport_rect().size / 2)
	
	var rot = Vector2(viewport_center).angle_to_point(mouse_position)
	pivot.rotation = rot + PI

	var direction = Vector2(mouse_position - viewport_center).normalized()
	DisplayServer.window_set_position(DisplayServer.window_get_position() + Vector2i(direction * move_speed * delta))


func move_against_mouse(delta):
	var mouse_position = DisplayServer.mouse_get_position()
	var viewport_center = DisplayServer.window_get_position() + Vector2i(get_viewport_rect().size / 2)
	
	var rot = Vector2(viewport_center).angle_to_point(mouse_position)
	pivot.rotation = rot 

	var direction = Vector2(viewport_center - mouse_position).normalized()
	DisplayServer.window_set_position(DisplayServer.window_get_position() + Vector2i(direction * move_speed * delta))
