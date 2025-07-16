FROM ghcr.io/gohugoio/hugo:v0.148.1

# Set the working directory inside the container
WORKDIR /src

# Copy the Hugo site files into the container
COPY . .

# Download the theme (this assumes you have a .gitmodules and have run `git submodule update --init --recursive`)
# If you haven't, or don't want submodules, you'd need to copy the theme directly in the previous step.
RUN hugo mod tidy

# Switch to the root user to install packages.
USER root

# Install dart-sass manually by downloading the pre-compiled binary from GitHub,
# as it is not available in the default Alpine repositories.
ENV DART_SASS_VERSION=1.77.8
RUN apk add --no-cache curl tar \
    && curl -LJO "https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz" \
    && tar -xf "dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz" \
    && mv dart-sass/sass /usr/bin/ \
    && rm -rf dart-sass* && apk del curl tar

# Switch back to the non-root hugo user for security.
USER hugo

# Command to run the Hugo server with live reload
CMD ["server", "-D", "-w", "--bind=0.0.0.0"]

# Expose the default Hugo port (1313)
EXPOSE 1313