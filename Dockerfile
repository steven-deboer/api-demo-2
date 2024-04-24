# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Twistlock
ADD twistlock_defender_app_embedded.tar.gz /twistlock
ENV DEFENDER_TYPE="appEmbedded"
ENV DEFENDER_APP_ID="applicatie-2"
ENV FILESYSTEM_MONITORING="false"
ENV WS_ADDRESS="wss://app0.cloud.twistlock.com:443"
ENV DATA_FOLDER="/twistlock"

# Run app.py when the container launches
CMD ["python", "app.py"]
