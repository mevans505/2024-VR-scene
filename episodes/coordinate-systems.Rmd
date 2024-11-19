---
title: 'Coordinate Systems and Transformations'
teaching: 10
exercises: 2
---


### Group 2: Crook Cameron, Parmenter Daniel

:::::::::::::::::::::::::::::::::::::: questions 

- What are the basis of coordinate systems in 3D?
- How do we transform objects in the coordinate systems?
- What is an affine transformation?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain the basics of coordinate systems, including right or left
coordinate systems.
- Explain the elements of an affine transformation.
- Demonstrate how affine transformations work, including using matrices.

::::::::::::::::::::::::::::::::::::::::::::::::
What are Coordinate Systems in 3D?
A 3D coordinate system is a mathematical framework used to describe the position of points, lines, and objects in three-dimensional space. The system is defined by three perpendicular axes, typically labeled X, Y, and Z. Each point in space is described by a set of three coordinates (𝑥,𝑦,𝑧) which represent its distance from the origin (the point where all three axes meet, typically at (0,0,0).

Right and Left handed coordinate systems:

Right-Handed Coordinate System: In a right-handed system, the thumb, index, and middle fingers of the right hand can be used to represent the X, Y, and Z axes, respectively:

Thumb points in the direction of the X-axis.
Index finger points in the direction of the Y-axis.
Middle finger points in the direction of the Z-axis.
If you curl your fingers from the X-axis toward the Y-axis, your thumb will point in the direction of the Z-axis.

Left-Handed Coordinate System: This is the opposite configuration. In a left-handed system:

Thumb points in the direction of the X-axis.
Index finger points in the direction of the Y-axis.
Middle finger points in the direction of the Z-axis, but it points in the opposite direction compared to the right-handed system.
The main difference between these systems lies in the direction of the Z-axis, which affects how certain operations, such as rotations, behave.

Both coordinate systems are used depending on the context. For example, 3D graphics in computer graphics often use a right-handed system, while some other engineering applications may use a left-handed system.

How do we transform objects in the coordinate systems?

In 3D space, we can transform objects by changing their position, orientation, and size. Common transformations include translation, rotation, and scaling. These transformations are typically represented using matrices, which allow us to apply the transformations efficiently using linear algebra.

Translation: Moving an object from one position to another without changing its orientation or size. A translation shifts all points of the object by the same vector (𝑑𝑥,𝑑𝑦,𝑑𝑧)

Translation matrix (in homogeneous coordinates):

𝑇(𝑑𝑥,𝑑𝑦,𝑑𝑧) = 

[1 0 0 dx]
[0 1 0 dy]
[0 0 1 dz]
[0 0 0 1]

Where the object’s coordinates (𝑥,𝑦,𝑧) are multiplied by this matrix to shift the object by the desired amount.

​Rotation: Rotating an object around one of the three axes (X, Y, or Z) by a certain angle. Rotations are typically represented using rotation matrices for each axis.

Example: Rotation about the Z-axis by an angle 𝜃:

[cos𝜃 -sin𝜃 0 0]
[sin𝜃 cos𝜃  0 0]
[0   0   1   0 ]
[0   0   0   1 ]

Scaling: Changing the size of an object by multiplying its coordinates by a scale factor. Uniform scaling enlarges or shrinks the object equally in all directions, while non-uniform scaling can distort the object.

Scaling matrix: 

Where Sx, Sy and Sz are the scaling factors along the X, Y and Z axis : 

S(sx, sy, sz)
[sx 0 0 0]
[0 sy 0 0]
[0 0 sz 0]
[0 0  0 1]

What is an affine transformation?

An affine transformation is a type of transformation that preserves points, straight lines, and planes. It combines linear transformations (such as scaling, rotation, and shearing) with translation. Affine transformations preserve parallelism (i.e., if two lines are parallel before the transformation, they remain parallel afterward) but may not preserve angles or lengths.
(Shearing is distorting the shape of objects by slanting them).

Affine transformations can be described using a matrix in homogeneous coordinates, allowing for both rotation, scaling, and translation to be performed in a unified way. An affine transformation matrix typically looks like this:

A = 
[a11 a12 a13 tx]
[a21 a22 a23 ty]
[a31 a32 a33 tz]
[0   0   0   1 ]

Where The upper-left 3×3 part of the matrix (coefficients 𝑎ij) handles rotation, scaling, and shearing.
The last column [𝑡𝑥,𝑡𝑦,𝑡𝑧,1] represents the translation.
The fourth row is to maintain the matrix format for homogeneous coordinates.

How do they work?
Affine transformations in 3D can be applied using matrix multiplication. To transform a point (𝑥,𝑦,z) we represent it in homogeneous coordinates as [x,y,z,1] where the extra 1 allows for translation to be included in the matrix.

First, we would need to apply transformation, rotation and scaling as matrices (shown above) and then multiply them together using the formula Matrix M = Translation Matrix * Rotation Matrix * Scaling Matrix.

The matrix M would then represent This matrix M represents the combined scaling, rotation, and translation. Once calculated, it can be used to transform any point in space by multiplying it by the vector [x,y,z,1].

Conclusion:

3D coordinate systems are based on X, Y, and Z axes, with right-handed and left-handed variants.
Object transformations, include translation, rotation, and scaling.
An affine transformation combines linear transformations and translations and can be represented using a 4x4 matrix.
Matrix multiplication allows us to efficiently apply multiple transformations in sequence.


