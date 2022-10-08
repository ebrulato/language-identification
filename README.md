# language-identification
This repo contains code for Detecting language from a given text in python using Facebook's library [fasttext](https://fasttext.cc/docs/en/language-identification.html). A flask Restful API is also provided along.

# Quickstart

### Requirements

    $ pip3 install fasttext
    $ pip3 install flask
    $ pip3 install waitress

You can use the file *requirements.txt*.

    $ pip3 install requirements

### How to run
To use as a REST api run the code `app.py`. To simply use code without serving it as a API use `language_identification.py`. Read more about this on my [medium](https://medium.com/@c.chaitanya/language-identification-in-python-using-fasttext-60359dc30ed0#77d0-3ba10d3953be) post.

Note, you have to set the environment variables :
| ENV | sample |
| :-- | --: |
| WAITRESS_PORT | 3000 |
| WAITRESS_HOST | 0.0.0.0 |

### Docker

The Docker version has been designed for a Raspberry Pi 4 (and run on the 8Gb version).
If you want to build this image you need around 6 Gb on RAM (I've done it with Ubuntu). You may need to add some swap, and drink a verrrrry long coffee. 
To build the Docker :

```
$ docker build --tag yourtag:yourversion .
```

To start this container :

```
$ docker container run yourtag:yourversion
```

If you want to test it, you can use the version that I made on docker hub :

```
$ docker container run ebrulato/lingvidentigilo:1.0
```

### Examples

#### Command Line

```
curl -X POST \
  http://127.0.0.1:5000/detect_language \
  -H 'Content-Type: application/json' \
  -d '{"text":"hello"}'
```

#### Default Command Line for Docker

```
curl -X POST \
  http://172.17.0.2:3000/detect_language \
  -H 'Content-Type: application/json' \
  -d '{"text":"mi manøas hejme"}'
```

### Future work

* As `K` value changes, number of languages returned by the model increases. Formating the return value in API needs to be done accordingly. Additionally the language iso code returned by the model could be converted to human understandable format by using additional python libraries like `pycountry`

### License

`language-identification` is a public domain work, dedicated using
[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/). Feel free to do
whatever you want with it.

