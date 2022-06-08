FROM python:3.8

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