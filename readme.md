# node-install

`node-install` is a simple bash script for installing a bunch of binary [Node.js](https://nodejs.org) releases to an absolute path. It's intended for installing [Node.js](https://nodejs.org) binary releases on a Linux server at a specific location, avoiding screwing with `.profile` and `$PATH`.

### Running

Simply `curl` the script and point `bash` at it:

```shell
$ bash -c "$(curl -s https://raw.githubusercontent.com/martinrue/node-install/master/node-install.sh)"
```

### Example
```shell
$ bash -c "$(curl -s https://raw.githubusercontent.com/martinrue/node-install/master/node-install.sh)"
enter install path (/node):
enter node versions to install: 0.12.1 0.12.2 0.11.1
installing: 0.12.1
installing: 0.12.2
installing: 0.11.1
$ ls /node
v0.11.1  v0.12.1  v0.12.2
```

### Notes
`node-install` assumes you're installing to a 64-bit Linux server. As such it will only download the `linux-x64` releases from [https://nodejs.org/dist](https://nodejs.org/dist/). If you are running `node-install` on something else, you need to change the script [here](https://github.com/martinrue/node-install/blob/master/node-install.sh#L5) and [here](https://github.com/martinrue/node-install/blob/master/node-install.sh#L21).