extends CharacterBody2D

@export var propulsion_force := 100.0
@export var max_speed := 200.0
@export var oxygen_consumption := 10.0
@export var oxygen_amount := 1000.0

#var velocity := Vector2.ZERO

func _physics_process(delta): # Esta chido
	if oxygen_amount > 0:
		propulsion()
	
	velocity = velocity.lerp(Vector2.ZERO, 0.01 * delta)
	velocity = velocity.limit_length(max_speed)
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	
	move_and_slide()

func propulsion(): # Falta poner animacion de eso que tiras
	if Input.is_action_just_pressed("click"):
		
		var mouse_pos = get_global_mouse_position()
		var direction_to_mouse = (mouse_pos - global_position).normalized()
		
		var propulsion_direction = -direction_to_mouse
		velocity += propulsion_direction * propulsion_force
		
		oxygen_amount = max(0, oxygen_amount - oxygen_consumption)
		
		updateOxygenUI()

func updateOxygenUI(): # Cuando lo haga
	pass

func addOxygen(amount: float): 
	oxygen_amount += amount
	updateOxygenUI()

func _on_area_2d_body_entered(body): # Esto agarra oxigeno para cuando lo haga
	if body.is_in_group("oxygen"):
		addOxygen(20.0)
		body.queue_free()

# Colisión con enemigos (manteniendo tu código original)
func _on_body_entered(body):
	if body.is_in_group("enemy"):
		# SignalBus.emit_signal("player_died")
		print("Player died!")
