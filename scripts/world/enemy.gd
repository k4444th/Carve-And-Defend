extends CharacterBody2D

var speed = 150
var destination: Node2D

@onready var navigationAgentNode: NavigationAgent2D = $NavigationAgent2D

func _physics_process(_delta: float) -> void:
	var direction = to_local(navigationAgentNode.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()

func makePath():
	navigationAgentNode.target_position = destination.global_position

func _on_navigation_agent_2d_target_reached() -> void:
	queue_free()
