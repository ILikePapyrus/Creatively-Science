extends MeshInstance3D

# Parameters
var rings = 50
var radial_segments = 50
var radius = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var cube_mesh = ArrayMesh.new()

	# Define the cube's vertices, normals, and UVs
	var vertices = PackedVector3Array([
		Vector3(-1,  1, -1), Vector3( 1,  1, -1), Vector3( 1, -1, -1), Vector3(-1, -1, -1), # Back face
		Vector3(-1,  1,  1), Vector3( 1,  1,  1), Vector3( 1, -1,  1), Vector3(-1, -1,  1), # Front face
		Vector3(-1,  1, -1), Vector3(-1,  1,  1), Vector3(-1, -1,  1), Vector3(-1, -1, -1), # Left face
		Vector3( 1,  1, -1), Vector3( 1,  1,  1), Vector3( 1, -1,  1), Vector3( 1, -1, -1), # Right face
		Vector3(-1,  1, -1), Vector3( 1,  1, -1), Vector3( 1,  1,  1), Vector3(-1,  1,  1), # Top face
		Vector3(-1, -1, -1), Vector3( 1, -1, -1), Vector3( 1, -1,  1), Vector3(-1, -1,  1)  # Bottom face
	])

	var normals = PackedVector3Array([
		Vector3( 0,  0, -1), Vector3( 0,  0, -1), Vector3( 0,  0, -1), Vector3( 0,  0, -1), # Back face
		Vector3( 0,  0,  1), Vector3( 0,  0,  1), Vector3( 0,  0,  1), Vector3( 0,  0,  1), # Front face
		Vector3(-1,  0,  0), Vector3(-1,  0,  0), Vector3(-1,  0,  0), Vector3(-1,  0,  0), # Left face
		Vector3( 1,  0,  0), Vector3( 1,  0,  0), Vector3( 1,  0,  0), Vector3( 1,  0,  0), # Right face
		Vector3( 0,  1,  0), Vector3( 0,  1,  0), Vector3( 0,  1,  0), Vector3( 0,  1,  0), # Top face
		Vector3( 0, -1,  0), Vector3( 0, -1,  0), Vector3( 0, -1,  0), Vector3( 0, -1,  0)  # Bottom face
	])

	var uvs = PackedVector2Array([
		Vector2(0, 0), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1), # Back face
		Vector2(0, 0), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1), # Front face
		Vector2(0, 0), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1), # Left face
		Vector2(0, 0), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1), # Right face
		Vector2(0, 0), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1), # Top face
		Vector2(0, 0), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1)  # Bottom face
	])

	var indices = PackedInt32Array([
		0,  1,  2,  2,  3,  0, # Back face
		4,  5,  6,  6,  7,  4, # Front face
		8,  9,  10, 10, 11, 8, # Left face
		12, 13, 14, 14, 15, 12, # Right face
		16, 17, 18, 18, 19, 16, # Top face
		20, 21, 22, 22, 23, 20  # Bottom face
	])

	# Create the surface arrays
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_NORMAL] = normals
	arrays[Mesh.ARRAY_TEX_UV] = uvs
	arrays[Mesh.ARRAY_INDEX] = indices

	# Add a surface to the ArrayMesh
	cube_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)

	# Set the MeshInstance3D's mesh to the ArrayMesh
	mesh = cube_mesh

	# Committing to the ArrayMesh
	#mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)

	# Save the ArrayMesh
	# ResourceSaver.save(mesh, "res://sphere.tres", ResourceSaver.FLAG_COMPRESS)






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
