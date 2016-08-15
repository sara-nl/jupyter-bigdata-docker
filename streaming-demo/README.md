# Declarative widgets and dashboard Notebook environment

This stack is an adaptation of the [Docker stacks pyspark notebook](https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook). 

Declarative widgets and dashboards are added, as well as Spark 2.0.

The jupyter environment can be used to run a notebook like the [Streaming Meetups Dashboard] (https://github.com/jupyter-incubator/dashboards/blob/502384a40191fc0fa4f1447a72f8c6087c940a8f/etc/notebooks/stream_demo/meetup-streaming.ipynb). 

Note that you have to add an import of declarative widgets and run the init statement:
<pre><code>
import declarativewidgets
declarativewidgets.init()
</code></pre> 

Also note that in the Meetup ntebook you will get deprecation warnings. To get rid of these change the imports of urth.widgets into imports of declarativewidgets  
