extends Node2D

@onready var optionSelectionNode := $UI/WoodTexture/OptionSelection
@onready var featureOptionsNode := $UI/WoodTexture/FeatureOptions
@onready var pumpkinPreviewNode := $UI/WoodTexture/PumpkinPreview

@onready var featureOptions := featureOptionsNode.get_children()
@onready var parchmentRoll := $UI/ParchmentRoll

func _ready() -> void:
	optionSelectionNode.connect("featureChanged", changeFeature)
	for option in featureOptions:
		option.connect("selectionChanged", changePumpkinLook)
		option.connect("focusChanged", displayParchmentRoll)

func changePumpkinLook(featureId, iconId):
	pumpkinPreviewNode.changeLook(featureId, iconId)

func changeFeature(featureId):
	for option in featureOptions:
		option.changeFeature(featureId)

func displayParchmentRoll(inFocus: bool, featureId: int, iconId: int):
	parchmentRoll.display(inFocus, featureId, iconId)
