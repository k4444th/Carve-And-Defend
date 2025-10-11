extends CharacterBody2D

var speed = 100

@export var destination: Node2D
@onready var navigationAgent: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	makePath()

func _physics_process(_delta: float) -> void:
	var direction = to_local(navigationAgent.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()

func makePath():
	navigationAgent.target_position = destination.global_position
