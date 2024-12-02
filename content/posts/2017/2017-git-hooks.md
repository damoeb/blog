---
title: "Shareable git hooks in projects"
date: 2017-09-01T08:05:22+01:00
draft: false

tags: 
  - git
---

If you work like me in a project with multiple developers and you want to enforce certain standards, this should be done as early as possible. Knowing that you don't fulfill the linter rules on Jenkins is way too late. One way to enforce feedback are [git hooks](https://www.kernel.org/pub/software/scm/git/docs/githooks.html). Though, the fact that they are stored in .git makes them difficult to share in a project. Luckily, the [git hooks plugin](https://github.com/icefox/git-hooks) for git helps out. There is even a brew formula for it, `brew info git-hooks`. Here are some client-side git hooks:

*   [Validate commit message format](#commit-msg-format)
*   [Eslint before committing](#eslint)
*   [Install node modules after checkout](#install-node-modules)


### Validate commit message format on pre-comit

```
#!/bin/bash

function run_test
{
echo "Message ${1}"
    echo "${1}" | grep -E '^(feat|fix|docs|style)\([^)]+\) HIWEST-[0-9]{4}: .{1,}' >/dev/null || {
        echo "feat(ngOptions) Ticket-4444: ngModel is optional."
        exit 1
    }
}

case "${1}" in
    --about )
        echo -n "Checks commit message for presence of Signed-off-by line."
        ;;
    * )
        run_test "$@"
        ;;
esac
```

### eslint on pre-commit

It is important to stage the changed files automatically, otherwise you need a second commit for the auto fixed eslint errors.

```
#!/bin/bash

function run_test
{
    echo "* eslint with autofix"
    npm run eslint
    git add `git diff --name-only`
}

case "${1}" in
    --about )
        echo -n "Runs eslint with autofix."
        ;;
    * )
        run_test "$@"
        ;;
esac
```


### install node modules on post-checkout

```
#!/bin/bash

function run_test
{
    echo "* update node modules"
    yarn install
}

case "${1}" in
    --about )
        echo -n "Updates the node modules."
        ;;
    * )
        run_test "$@"
        ;;
esac
```
