# Lecture 04
This lecture was taught by [Dr. Mert Gur](https://www.csb.pitt.edu/faculty/mert-gur-phd/).
The slides for this lecture can be found [here](https://mscbio2025-2025.github.io/lectures/lecture-15-prody.slides.html#/).
## ProDy
[ProDy]() is a python package developed in the [Bahra lab]() for molecular visualization and analysis of biomolecules.
### ProDy Naming Convention
The convention for various functions in ProDy is quite simple.
It generally follows the xY format where "x" is the action, and "Y" is the type of action, for example, `parsePDB` which parses a `PDB` file.
### Usage Example
`ubi = parsPDB('1ubi')`
This stores the parsed information from ProDy in the `ubi` object.
`ubi.numAtoms()`
Will return the number of atoms in the `1ubi` object.
`calcGyradius(ubi)`
Will return the radius of gyration in the structure, calculate by ProDy.
### Visualization
The protein structure can be visualized either using matplotlib or pymol's api PY3DMol.
### Exercise
The slides ask for the number of atoms in the 3ERK structure.
This can be easily found by storing the structure in an object then getting the number of atoms using `numAtoms()`.
### Getters and Setters
ProDy has implemented a getter and stter method for different variables within the AtomGroup given.
This allows for easily finding information about the protein.
In addition, set methods allows for changing the information about the protein.


