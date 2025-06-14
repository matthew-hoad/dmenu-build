# dmenu

*For those who don't have dmenu available via a package manager (E.g. Steam Deck)*

# Installing dmenu

>[!NOTE]
>By default `make install` will install to `~/.local` (binaries to `~/.local/bin`, man pages to `~/.local/share/man` etc.).
>To change this, simply pass the `target` parameter like so: 
> ```shell
> make install target=/usr
> ```

If you trust me, then grab the latest release from the releases page.

```shell
tar -xvf name_of_release.tar.gz
cd name_of_release
make install
```

Or, to build it yourself:

Requirements
- podman / docker
- if podman, a compose plugin
- Choose which patches you want to apply from https://suckless.org/dmenu/patches
- Copy the patch file URLs into patches.txt (one per-line)
- Then just start the build!
    ```shell
    make podman-build-install
    ```
    or
    ```shell
    make docker-build-install
    ```

