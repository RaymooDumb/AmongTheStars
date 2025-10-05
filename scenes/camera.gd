extends Camera2D

@export var player : CharacterBody2D
#@export var portrait : AnimatedSprite2D
#@export var side : Sprite2D
#@export var bg : Sprite2D
@export var movement : bool
#@export var canvas : CanvasLayerw


func physics_process():
	if player and movement == true:
		global_position = player.global_position + Vector2(0, 0)
	
	#portrait.global_position = global_position + Vector2(0, -35)
	#side.global_position = global_position + Vector2(0, 0)
	#bg.global_position = global_position
