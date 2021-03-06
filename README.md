# Resume Generator

Having a hard time making sure all resumes look the same?

This tool helps to solve that issue. Now you can write a resume in markdown and this tool will generate both HTML and PDF.


## Requirements
1. To use this tool you need to have docker installed
2. If you want to use the watch script, `fswatch` needs to be installed

## Usage
To run a watch an generate, use this script:
```console
$ ./watch.sh
```

To just generate one resume, use this:
```console
$ ./generate.sh "md/example-resume.md"
```


## Styles 

If you want you can implement your own styles and override the default style.

This can be done by copying the `/style/default` directory and create your own `/style/<style_name>` folder. When generating you are able to do:

```console
$ ./generate.sh "md/example-resume.md" "<style_name>"
``` 


## Example output:

[PDF Resume](./pdf/example-resume.pdf)

[HTML Resume](./html/example-resume.html)
