FROM python:3.8

# ARGS.
ARG WITH_PLUGINS=true
ARG USER=1001

RUN adduser -h /usr/src/mkdocs -D -u $USER mkdocs
RUN apt install git

# Environment variables.
ENV PACKAGES=/usr/local/lib/python3.9/site-packages
ENV PYTHONDONTWRITEBYTECODE=1
ENV PATH="${PATH}:/usr/src/mkdocs/.local/bin"

# Working directory.
USER mkdocs
RUN mkdir -p /usr/src/mkdocs/build
WORKDIR /usr/src/mkdocs/build

# Running pip for dependencies.
RUN pip install --upgrade pip 
RUN pip install mkdocs 
RUN pip install mkdocs-material
RUN pip install mkdocs-pdf-export-plugin
RUN pip install mkdocs-rtd-dropdown
RUN pip install mkdocs-git-revision-date-plugin
RUN pip install mkdocs-git-revision-date-localized-plugin

# Exposing port.
EXPOSE 8000

# Entrypoint and initial command.
ENTRYPOINT ["/usr/src/mkdocs/.local/bin/mkdocs"]
CMD ["serve"]