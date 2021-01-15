FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y procps

ADD apache-hive-3.1.2-bin.tar.gz /opt/

ENV HIVE_HOME /opt/apache-hive-3.1.2-bin
ENV PATH $HIVE_HOME/bin:$PATH

RUN rm /opt/apache-hive-3.1.2-bin/lib/guava-19.0.jar \
    && cp /opt/hadoop-3.2.1/share/hadoop/common/lib/guava-27.0-jre.jar $HIVE_HOME/lib/

ADD mysql-connector-java-8.0.22.jar $HIVE_HOME/lib/
ADD conf/hive-site.xml $HIVE_HOME/conf/

EXPOSE 9083 10000

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ADD run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/run.sh"]
