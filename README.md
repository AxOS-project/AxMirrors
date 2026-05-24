# AxMirrors

AxMirrors is a repository for AxOS packages. AxMirrors provides a mirror of packages accessible via a web interface for users wishing to install or update their OS. This mirror is specially designed for x86_64 architectures and structured in a simple way to facilitate package distribution.

## Repository structure

The repository is organized as follows:

```css
AxMirrors/
│
├── index.html
├── autogen.py
├── add_new_pkgs.sh
└── x86_64/
    └── [packages...]
└── new/
    └── [temp_packages...]
```

## Package installation

There is no specific command for updating packages via AxMirrors. You can simply check the availability of new versions on the mirror and download them manually if necessary.
