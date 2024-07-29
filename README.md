# docker-llm-conda-env
- https://hub.docker.com/r/jirvingphd/llm-env


## Overview

### llm-env

This Docker image sets up a Jupyter Notebook environment with all the necessary dependencies for working with Large Language Models (LLMs). It includes popular libraries such as TensorFlow, PyTorch, Transformers, and more. This environment is perfect for developing and testing LLM applications.

### Features

- **Based on Miniforge3**: Utilizes the lightweight Miniforge3 image.
- **Conda Environment**: Pre-configured Conda environment with essential data science and machine learning libraries.
- **Jupyter Notebook**: Easily run and manage your notebooks.
- **Environment Variables**: Securely handle API keys and tokens using environment variables.

### Included Libraries

- Python 3.8
- NumPy
- Pandas
- Scikit-learn
- TensorFlow
- PyTorch
- Transformers
- Jupyter
- Flask
- and more...

### How to Use

#### Prerequisites

- **Docker**: Ensure Docker is installed on your system.
- **.env File**: Create a `.env` file in your working directory to store your environment variables.

Example `.env` file:

```env
OPENAI_API_KEY=your_openai_api_key
HF_TOKEN=your_hf_token
```

#### Pull the Image

First, pull the image from Docker Hub:

```sh
docker pull jirvingphd/llm-env:latest
```

#### Run the Container

To start a container from this image, run the following command:

```sh
docker run --env-file .env -it --rm -p 8888:8888 jirvingphd/llm-env:latest
```

- `--env-file .env`: Loads environment variables from the `.env` file.
- `-it`: Runs the container in interactive mode.
- `--rm`: Automatically removes the container when it exits.
- `-p 8888:8888`: Maps port 8888 on the host to port 8888 in the container, allowing you to access Jupyter Notebook.

#### Access Jupyter Notebook

After running the container, you can access Jupyter Notebook by opening the provided URL (with the token) in your web browser. The URL will be output in the terminal where you ran the Docker command.

Example URL:

```
http://127.0.0.1:8888/?token=<your_token>
```

### Customization

If you need to modify or extend the environment, you can create a Dockerfile based on this image and add your own customizations.

Example Dockerfile:

```Dockerfile
FROM jirvingphd/llm-env:latest

# Add your customizations here

# Example: Install additional Python packages
RUN conda install -n llm_env some_additional_package
```

Build your custom image:

```sh
docker build -t my_custom_llm_env .
```

Run your custom image:

```sh
docker run --env-file .env -it --rm -p 8888:8888 my_custom_llm_env
```
___


```bash
docker run --env-file .env  -it --rm -p 8888:8888 llm_jupyter_app
```
