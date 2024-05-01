FROM quay.io/jupyter/base-notebook

USER root
# Generally, Dev Container Features assume that the non-root user (in this case jovyan)
# is in a group with the same name (in this case jovyan). So we must first make that so.
RUN groupadd jovyan \
    && usermod -g jovyan -a -G users jovyan

USER jovyan

# Download Terraform
RUN wget https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_amd64.zip

# Unzip
RUN unzip terraform_1.8.2_linux_amd64.zip

# Move the Terraform binary to /usr/local/bin/
RUN mv terraform /usr/local/bin/

# Clean up
RUN rm terraform_1.8.2_linux_amd64.zip
