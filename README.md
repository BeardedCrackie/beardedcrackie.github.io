# Bearded Crackie - Blog

A personal blog built with the [Hugo](https://gohugo.io/) static site generator.

## Running the Development Environment

This project uses Docker and Docker Compose to create a consistent and isolated development environment. This means you don't need to install Hugo or other dependencies directly on your local machine.

### Prerequisites

Before you start, make sure you have the following installed:

- [Docker](https://www.docker.com/products/docker-desktop/)
- [Docker Compose](https://docs.docker.com/compose/install/) (usually included with Docker Desktop)

### Steps to Run

1.  **Start the server**

    In the project's root directory, open a terminal and run the following script:

    ```bash
    ./run-dev.sh
    ```
    This command will automatically build the Docker image (if necessary) and start the Hugo development server in a container.

    > **Note:** If you get a `Permission denied` error, grant execute permissions to the script with the command:
    > `chmod +x run-dev.sh`

2.  **Access the site**

    Once successfully started, the local version of the site will be available in your browser at:
    http://localhost:1313

3.  **Stopping**

    To stop the development server, press `Ctrl+C` in the terminal window where the script is running.