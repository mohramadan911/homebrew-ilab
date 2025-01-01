# homebrew-instructlab
Formula to install instructlab (ilab cli) on MacOs


## Installation
```sh
brew tap instructlab/ilab https://github.com/mohramadan911/homebrew-ilab
```

```sh
brew install ilab
```

## limitaion
- brew is trying to fix dynamic library (dylib) links for the dependencies in the virtual environment. Homebrew formulas expect files to have consistent and relocatable paths, but Python virtual environments include dynamically linked libraries with paths that aren't easily relocatable.