FROM <my_priv_registry>:5000/node.js

MAINTAINER xxx yyy <xxx.yyy@aaa.ccc>

# Install reveal.js
RUN git clone https://github.com/hakimel/reveal.js/
RUN cd reveal.js; npm install

RUN npm install -g grunt-cli

COPY index.html /slides/
COPY slides.md  /slides/

RUN rm /reveal.js/index.html

RUN ln -s /slides/index.html /reveal.js/index.html
RUN ln -s /slides/slides.md  /reveal.js/slides.md

COPY Gruntfile.js /reveal.js/

WORKDIR reveal.js

CMD [ "grunt",  "serve" ]

EXPOSE 8000
