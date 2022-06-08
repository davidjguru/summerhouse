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
EXPOSE 8080
WORKDIR /home
COPY . .

# Entrypoint and commands.
ENTRYPOINT ["/usr/local/bin/mkdocs"]
CMD ["build"]
CMD ["serve"]