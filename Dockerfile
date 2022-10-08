# Krei bildon de language-identification

# Por RP4 8Gb komenco
FROM arm64v8/python:3.10.7-alpine
RUN apk add --update alpine-sdk
# Por RP4 8Gb fino

RUN wget https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.bin
RUN pip install flask
RUN pip install waitress
RUN pip install fasttext

COPY . /app
WORKDIR /app
ENV WAITRESS_PORT 3000
ENV WAITRESS_HOST 0.0.0.0
EXPOSE $WAITRESS_PORT
CMD [ "python", "app.py" ]