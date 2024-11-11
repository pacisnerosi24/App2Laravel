# Calculator in Laravel with Docker

This project is a simple calculator application built in Laravel and set up to run in a Docker container. The Docker image is configured to be pushed to Docker Hub, making it easy to deploy on any machine with Docker.

## Features

- Arithmetic operations: **Addition**, **Subtraction**, **Multiplication**, **Division**.
- Deployable in **Docker** and available on **Docker Hub** for easy access.
- Complete environment with **Laravel**, **PHP-FPM**, and optionally **MySQL** (using `docker-compose`).

## Requirements

- [Docker](https://docs.docker.com/get-docker/) (to build and run the image)
- [Docker Compose](https://docs.docker.com/compose/) (optional, if using `docker-compose.yml`)

## Setup and Execution

### Option 1: Pull the image from Docker Hub

1. **Run the following command** to pull the image from Docker Hub:

   ```bash
   docker pull your-username/calculator-laravel
