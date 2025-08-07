FROM texlive/texlive:latest

# Install required system packages
RUN apt-get update && \
    apt-get install -y python3-pygments git make zip && \
    apt-get clean

# Install additional TeX packages for minted and other features
RUN tlmgr update --self
RUN tlmgr install minted latexmk

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

RUN chmod +x build.sh
# Default command: build the documentation
ENTRYPOINT ["bash", "build.sh"]
CMD []
