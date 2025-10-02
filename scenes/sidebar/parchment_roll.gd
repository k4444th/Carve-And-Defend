extends Node2D

@onready var backgroundNode: NinePatchRect = $Background
@onready var textContainerNode: MarginContainer = $MarginContainer
@onready var labelNode: Label = $MarginContainer/Label

var featureTexts := [
	[
	"Double damage to undead",
	"Double damage to living animals",
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
	visible = false

func display(inFocus: bool, featureId: int, iconId: int):
	if iconId / 2 == 0:
		position.y = 236
	else:
		position.y = 320
	
	if iconId % 2 == 0:
		position.x = 1084
	else:
		position.x = 924
	
	if inFocus:
		labelNode.text = featureTexts[featureId][iconId]
		var textSize = labelNode.get_minimum_size()
		var textLineCount = labelNode.get_line_count()
		var textLineHeight = labelNode.get_line_height()
		backgroundNode.size.y = textLineCount * (textLineHeight / 4) + 18
		textContainerNode.size.y = textSize.y
		visible = true
	else:
		visible = false
