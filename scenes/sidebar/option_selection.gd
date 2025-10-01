extends Node2D

signal featureChanged(featureId: int)

@export var featureId: int

@onready var labelNode := $FeatureLabel/LabelText

var labels := [
	"res://assets/sidebar/eyes_label.png",
	"res://assets/sidebar/nose_label.png",
	"res://assets/sidebar/smile_label.png"
]

func _on_arrow_left_pressed() -> void:
	featureId = featureId - 1 if featureId > 0 else 2
	changeLabel()

func _on_arrow_right_pressed() -> void:
	featureId = featureId + 1 if featureId < 2 else 0
	changeLabel()

func changeLabel():
	labelNode.texture = load(labels[featureId])
	featureChanged.emit(featureId)
