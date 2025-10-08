extends Node2D

var fieldRect := Rect2(Vector2(0, 0), Vector2(1086, 720))
var tileMapSize := Vector2(10, 6)
var lastPumpkinPos: Vector2
var lastPumpkinLook := Vector3(0, 0, 0)

var pumpkinScene := load("res://scenes/world/pumpkin.tscn")

@onready var tileMapNode := $TileMap.get_children()[1]
@onready var pumpkinsContainerNode := $Pumpkins
@onready var sidebarOptionsNodes := $Sidebar.find_child("FeatureOptions").get_children()

func _ready() -> void:
	for option in sidebarOptionsNodes:
		option.connect("selectionChanged", changePumpkinLook)

func changePumpkinLook(featureId, iconId):
	pumpkinsContainerNode.get_children()[pumpkinsContainerNode.get_child_count() - 1].changeLook(featureId, iconId)
	lastPumpkinLook[featureId] = iconId

func _input(event):
	if event is InputEventMouseMotion and fieldRect.has_point(event.position):
		var currentPumpkin = pumpkinsContainerNode.get_children()[pumpkinsContainerNode.get_child_count() - 1]
		if mousePosInField(event.position):
			if tileMapNode.get_cell_atlas_coords(tileMapNode.local_to_map(event.position)).x < 0:
				currentPumpkin.setPosition(tileMapNode.map_to_local(tileMapNode.local_to_map(event.position)), true)
				lastPumpkinPos = tileMapNode.map_to_local(tileMapNode.local_to_map(event.position))
			else:
				currentPumpkin.setPosition(lastPumpkinPos, true)
		else:
			currentPumpkin.hide()
	
	if event is InputEventMouseButton and fieldRect.has_point(event.position) and event.pressed == true:
		var currentPumpkin = pumpkinsContainerNode.get_children()[pumpkinsContainerNode.get_child_count() - 1]
		if mousePosInField(event.position):
			if tileMapNode.get_cell_atlas_coords(tileMapNode.local_to_map(event.position)).x < 0:
				currentPumpkin.setPosition(tileMapNode.map_to_local(tileMapNode.local_to_map(event.position)), false)
				tileMapNode.set_cell(tileMapNode.local_to_map(event.position), 0, Vector2i(0, 0))
				
				var newPumpkin = pumpkinScene.instantiate()
				pumpkinsContainerNode.add_child(newPumpkin)
				newPumpkin.hide()
				newPumpkin.setLook(lastPumpkinLook[0], lastPumpkinLook[1], lastPumpkinLook[2])

func mousePosInField(mousePos: Vector2):
	var mapPos = tileMapNode.local_to_map(mousePos)
	if mousePos.x > 16 and mapPos.x <= tileMapSize.x and mousePos.y > 22 and mapPos.y <= tileMapSize.y:
		return true
	return false
