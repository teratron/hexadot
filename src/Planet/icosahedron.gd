class_name Icosahedron, "res://assets/icosahedron.svg" extends Node


const vertices = 12
const faces    = 20
const edges    = 30

export(float) var radius_outer = 100      # радиус внешней, описывающей сферы
export(float) var radius_inner = 100      # радиус внутренней, вписанной сферы

var edge_length: float = 1                # длина ребра


func _init():
	radius_outer = edge_length / 4 * sqrt(2 * (5 + sqrt(5)))
	radius_inner = edge_length / (4 * sqrt(3)) * (3 + sqrt(5))
	
	edge_length = radius_outer * 4 / sqrt(2 * (5 + sqrt(5)))
	
	print("Icosahedron Radius Outter:", radius_outer)
	print("Icosahedron Radius Inner:",  radius_inner)
	print("Icosahedron Edge Length:",  edge_length)
	pass


func _ready():
	var m = add_mesh_instance(self, "Center")
	add_property_to_mesh_instance(m)
	m.Vector3(0,2,0)
	pass


#func _process(delta):
#	pass


func add_mesh_instance(node, name: String = "MeshInstance") -> MeshInstance:
	var instance = MeshInstance.new()
	instance.name = name
	node.add_child(instance, true)
	return instance


func add_property_to_mesh_instance(instance):
	var sm = SphereMesh.new()
	sm.radius = 0.1
	sm.height = 0.2
	sm.radial_segments = 8
	sm.rings = 4
	
	var material = SpatialMaterial.new()
	material.flags_unshaded = true
	#sm.albedo_texture = preload("editor_gizmo_texture.png")
	material.albedo_color = Color(1, 0, 0, 1)
	sm.material = material
	
	instance.mesh = sm


