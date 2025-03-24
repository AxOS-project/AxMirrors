#!/bin/python

import logging
from pathlib import Path

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")

archs = (Path("x86_64"),)

base_url = "https://raw.githubusercontent.com/axos-project/axmirrors/main/{arch}/{package}"


def main():
    # root index.html content
    index_text = "<html><head><title>AxOS Packages</title></head><body>"
    index_text += "<h1>AxOS Packages</h1><ul>"

    for arch in archs:
        # add current arch to root index.html
        logging.info("Generating for arch: %s", arch)
        index_text += f'<li><a href="{arch}/index.html">{arch}</a></li>'

        # this arch index.html content body
        archs_text = '<html><head><title>Packages for {arch}</title></head><body>'.format(arch=arch)
        archs_text += '<a href="../index.html">../</a><h1>Packages for {arch}</h1><ul>'.format(arch=arch)
        
        # get packages list
        packages = sorted(tuple(arch.glob("*.zst")))
        
        # add packages link
        for package in packages:
            logging.info("Generating for package: %s", package)
            _package_url = base_url.format(arch=arch, package=package.name)
            archs_text += '<li><a href="{url}">{name}</a></li>'.format(
                name=package.name.split(".")[0],
                url=_package_url,
            )
        archs_text += "</ul></body></html>"

        # create index.html file for this arch
        with open(arch / "index.html", "w") as f:
            f.write(archs_text)
    
    index_text += "</ul></body></html>"

    # create root index.html file
    with open("index.html", "w") as f:
        f.write(index_text)


if __name__ == "__main__":
    main()

