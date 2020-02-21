# svlint-action

This action check SystemVerilog source code by [svlint](https://github.com/dalance/svlint).

## Inputs

### `files`

The filenames of SystemVerilog source code.
`files` and `filelists` are exclusive.

### `filelists`

The filenames of filelist.
`files` and `filelists` are exclusive.

Filelists can include environment variables.
Environment variables can be passed through `env`.

## Example usage

```yaml
uses: dalance/svlint-action@v1
with:
  files: |
    src1.sv
    src2.sv
```

```yaml
uses: dalance/svlint-action@v1
with:
  filelists: |
    list1.f
    list2.f
env:
  DIR: test
```
