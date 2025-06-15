extends Node2D  # 或继承自Control/Node2D

var dragging = false
var drag_offset = Vector2.ZERO

@onready var label: Label = $Label
@onready var drag_area_2d: Area2D = $DragArea2D
