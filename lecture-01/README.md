# Lecture 01
This lecture was taught by [Dr. Shikhar Uttam.](https://www.uttamlab.com/)
The slides for this lecture can be found [here.](https://mscbio2025-2025.github.io/lectures/lecture-01-introduction.slides.html#/8)
## Course Goals
The class is set up to get students familiar with computation techniques for biological research.
It should prepare students to use Python for this goal.
### Class Structure
The class has reading assignments before the class.
The lectures will teach the course material.
There will be some in-class activities and exercises.
This will be complemented with homework and projects to assess students' comprehension.
#### Homework
Homework will be posted on Tuesdays at 11:59 PM.
It will be done through Github classroom.
#### Grades
The class grades will be 70% homework and 30% final project.
## Installing Python
They recommend using conda, miniconda, or miniforge to install python.
Mamba was brought up as being faster than conda, and is better at resolving dependency nightmares.
Personally I prefer pixi.
I have set up a pixi environment for this class.
### Pixi
Pixi is a package manager for python written in Rust.
It supports multi-platform and multi-environment development.
The documentation for pixi can be found [here.](https://pixi.sh/latest/)
The guide for installing pixi in your machine can be found [here.](https://pixi.sh/latest/installation/)
After installation, a pixi environment can be initialized using
```bash
pixi initi  
```
There will be more information how this was used in this repository will follow.
### Windows Subsystem for Linux
For Windows users in the class [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) was recommended to be installed.
This raises a point for my projects.
When building packages, pixi solves the dependency based on the os of the user.
Many times pixi fails trying to resolve the dependency for windows and I remove windows compatibility for my projects.
Windows can still have access to my packages if they use WSL.
### Setting Up the Environment
The instructors for this class have graciously provided an `environments.yml` to resolve our dependencies.
Using `curl` the vile can be downloaded.
```bash
curl https://mscbio2025-2025.github.io/files/environment.yml -o ./environment.yml
```
This can be used by pixi using the `pixi init [OPTIONS] [PATH]` covered by the [pixi documentation](https://pixi.sh/latest/reference/cli/pixi/init/).
In my case, the command was
```bash
pixi init --input ./environment.yml ../
```
#### Automation Script
This was all put in a bash script in this directory `./lecture-01-environment-setup.sh` that can be used to automate this.
#### Testing the Environment
The lecture recommends using a Jupyter notebook to test the environment.
We can do this by running this python script
```python
import sys, pandas, numpy, matplotlib
print(sys.version)
print('pandas', pandas.__version__)
print('numpy', numpy.__version__)
print('matplotlib', matplotlib.__version__)
```
##### Jupyter Notebook
This is saved in `./lecture-01-jupyter-test.ipynb`.
#### Python Script
I also decided to test the environment in a python file.
This is provided in `./lecture-01-test.py`.
