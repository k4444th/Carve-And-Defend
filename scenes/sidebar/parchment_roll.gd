extends Node2D

var truncated := false

var textTemplate: String = "Eyes:\nDouble damage to undead\n\nNose:\n+1 damage\n\nMouth:\nFire (best against vampires)"

@onready var backgroundNode: NinePatchRect = $Background
@onready var textContainerNode: MarginContainer = $MarginContainer
@onready var labelNode: Label = $MarginContainer/Label
@onready var expandButtonNode: TextureButton = $ExpandButton
@onready var timerNode: Timer = $Timer

var featureTexts := [
	[
	"Double damage to undead",
	"Double damage to living creatures",
	"Enemy's speed -20%",
	"The 4 surrounding fields also take damage"
	],
	[
	"+1 damage",
	"+1 view distance\n-1 damage",
	"-1 view distance\n+2 damage",
	"Cut reload time in half"
	],
	[
	"Fire (best against vampires)",
	"Laser (best against ghosts)",
	"Stone (best against bats)",
	"Water (best against cats)"
	]
]

func _ready() -> void:
	labelNode.text = textTemplate

func changeFeature(featureId: int, iconId: int):
	if featureId == 0:
		var indexNose = textTemplate.find("Nose:")
		textTemplate = "Eyes:\n" + featureTexts[featureId][iconId] + "\n\n" + textTemplate.right(textTemplate.length() - indexNose)
	elif featureId == 1:
		var indexNose = textTemplate.find("Nose:")
		var indexMouth = textTemplate.find("Mouth:")
		textTemplate = textTemplate.left(indexNose) + "Nose:\n" + featureTexts[featureId][iconId] + "\n\n" + textTemplate.right(textTemplate.length() - indexMouth)
	elif featureId == 2:
		var indexMouth = textTemplate.find("Mouth:")
		textTemplate = textTemplate.left(indexMouth) + "Mouth:\n" + featureTexts[featureId][iconId]
	
	if !truncated:
		labelNode.text = textTemplate
		
		var sizeTweenBackground = get_tree().create_tween()
		var positionTweenButton = get_tree().create_tween()
		
		sizeTweenBackground.tween_property(backgroundNode, "size:y", int((labelNode.get_minimum_size().y) / 3) + 4, 0.25)
		positionTweenButton.tween_property(expandButtonNode, "position:y", labelNode.get_minimum_size().y + 84, 0.25)
	
func _on_expand_button_pressed() -> void:
	truncated = !truncated
	var sizeTweenBackground = get_tree().create_tween()
	var positionTweenButton = get_tree().create_tween()
	
	if truncated:
		sizeTweenBackground.tween_property(backgroundNode, "size:y", 20, 0.5)
		positionTweenButton.tween_property(expandButtonNode, "position:y", 88, 0.5)
	else:
		labelNode.text = textTemplate
		sizeTweenBackground.tween_property(backgroundNode, "size:y", int((labelNode.get_minimum_size().y) / 3) + 4, 0.5)
		positionTweenButton.tween_property(expandButtonNode, "position:y", labelNode.get_minimum_size().y + 84, 0.5)
		labelNode.text = ""
		
	timerNode.start()
	
	await sizeTweenBackground.finished
	expandButtonNode.flip_h = !expandButtonNode.flip_h

func _on_timer_timeout() -> void:
	if truncated:
		var currentText = labelNode.text
		if currentText.length() > 0:
			currentText = currentText.left(currentText.length() - 3)
			labelNode.text = currentText
			timerNode.start()
	else:
		var currentText = labelNode.text
		if currentText.length() <= textTemplate.length():
			currentText = textTemplate.left(labelNode.text.length() + 3)
			labelNode.text = currentText
			timerNode.start()
		
	
