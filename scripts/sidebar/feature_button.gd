extends Node2D

signal selectionChanged(featureId: int, iconId: int)
signal focusChanged(inFocus: bool, featureId: int, iconId: int)

@export var featureId: int
@export var iconId: int

@onready var iconNode: TextureRect = $Background/Icon

var featurePaths := [
	[
	"res://assets/sidebar/eyes_1_shadow.png",
	"res://assets/sidebar/eyes_2_shadow.png",
	"res://assets/sidebar/eyes_3_shadow.png",
	"res://assets/sidebar/eyes_4_shadow.png"
	],
	[
	"res://assets/sidebar/nose_1_shadow.png",
	"res://assets/sidebar/nose_2_shadow.png",
	"res://assets/sidebar/nose_3_shadow.png",
	"res://assets/sidebar/nose_4_shadow.png"
	],
	[
	"res://assets/sidebar/mouth_1_shadow.png",
	"res://assets/sidebar/mouth_2_shadow.png",
	"res://assets/sidebar/mouth_3_shadow.png",
	"res://assets/sidebar/mouth_4_shadow.png"
	]
]

func _ready() -> void:
	iconNode.texture = load(featurePaths[featureId][iconId])

func _on_background_pressed() -> void:
	selectionChanged.emit(featureId, iconId)

func changeFeature(id):
	featureId = id
	iconNode.texture = load(featurePaths[featureId][iconId])

func _on_background_mouse_entered() -> void:
	focusChanged.emit(true, featureId, iconId)

func _on_background_mouse_exited() -> void:
	focusChanged.emit(false, featureId, iconId)
