extends Node2D

signal selectionChanged(featureId: int, iconId: int)

@export var featureId: int
@export var iconId: int

@onready var iconNode: TextureRect = $TextureButton/Background/Icon

var featurePaths := [
	[
	"res://assets/pumpkin/eyes_1.png",
	"res://assets/pumpkin/eyes_2.png",
	"res://assets/pumpkin/eyes_3.png",
	"res://assets/pumpkin/eyes_4.png"
	],
	[
	"res://assets/pumpkin/nose_1.png",
	"res://assets/pumpkin/nose_2.png",
	"res://assets/pumpkin/nose_3.png",
	"res://assets/pumpkin/nose_4.png"
	],
	[
	"res://assets/pumpkin/mouth_1.png",
	"res://assets/pumpkin/mouth_2.png",
	"res://assets/pumpkin/mouth_3.png",
	"res://assets/pumpkin/mouth_4.png"
	]
]

func _ready() -> void:
	iconNode.texture = load(featurePaths[featureId][iconId])

func changeFeature(id):
	featureId = id
	iconNode.texture = load(featurePaths[featureId][iconId])
	iconNode.position.y = -6.5 - featureId * 6.5

func _on_texture_button_pressed() -> void:
	selectionChanged.emit(featureId, iconId)
