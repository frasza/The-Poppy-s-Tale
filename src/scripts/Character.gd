extends KinematicBody2D

signal animate

export var speed: int = 500
export var gravity: int = 4000
export var jump_force: int = 2000
export var boost_multiplier: float = 1.5

var movement: Vector2 = Vector2.ZERO
var is_alive: bool = true
var is_attacking: bool = false

onready var sprite: Sprite = get_node("Sprite")
onready var weapon: Position2D = sprite.get_node("Weapon")


func _physics_process(delta: float) -> void:
	apply_gravity()
	move()
	jump()
	animate()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("attack") and is_on_floor() and is_alive:
		is_attacking = true


func move():
	var direction = get_direction()
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right") and is_alive:
		movement.x = -speed
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left") and is_alive:
		movement.x = speed
	else:
		movement.x = 0
	
	# Flip based on direction
	if direction.x != 0 and is_alive:
		sprite.scale.x = 1 if direction.x > 0 else -1
	
	movement = move_and_slide(movement, Vector2.UP)


func get_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1 if is_on_floor() and Input.is_action_just_pressed("jump") else 0
	)


func apply_gravity():
	movement.y += gravity * get_physics_process_delta_time()


func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor() and is_alive:
		is_attacking = false
		movement.y = -jump_force


func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	movement.y = -jump_force * boost_multiplier


func attack():
	is_attacking = weapon.shoot(sprite.scale.x)


func toggle_attack():
	is_attacking = not is_attacking


func hurt():
	is_alive = false
	set_collision_mask_bit(3, false)


func animate():
	emit_signal("animate", movement, is_attacking, sprite.scale.x, is_alive, is_on_floor())
