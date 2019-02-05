# Resume Generator

Having a hard time to make sure all resumes are using the same styling?

This tool helps to solve that issue. Now you can write your resume in markdown and it will generate both HTML and PDF for you.


## Requirements
1. To use this tool you need to have docker installed.
2. If you want to use the watch script, `fswatch` needs to be installed.

## Usage
To run a watch an generate, use this script:
```console
$ ./watch.sh
```

To just generate one resume, use this:
```console
$ ./generate.sh "md/example-resume.md"
```
