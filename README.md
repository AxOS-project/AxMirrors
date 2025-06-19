# AxMirrors

<!-- PROJECT LOGO -->
<br />
<div align="center">
    <img src="https://github.com/AxOS-project/AxOS/assets/110931544/baabbfe9-0580-4169-94c8-5fed2d42060e" alt="Logo" width="100" height="100">
  </a>

  <h3 align="center">AxOS</h3>

  <p align="center">
    The Linux experience, enhanced.
    <br />
    <a href="http://axos-project.com"><strong>Website</strong></a>
    <br />
    <br />
    <a href="https://github.com/axos-project/AxOS/issues">Report Bug</a>
    ·
    <a href="https://github.com/AxOS-project/AxOS/discussions">Request Feature</a>
    ·
    <a href="https://github.com/axos-project/AxOS/releases/">Download</a>
    ·
    <a href="https://axos-1.gitbook.io/">Wiki</a>
    <br />
    <br />
  </p>
</div>

> [!IMPORTANT]
> I need feedbacks! i cannot improve AxOS without it!

AxMirrors is a repository for AxOS packages. AxMirrors provides a mirror of packages accessible via a web interface for users wishing to install or update their OS. This mirror is specially designed for x86_64 architectures and structured in a simple way to facilitate package distribution.

## Repository structure

The repository is organized as follows:

```css
AxMirrors/
│
├── index.html
├── autogen.py
├── update_pkgs.sh
└── x86_64/
    └── [packages...]
└── new/
    └── [temp_packages...]
```

## Package installation

There is no specific command for updating packages via AxMirrors. You can simply check the availability of new versions on the mirror and download them manually if necessary.
