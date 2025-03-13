# Use official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root user to install dependencies
USER root

# Install necessary packages
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set Jenkins workspace as the working directory
WORKDIR /var/lib/jenkins/workspace/Jenkins-Test

# Clone your GitHub repository inside the Jenkins workspace
RUN git clone https://github.com/Waleed-khan1310/jenkins-test.git .

# Switch back to Jenkins user
USER jenkins

# Expose Jenkins default port
EXPOSE 8080

# Start Jenkins
CMD ["jenkins-agent"]
