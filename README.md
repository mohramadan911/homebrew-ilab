# homebrew-instructlab
Formula to install instructlab (ilab cli) on MacOs


## issue to be resolved 
- brew is trying to fix dynamic library (dylib) links for the dependencies in the virtual environment. Homebrew formulas expect files to have consistent and relocatable paths, but Python virtual environments include dynamically linked libraries with paths that aren't easily relocatable.


- 