#!/bin/python

import logging
from pathlib import Path

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")

base_url = "https://raw.githubusercontent.com/axos-project/axmirrors/main/{arch}/{package}"

# JavaScript for live search filtering
search_script = """
<script>
function searchPackages(inputId, listId) {
    const input = document.getElementById(inputId).value.toLowerCase();
    const listItems = document.getElementById(listId).getElementsByTagName('li');
    for (let i = 0; i < listItems.length; i++) {
        const txt = listItems[i].innerText.toLowerCase();
        listItems[i].style.display = txt.includes(input) ? '' : 'none';
    }
}
</script>
"""

def generate_page(archs, root_path, index_text = "<ul>"):
    for arch in archs:
        # add current arch to root index.html
        logging.info("Generating for arch: %s", arch)
        index_text += f'<li><a href="{arch}/index.html">{arch}</a></li>'

        # per-arch index.html content
        arch_text = f"""<html><head><title>Packages for {arch}</title>{search_script}</head><body>
<a href="{root_path}index.html">../</a>
<h1>Packages for {arch}</h1>
<input type="text" id="archSearch_{arch}" placeholder="Search..." onkeyup="searchPackages('archSearch_{arch}', 'pkgList_{arch}')">
<ul id="pkgList_{arch}">
"""

        # get packages list
        packages = sorted(arch.glob("*.zst"))

        for package in packages:
            logging.info("Generating for package: %s", package)
            _package_url = base_url.format(arch=arch, package=package.name)
            arch_text += '<li><a href="{url}">{name}</a></li>'.format(
                name=package.name.split(".")[0],
                url=_package_url,
            )

        arch_text += "</ul></body></html>"

        # write arch-specific index.html
        with open(arch / "index.html", "w") as f:
            f.write(arch_text)

    index_text += "</ul></body></html>"

    # write root index.html (appending)
    with open("index.html", "a") as f:
        f.write(index_text)

def clear_page():
    with open("index.html", "w") as f:
        f.write("")

def main():
    page1 = (Path("x86_64"),)
    page2 = (Path("testing/x86_64"),)

    clear_page()

    # root index.html content
    index_text = "<html><head><title>AxOS Packages</title></head><body>\n"
    index_text += "<h1>AxOS Packages</h1>\n<ul>\n"

    # NOTE To future me, @ardox or any other person reading this code:
    # The second argument points to the root from the current page
    # Make sure that you add '/' at the end of the root path to consider it as a directory
    generate_page(page1, "../", index_text)
    generate_page(page2, "../../")

if __name__ == "__main__":
    main()
