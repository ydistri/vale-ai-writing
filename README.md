# vale-ai-writing

A [Vale](https://vale.sh) style for prose written by language models, used
beside [ai-tells](https://github.com/tbhb/vale-ai-tells). Each rule's comment
gives its hit rate in orc's Go comments and in a sample of the Go standard
library.

## Use

Add the release zip to `Packages` in `.vale.ini`, add the style to
`BasedOnStyles`, then run `vale sync`:

```ini
Packages = https://github.com/ydistri/vale-ai-writing/releases/download/v0.1.0/AiWriting.zip

[*.md]
BasedOnStyles = AiWriting
```

## Rules

| Rule | Level | Example |
|---|---|---|
| `VerbNoNoun` | warning | "moves no counter", any verb found by part of speech |
| `CommonVerbNoNoun` | warning | "takes no parameter", with has, take, contain, return or match |
| `CommaAndClause` | warning | "the queue merged the branch, and the worker went back" |

Vale applies the two part-of-speech rules to Go comments only through a view
that types the comments as `md`.

## Test

`test/run.sh` lints `test/fixtures.md` and diffs the alerts against
`test/expected.txt`. `test/run.sh -u` rewrites that file.

## Release

Pushing a `v*` tag runs the tests and attaches `AiWriting.zip` to a GitHub
release.
