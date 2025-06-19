# New packages folder

This directory (`/new`) can be used to store new packages that will be moved to the official mirrors (well, it will be moved to the `x86_64` folder).

## How to use

- Since the `x86_64` has a lot of files, add the new packages that you are adding to the mirror here in this directory (`/new`).
- After that, run the `add_new_pkgs.sh` script in the root to move all packages to `x86_64`.

### Important Note!

The script removes the packages with the similar name and then adds the new ones from the `/new` directory.

- If the package name is different from the previous version, then the old version will still remain.
- Ensure that previous version is removed manually in that case.

When running the `add_new_pkgs.sh` script, it will automatically remove the package from `/new` once it's moved to `x86_64`.

- If you need to keep the packages after running it, then pass the `--soft` flag to the script.

  **Example**:

  ```bash
  ./add_new_pkgs.sh --soft
  ```

## Recommended usage

After adding your packages, make sure that `/new` is empty.
