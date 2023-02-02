FROM python:3

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential python3-dev libcairo2-dev libpango1.0-dev ffmpeg python3-pip \
  texlive texlive-latex-extra \
  && pip3 install manim git-sim \
  && apt-get clean

WORKDIR /app

RUN groupadd --system --non-unique --gid 1000 gitsim \
 && useradd --no-log-init --system --no-create-home --home /app --non-unique --uid 1000 --gid gitsim gitsim \
 && chmod -R a+rX .

USER gitsim

ENTRYPOINT [ "git-sim", "--disable-auto-open" ]
CMD [ "-h" ]
