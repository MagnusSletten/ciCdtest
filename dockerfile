
FROM python:3.8

WORKDIR /CICDTEST

COPY sort_data.py /CICDTEST/sort_data.py
COPY data.txt /CICDTEST/data.txt
COPY database.txt /CICDTEST/database.txt
COPY push_to_github.sh /CICDTEST/push_to_github.sh

RUN apt-get update && apt-get install -y git

RUN pip install pytest

RUN chmod +x /CICDTEST/push_to_github.sh

RUN echo "GH_TOKEN is set to: $GH_TOKEN"

CMD ["bash", "-c", "python /CICDTEST/sort_data.py && /CICDTEST/push_to_github.sh"]

