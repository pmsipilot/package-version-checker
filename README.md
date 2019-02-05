# Package version checker

The goal of this project is to check your `.lock` files for duplications of your dependency. It is indeed too easy to install many versions of a same dependency and this can lead to sneaky bugs.

## Check yarn.lock

`check-yarn.sh [folder]`

Get your dependencies from a `package.json` file and read your `yarn.lock` file to find duplicates.

Both files have to be located in the same `folder`, default to current folder.

Prints the duplicated dependencies with their count of installed versions. Returns 1 if any duplicated dependencies are found, else 0.

### Dependency

Use [jq](https://stedolan.github.io/jq/download/) to parse the `package.json` file

### Example output

```
The dependency angular is installed in 2 different versions
The dependency angular-ui-router is installed in 2 different versions
The dependency browserify is installed in 19 different versions
The dependency font-awesome is installed in 2 different versions
The dependency intro.js is installed in 2 different versions
```

## Contributing

All contributions are welcome.

Please respect the [commit convention](https://www.conventionalcommits.org/). The description can be ended by a `|` and [accepted emojis](https://gitmoji.carloscuesta.me/).
