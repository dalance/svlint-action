
# svlint-action
This action checks SystemVerilog source code using
[svlint](https://github.com/dalance/svlint).


## Inputs
Using svlint on the command line, the list of files to check can be given in
one of two ways:
1. Directly, with a list or
  [glob](https://en.wikipedia.org/wiki/Glob_(programming)) of file paths.
  For example, `svlint foo.sv bar.sv`
2. Indirectly, with filelists.
  For example, `svlint -f foo.f -f bar.f`

Svlint cannot use both filelists and a list of files at the same time.
Similarly, this action cannot use both `files` and `filelists` inputs at the
same time.


### `files`
Paths to SystemVerilog source files.
NOTE: `files` and `filelists` are mutually exclusive.

#### Example Usage
```yaml
uses: dalance/svlint-action@master
with:
  files: |
    src1.sv
    src2.sv
```


### `filelists`
The filenames of filelist.
NOTE: `files` and `filelists` are mutually exclusive.
Filelists can include environment variables which are can be given via `env`.

#### Example Usage
```yaml
uses: dalance/svlint-action@master
with:
  filelists: |
    list1.f
    list2.f
env:
  DIR: test
```


## TOML Configuration
By default, svlint will search upwards in the filesystem for a file called
`.svlint.toml` and if such a file exists, then it is used as the configuration.
This is ideal for projects which only use one set of rules, as it only requires
placing your `.svlint.toml` in the root of your repository.

For larger projects which use multiple configurations, perhaps one for design
and one for verification, the [TOML](https://toml.io/en/) configuration file
can be specified using the `SVLINT_CONFIG` environment variable:
```yaml
uses: dalance/svlint-action@master
with:
  files: |
    src/design/foo.sv
    src/design/bar.sv
env:
  SVLINT_CONFIG: src/design.svlint.toml
```

If no configuration file is found, all rules are enabled.
This is almost certain to fail - intentionally, to force users to choose some
configuration.


## Versions of This GitHub Action
To use this action in your repository, your [YAML](https://yaml.org/) workflow
file needs a line like `uses: dalance/svlint-action@master`.
GitHub provides documentation on how to use workflows
[here](https://docs.github.com/en/actions/using-workflows).
The
[`uses`](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_iduses)
line has the format `<GitHubUserName>/<GitHubRepoName>@<GitRef>`.
That `GitRef` field may be a tag, branch, commit hash, or (most commonly) the
[MAJOR](https://semver.org/) component of a tag.
Thus, you can use this action in different ways, according to your needs.

- Use the latest release: `uses: dalance@svlint-action@latest`.
- Use a specific major release: `uses: dalance@svlint-action@v1`.
- Use the master branch: `uses: dalance@svlint-action@master`.
- Use a specific commit: `uses: dalance@svlint-action@6a447be`.
- Use your own fork: `uses: JohnDoe@svlint-action@master`.

Note: Releases of this action are not necessarily in step with releases of
svlint.

