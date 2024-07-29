# Use the official Continuum Analytics Anaconda3 image
FROM continuumio/anaconda3

# Set the working directory in the container
WORKDIR /app
# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    libhdf5-dev
# Copy the current directory contents into the container at /app
COPY . /app

# Create and activate the environment from environment.yml
COPY environment.yml /app/
RUN conda env create -n llm-env -f environment.yml
RUN echo "source activate llm-env" > ~/.bashrc
RUN echo 'alias jnb="jupyter notebook"' >> ~/.bashrc
ENV PATH=/opt/conda/envs/llm-env/bin:$PATH

# install required packages from requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Expose the necessary ports
EXPOSE 8888 8501

# Define the command to run Jupyter Notebook or Streamlit
# CMD ["bash"]
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]