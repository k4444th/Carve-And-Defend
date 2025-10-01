extends Node2D

@export var iconPath: Resource

@onready var icon: TextureRect = $Background/Icon

func _ready() -> void:
	icon.texture = iconPath
	
