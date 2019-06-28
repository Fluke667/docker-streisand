FROM alpine:3.9

RUN apk --no-cache add \
# Streisand Depencies
    build-base \
    git \
    libffi-dev \
    linux-headers \
    openssh \
    openssl-dev \
    python3 \
    python3-dev \
    py3-pbr \
    && pip3 install --upgrade pip

# Install ansible
RUN pip3 install ansible markupsafe

# Install cloud providers dependencies
RUN pip3 install boto3 boto dopy==0.3.5 "apache-libcloud>=1.5.0" linode-python pyrax

# Clone latest streisand code
RUN git clone https://github.com/jlund/streisand.git

WORKDIR /streisand

CMD ["/bin/sh", "/streisand/streisand"]
