FROM alpine:3.9

# Install dependencies
RUN apk --no-cache add \
    build-base \
    git \
    libffi-dev \
    linux-headers \
    openssh \
    openssl-dev \
    py-pip \
    python3 \
    python3-dev \
    && pip3 install --upgrade pip

# Install ansible
RUN pip3 install ansible markupsafe

# Install cloud providers dependencies
RUN pip3 install boto3 boto dopy==0.3.5 "apache-libcloud>=1.5.0" linode-python pyrax

# Clone latest streisand code
RUN git clone https://github.com/jlund/streisand.git

WORKDIR /streisand

#CMD ["/bin/sh", "/streisand/streisand"]
