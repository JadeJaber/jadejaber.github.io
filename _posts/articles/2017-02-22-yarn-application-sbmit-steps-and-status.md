---
published: false
layout: post
excerpt: Steps and states of Yarn application
categories: articles
tags:
  - yarn
share: true
---
Source : [https://hortonworks.com/blog/apache-hadoop-yarn-concepts-and-applications/](https://hortonworks.com/blog/apache-hadoop-yarn-concepts-and-applications/)

The application state in YARN can be one of “NEW”, “NEW_SAVING”, “SUBMITTED”, “ACCEPTED”, “RUNNING”, “FINISHED”, “FAILED”, “KILLED”

The general application flow for YARN is: 
1. Client contacts the Resource Manager and requests a new application ID. The RM sends back a application ID and total available resources. The application state is NEW.

2. Client contacts the Resource Manager(RM) with the details of the application it wants to run. RM accepts the request and the status is moved to NEW_SAVING RM then saves the job info into its state store. The state is now SUBMITTED.

3. RM then passes this info to the Scheduler. The scheduler a this stage will check if there are enough AM resources for the Queue and if the user has required permissions. If scheduler accepts the request, the application is moved to ACCEPTED The scheduler will schedule the application to be run. RM brokers and allocates resources for Application Master (AM) container and starts it. At this point the application has moved to RUNNING.

4. From here on its the AM who co-ordinates with the RM to broker resources for required container resources and checks back periodically with RM about the current status.

5. If the job finishes as expected, the status is set FINISHED otherwise FAILED.

6. If the client kills the job in between, the status is set to KILLED.




Now, to map this to the 8 execution steps in the image 
- Step 1 == NEW, NEW_SAVING, SUBMITTED
- Step 2 == ACCEPTED
- Steps 3,4,5,6 == RUNNING
- Steps 7 and 8 can be any of the end states of the application.


As for the resources I used to get that flow, it would help to go through the YARN REST APIs and the resource manager logs. The mapping between the phases becomes much more clearer once you go through the RM logs with the API docs next to you.
[YARN API](http://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/ResourceManagerRest.html#Cluster_Applications_APISubmit_Application)

