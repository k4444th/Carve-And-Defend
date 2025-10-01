extends Node2D

@onready var optionSelectionNode := $UI/WoodTexture/OptionSelection
@onready var featureOptionsNode := $UI/WoodTexture/FeatureOptions
@onready var pumpkinPreviewNode := $UI/WoodTexture/PumpkinPreview

@onready var featureOptions = featureOptionsNode.get_children()

func _ready() -> void:
	optionSelectionNode.connect("featureChanged", changeFeature)
	for option in featureOptions:
		option.connect("selectionChanged", changePumpkinLook)

func changePumpkinLook(featureId, iconId):
	pumpkinPreviewNode.changeLook(featureId, iconId)

func changeFeature(featureId):
	for option in featureOptions:
		option.changeFeature(featureId)
