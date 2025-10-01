extends Node2D

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

var featureGlowPaths := [
	[
	"res://assets/pumpkin/eyes_glow_1.png",
	"res://assets/pumpkin/eyes_glow_2.png",
	"res://assets/pumpkin/eyes_glow_3.png",
	"res://assets/pumpkin/eyes_glow_4.png"
	],
	[
	"res://assets/pumpkin/nose_glow_1.png",
	"res://assets/pumpkin/nose_glow_2.png",
	"res://assets/pumpkin/nose_glow_3.png",
	"res://assets/pumpkin/nose_glow_4.png"
	],
	[
	"res://assets/pumpkin/mouth_glow_1.png",
	"res://assets/pumpkin/mouth_glow_2.png",
	"res://assets/pumpkin/mouth_glow_3.png",
	"res://assets/pumpkin/mouth_glow_4.png"
	]
]

@onready var glowNode := $Glow
@onready var featuresNode := $Features

@onready var glows = glowNode.get_children()
@onready var features = featuresNode.get_children()

func _ready() -> void:
	setLook(0, 0, 0)

func setLook(eyes, nose, mouth):
	glows[0].texture = load(featureGlowPaths[0][eyes])
	glows[1].texture = load(featureGlowPaths[1][nose])
	glows[2].texture = load(featureGlowPaths[2][mouth])
	
	features[0].texture = load(featurePaths[0][eyes])
	features[1].texture = load(featurePaths[1][nose])
	features[2].texture = load(featurePaths[2][mouth])

func changeLook(featureId, iconId):
	glows[featureId].texture = load(featureGlowPaths[featureId][iconId])
	features[featureId].texture = load(featurePaths[featureId][iconId])
