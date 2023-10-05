# uses an official tensorflow runtime as a base image
FROM tensorflow/tensorflow:latest-gpu-py3-jupyter AS base

# sets the working directory to /tempdir
WORKDIR /tempdir

# copies your current local machine folder into the container at /tempdir
ADD . /tempdir

# installs any needed packages specified in requirements.txt
RUN pip install -r requirements.txt && rm -r /tempdir

# remove temporary folder
RUN rm -r /tempdir

# sets the working directory
# when you run the image you will get first into this directory
WORKDIR /notebooks

CMD ["jupyter-notebook", "--NotebookApp.notebook_dir=/notebooks",\
     "--ip=0.0.0.0", "--port=8888", "--allow-root"]





