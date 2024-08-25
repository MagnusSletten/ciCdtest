FROM python 
WORKDIR /CICDTEST
COPY test_alwaysTrue.py /CICDTEST
COPY test_alwaysTrue.py/ CICDTEST
RUN pip install pytest 
CMD ["pytest", "test_alwaysTrue.py"]


